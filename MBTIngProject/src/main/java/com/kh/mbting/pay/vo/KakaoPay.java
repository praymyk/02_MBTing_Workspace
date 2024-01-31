package com.kh.mbting.pay.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class KakaoPay {
	
	private String partnerOrderId;		//	PARTNER_ORDER_ID	NUMBER
	private String tid;				//	TID	VARCHAR2(20 BYTE)
	private String cid;				//	CID	VARCHAR2(20 BYTE)
	private String partnerUserId;	//	PARTNER_USER_ID	NUMBER
	private String itemName;		//	ITEM_NAME	VARCHAR2(20 BYTE)
	private String payMethod;		//	PAY_METHOD	VARCHAR2(20 BYTE)
	private int quantity;			//	QUANTITY	NUMBER
	private String orderDate;		//	ORDER_DATE	DATE
	private String refundDate;		//	REFUND_DATE	DATE
	private int totalAmount;		//	TOTAL_AMOUNT	NUMBER
	private int	taxFreeAmount;		//	TAX_FREE_AMOUNT	NUMBER
	private String pg_token;
	private int refundRequest;	//REFUND_REQUEST (1: 결제 후 대기, 2: 환불 신청 상태, 3: 환불 거절)   
}
