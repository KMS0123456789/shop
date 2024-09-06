package com.project.shop.user.service;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.project.shop.user.vo.QuestionVO;
import com.project.shop.user.vo.UserVO;

public interface QuestionService {
	//question 페이징 기능
	Page<QuestionVO> managerQnA(Pageable pageable, String searchType, String keyword);
	
	//question 전체 개수 조회
	int count(String searchType, String keyword);
	
	//question 유저별 개수 조회
	int mycount(String searchType, String keyword,  String email);
	
	//완제품 상세페이지에서 문의글 쓰기
	int questionComputer(QuestionVO vo);
	
	//주변기기 상세페이지에서 문의글 쓰기
	int questionPeripheral(QuestionVO vo);
	
	//QnA 상세페이지
	QuestionVO questionPost(int questionNo);
	
	// 질문 조회하는 메서드
	Page<QuestionVO> myquestion(Pageable pageable, String searchType, String keyword, String email);
	
	int questionUpdate(QuestionVO qvo);
}
