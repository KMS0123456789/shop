package com.project.shop.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.user.repository.QuestionRepository;
import com.project.shop.user.service.QuestionService;

@Service
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	private QuestionRepository repository;
}
