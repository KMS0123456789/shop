package com.project.shop.user.service;

import java.util.List;

import com.project.shop.user.vo.QuestionVO;

public interface QuestionService {
	//question 전체 조회
	List<QuestionVO> questionAll();
	
	//완제품 상세페이지에서 문의글 쓰기
	int questionComputer(QuestionVO vo);
	
	//주변기기 상세페이지에서 문의글 쓰기
	int questionPeripheral(QuestionVO vo);
}
