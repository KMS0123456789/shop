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
	
	@Override
    public List<QuestionVO> questionAll() {
        return repository.questionAll();  
    }
}
