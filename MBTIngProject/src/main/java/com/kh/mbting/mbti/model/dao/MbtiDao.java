package com.kh.mbting.mbti.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.mbti.model.vo.Mbti;
import com.kh.mbting.member.model.vo.Member;

@Repository
public class MbtiDao {

	public int updateMbti(SqlSessionTemplate sqlSession, Mbti mbti) {
		return sqlSession.update("mbtiMapper.updateMbti", mbti);
	}
	
	public ArrayList<Mbti> selectMatchList(SqlSession sqlSession, Member loginMember) {
		return (ArrayList)sqlSession.selectList("mbtiMapper.selectMatchList", loginMember);
	}
	
	public ArrayList<Mbti> selectRandomList(SqlSession sqlSession, Member loginMember) {
		return (ArrayList)sqlSession.selectList("mbtiMapper.selectRandomList", loginMember);
	}
	
	public int updateMatchRequestList(SqlSession sqlSession, Member loginMember) {
		return sqlSession.update("mbtiMapper.updateMatchRequestList", loginMember);
	}
	
	public int insertMatchRequestList(SqlSession sqlSession, Member loginMember) {
		return sqlSession.insert("memberMapper.insertMatchRequestList", loginMember);
	}

	public Member updateMember(SqlSessionTemplate sqlSession, Member loginMember) {
		return sqlSession.selectOne("mbtiMapper.updateMember", loginMember);
	}

    public int updateMemberCoin(SqlSessionTemplate sqlSession, Member loginMember) {
        return sqlSession.update("mbtiMapper.updateMemberCoin", loginMember);
    }

}
