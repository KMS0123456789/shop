package com.project.shop.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.user.repository.QuestionRepository;
import com.project.shop.user.service.QuestionService;
import com.project.shop.user.vo.QuestionVO;

@Service
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	private QuestionRepository repository;
	
	//question 전체 조회
	@Override
    public List<QuestionVO> questionAll() {
        return repository.questionAll();   //QuestionRepository에서 questionAll 메서드 실행
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
}
