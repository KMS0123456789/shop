package com.project.shop.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.project.shop.user.repository.QuestionRepository;
import com.project.shop.user.service.QuestionService;
import com.project.shop.user.vo.QuestionVO;

@Service
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	private QuestionRepository repository;
	
	//question 페이징 기능
	@Override
	public Page<QuestionVO> managerQnA(Pageable pageable, String searchType, String keyword) {
		return repository.managerQnA(pageable, searchType, keyword); //ComputerRepository의 메서드 managerQnA 실행
	}
	
	//question 전체 개수 조회
	@Override
	public int count(String searchType, String keyword) {
		return repository.count(searchType, keyword); //ComputerRepository의 메서드 count 실행
	}

	//완제품 상세페이지에서 문의글 쓰기
	@Override
	public int questionComputer(QuestionVO vo) {
		//QuestionRepository의 메서드 questionComputer 실행 QuestionVO vo 파라미터로 같이 보내기
		return repository.questionComputer(vo);
	}
	
	//주변기기 상세페이지에서 문의글 쓰기
	@Override
	public int questionPeripheral(QuestionVO vo) {
		//QuestionRepository의 메서드 questionPeripheral 실행 QuestionVO vo 파라미터로 같이 보내기
		return repository.questionPeripheral(vo);
	}
	
	//question 상세페이지 조회
	@Override
	public QuestionVO questionPost(int questionNo) {
		//QuestionRepository의 메서드 questionPost 실행 int questionNo 파라미터도 같이 보낸다.
		return repository.questionPost(questionNo);
	}
}
