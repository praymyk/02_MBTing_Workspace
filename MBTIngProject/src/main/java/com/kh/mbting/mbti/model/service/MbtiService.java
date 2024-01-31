package com.kh.mbting.mbti.model.service;

import java.util.ArrayList;

import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.mbti.model.vo.Mbti;
import com.kh.mbting.member.model.vo.Member;

public interface MbtiService {

    int updateMbti(Mbti mbti);
    
    ArrayList<Mbti> selectMatchList(Member loginMember);
    
    ArrayList<Mbti> selectRandomList(Member loginMember);

    int updateMatchRequestList(Member loginMember);
    
    int insertMatchRequestList(Member loginMember);

	Member updateMember(Member loginMember);

	int updateMemberCoin(Member loginMember);

    
}
