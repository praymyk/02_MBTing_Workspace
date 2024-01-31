package com.kh.mbting.pay.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mbting.member.model.vo.Member;
import com.kh.mbting.pay.vo.KakaoPay;

@Repository
public class KakaoPayDao {

	public int insertPay(SqlSessionTemplate sqlSession, KakaoPay kp) {
		return sqlSession.insert("kakaoPayMapper.insertPay", kp);
	}

	public String getPartnerOrder(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("kakaoPayMapper.getPartnerOrder", email);
	}

	public int insertPgToken(SqlSessionTemplate sqlSession, KakaoPay kp) {
		return sqlSession.update("kakaoPayMapper.insertPgToken", kp);
	}

	public int insertTid(SqlSessionTemplate sqlSession, KakaoPay kp) {
		return sqlSession.update("kakaoPayMapper.insertTid", kp);
	}

	public String itemName(SqlSessionTemplate sqlSession, String pg_token) {
		return sqlSession.selectOne("kakaoPayMapper.itemName", pg_token);
	}
	public int insertCoinX5(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("kakaoPayMapper.insertCoinX5", m);
	}
	public int insertCoinX10(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("kakaoPayMapper.insertCoinX10", m);
	}

	public int refundRequest(SqlSessionTemplate sqlSession, KakaoPay kp) {
		return sqlSession.update("kakaoPayMapper.refundRequest", kp);
	}





}
