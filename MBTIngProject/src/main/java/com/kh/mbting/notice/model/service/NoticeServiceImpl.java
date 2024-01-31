package com.kh.mbting.notice.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.notice.model.dao.NoticeDao;
import com.kh.mbting.notice.model.vo.Notice;

@Service
@EnableTransactionManagement
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		
		return noticeDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		
		return noticeDao.selectList(sqlSession, pi);
	}

	@Override
	@Transactional
	public int insertNotice(Notice n) {

		return noticeDao.insertNotice(sqlSession, n);
		
	}

	@Override
	@Transactional
	public int increaseCount(int noticeNo) {
		
		return noticeDao.increaseCount(sqlSession, noticeNo);
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		
		return noticeDao.selectNotice(sqlSession, noticeNo);
	}

	@Override
	@Transactional
	public int deleteNotice(int noticeNo) {
		
		return noticeDao.deleteNotice(sqlSession, noticeNo);
	}

	@Override
	@Transactional
	public int updateNotice(Notice n) {
		
		return noticeDao.updateNotice(sqlSession, n); 
	}
	//
	@Override
	public int searchListCount(String keyword) {
       
		return noticeDao.searchListCount(sqlSession, keyword);
    }

	@Override
	public List<Notice> searchList(String keyword, int currentPage, int pageLimit, int boardLimit) {
       
		return noticeDao.searchList(sqlSession, keyword, currentPage, pageLimit, boardLimit);
    }

	@Override
	@Transactional
	public int updateViews(int noticeNo) {

		return noticeDao.updateViews(sqlSession, noticeNo);
	}

	@Override
	public ArrayList<Notice> selectListMember(PageInfo pi) {
		
		return noticeDao.selectList(sqlSession, pi);
	}

	@Override
	public Notice selectNoticeMember(int noticeNo) {
	    return noticeDao.selectNotice(sqlSession, noticeNo);
	}

	@Override
	public List<Notice> searchMember(String keyword, int currentPage, int boardLimit, int pageLimit) {
		return noticeDao.searchList(sqlSession, keyword, currentPage, pageLimit, boardLimit);
	}


	
	

	
}
