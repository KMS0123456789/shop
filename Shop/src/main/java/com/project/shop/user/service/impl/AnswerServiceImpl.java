package com.project.shop.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.user.repository.AnswerRepository;
import com.project.shop.user.service.AnswerService;
import com.project.shop.user.vo.AnswerVO;
import com.project.shop.user.vo.QuestionVO;

@Service
public class AnswerServiceImpl implements AnswerService{
	
	@Autowired
	private AnswerRepository repository;
	
	//QnA 답변
	@Override
	public int answerwrite(AnswerVO vo) {
		return repository.answerwrite(vo);
	}
}
