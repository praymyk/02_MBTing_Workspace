package com.kh.mbting.pay.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mbting.member.model.service.MemberService;
import com.kh.mbting.member.model.vo.Member;
import com.kh.mbting.pay.model.service.KakaoPayService;
import com.kh.mbting.pay.vo.KakaoPay;

@Controller
public class KakaoPayController {
	
	@Autowired	
	private KakaoPayService kakaoPayService; 
	
	@Autowired	
	private MemberService memberService; 

	@RequestMapping(value="pay.me", produces = "text/xml; charset=UTF-8")
	@ResponseBody
	public String kakaoPay(KakaoPay kp, HttpSession session) throws IOException{
		
		String url="https://kapi.kakao.com/v1/payment/ready";
				
		// 카카오 페이와 통신하기 위한 주소 객체 생성
		URL requestUrl = new URL(url);
		
		// url 주소를 넘기면서 카카오 페이와 서버 연결
		HttpURLConnection urlConnection
		= (HttpURLConnection)requestUrl.openConnection();
		
		// 카카오페이 요청사항 처리
		// 1. POST 방식으로 연결
		urlConnection.setRequestMethod("POST");
		// 2. Authorization 키 넘기기
		urlConnection.setRequestProperty("Authorization", "KakaoAK 5202c0b22c8b4e8caf0ba17209825b7b");
		// 3. Content-type 넘기기
		urlConnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		// 서버에게 전해줄 정보가 있을 경우 DoOutPut(true)를 넣어준다
		urlConnection.setDoOutput(true);
		
		// step1. 결제 시도 시 결제 상품의 정보와 회원 정보를 카카오 톡에 넘기면서 DB에 결제 테이블 생성
		// 결제 시도 시 결제 테이블 데이터 생성하기 ( 결제 시도 상품의 기본 정보 담기 )

		String partner_order_id = "";
		// 결제 정보를 db로 넘기는 부분
		int cResult = kakaoPayService.insertPay(kp);
		if(cResult > 0 ) { //결제 테이블 생성에 성공했을 경우
			
			// 생성된 결제 테이블로 부터 가맹점 주문번호 받아오기 
			partner_order_id = kakaoPayService.getPartnerOrder(kp.getPartnerUserId());
			System.out.println("오더아이디" + partner_order_id);
			// 세션에 가맹점 주문번호 담아 두기 = > 결제 시도시 세션이 생성되므로 자바 스크립트에 없는 값이 입려되는 꼴이 되서 실패한 방법
		}
				
		String parameter = "cid=TC0ONETIME&"								// cid
				+ "partner_order_id="+partner_order_id+"&"					// 가맹점 주문번호
				+ "partner_user_id="+kp.getPartnerUserId()+"&"				// 가맹점 회원 id
				+ "item_name="+kp.getItemName()+"&"							// 상품명
				+ "quantity="+kp.getQuantity()+"&"							// 상품 수량
				+ "total_amount="+kp.getTotalAmount()+"&"					// 상품 총액
				+ "tax_free_amount="+kp.getTaxFreeAmount()+"&"					// 비과세 금액
				+ "approval_url=http://192.168.40.37:8081/mbting/kakaoPaySuccess?partner_order_id="+ partner_order_id +"&"  // 결제 성공시 리다이렉트 URL
				+ "cancel_url=http://192.168.40.37:8081/mbting/myPay.me&"		// 결제 취소시 리다이렉트 URL
				+ "fail_url=http://192.168.40.37:8081/mbting/myPay.me";		// 결제 실패시 리다이렉트 URL
		
		// 서버에 위의 값을 넘겨 줄 때 필요한 스트림 객체 생성
		OutputStream outputStream = urlConnection.getOutputStream();
		// 데이터를 넘기기 때문에 데이터 아웃풋 스트림이 추가로 필요
		DataOutputStream dataOutSteam = new DataOutputStream(outputStream);
		
		// writeBytes()는 
		// parameter에 담긴 값을 bytes 형식으로 형변환 한 뒤 데이터 아웃풋 스트림에게 넘겨줌
		dataOutSteam.writeBytes(parameter);
		dataOutSteam.close();	
		// close를 할때 flush() 가 함께 실행되어 들고 있던 parameter 값을 카카오에 넘김
		
		// 전송 결과 확인
		int result = urlConnection.getResponseCode();
	
		// 카카오 측으로 부터 정보를 받을 수 있도록 준비
		InputStream inputStream;
		
		// HTTP 코드에서 정상적인 통신은 200값을 가짐
		if(result == 200) {		// 성공 시
			inputStream = urlConnection.getInputStream();
			//System.out.println("결제 요청/ 바코드 노출 순간 tid 발급 됨");
			//Tid 발급 받을 시 해당 주문번호 건에 저장하기 위해 주문번호 session에 저장
			
		} else {	// 실패 시
			inputStream = urlConnection.getErrorStream();
		}
		
		// 받은 정보를 읽을 수 있는 객체 생성
		BufferedReader br 
		= new BufferedReader(
				new InputStreamReader(
						urlConnection.getInputStream()));

		// System.out.println("리드라인"+br.readLine());
		String line;
		// line = br.readLine();
		// System.out.println("문자열"+line);		
		String responseText = "";
		
		
		while((line = br.readLine()) != null) {
			
			responseText += line;
		}
		
		br.close();
		urlConnection.disconnect();
		
		// 응답데이터를 ajax 요청했던 곳으로 보내주고자 한다면
		// 굳이 ArrayList 로 내가 직접 파싱할 필요 없이
		// JSON 형태를 바로 보내주면 됨!!
		return responseText;
	}
	
	@RequestMapping(value="payTry.me")
	public String kakaoPayTid(KakaoPay kp) {
		// Tid 값 저장 위해 order_id 값 받아오기(카카오페이 결제 테이블 중 최 상단 컬럼)
		String partner_order_id = kakaoPayService.getPartnerOrder(kp.getPartnerUserId());
		kp.setPartnerOrderId(partner_order_id);
		// tid 값 결제 테이블에 저장
		int result = kakaoPayService.insertTid(kp);
		
		
		return null;
	}
	
	@RequestMapping(value="/kakaoPaySuccess")
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token,
			@RequestParam("partner_order_id") String partner_order_id,
			HttpSession session) {
		
		KakaoPay kp = new KakaoPay();
		kp.setPg_token(pg_token);
		kp.setPartnerOrderId(partner_order_id);
		
		int result = kakaoPayService.insertPgToken(kp);
		
		
		// 결제에 성공했을경우 Mbting 코인 추가
		if(result > 0) {
			
			// step1 결제된 아이템 이름 받기 
			String itemName = kakaoPayService.itemName(pg_token);
			// step2 코인을 지급할 사용자 아이디 받기
			Member m = (Member)session.getAttribute("loginMember");
			System.out.println(m);
			
			switch (itemName) {
			
			case "MBTIngCoinx5" : 
				int insertCoinX5 = kakaoPayService.insertCoinX5(m);
				
				// 결제 성공시 로그인 세션에 정보 갱신해주기
				if(insertCoinX5 > 0) {
					Member updateMem = memberService.loginMember(m);
					session.setAttribute("loginMember", updateMem);
				}
				
				break;
			case "MBTIngCoinx10" :
				int insertCoinX10 = kakaoPayService.insertCoinX10(m);
				
				// 결제 성공시 로그인 세션에 정보 갱신해주기
				if(insertCoinX10 > 0) {
					Member updateMem = memberService.loginMember(m);
					session.setAttribute("loginMember", updateMem);
				}
				break;
			}	
		}
		
		return "redirect:/myPay.me";
	}
	
	// 환불 요청용 메소드
	@ResponseBody
	@RequestMapping(value="refundRequest.me", produces="text/html; charset=UTF-8")
	public String refundRequest(KakaoPay kp) {
		System.out.println(kp);
		int result = kakaoPayService.refundRequest(kp);
		String message="";
		System.out.println(result);
		if(result > 0) {
			
			message= "환불 신청 성공";
		} else {
			
			message= "환불 신청 실패";
		}
		
		return message;
	}
	
}