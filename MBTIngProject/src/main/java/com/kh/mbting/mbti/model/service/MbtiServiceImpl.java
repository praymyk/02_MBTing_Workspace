package com.kh.mbting.mbti.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mbting.mbti.model.dao.MbtiDao;
import com.kh.mbting.mbti.model.vo.Mbti;
import com.kh.mbting.member.model.vo.Member;

@Service
public class MbtiServiceImpl implements MbtiService {

    @Autowired

    private SqlSessionTemplate sqlSession;
    
    @Autowired
    private MbtiDao mbtiDao;

    @Override
    public int updateMbti(Mbti mbti) {
        return mbtiDao.updateMbti(sqlSession, mbti);
    }

	@Override
	public ArrayList<Mbti> selectMatchList(Member loginMember) {
		return mbtiDao.selectMatchList(sqlSession, loginMember);
	}
	
	@Override
	public ArrayList<Mbti> selectRandomList(Member loginMember) {
		return mbtiDao.selectRandomList(sqlSession, loginMember);
	}
	
	@Override
	public int updateMatchRequestList(Member loginMember) {
		return mbtiDao.updateMatchRequestList(sqlSession, loginMember);
	}
	
	@Override
	public int insertMatchRequestList(Member loginMember) {
		return mbtiDao.insertMatchRequestList(sqlSession, loginMember);
	}
	
	@Override
	public Member updateMember(Member loginMember) {
		return mbtiDao.updateMember(sqlSession, loginMember);
	}
	
	@Override
	public int updateMemberCoin(Member loginMember) {
		return mbtiDao.updateMemberCoin(sqlSession, loginMember);
	}
	
	
	
	
	
	
	
}