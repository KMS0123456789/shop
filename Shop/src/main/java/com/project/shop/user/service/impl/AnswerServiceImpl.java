package com.project.shop.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.user.repository.AnswerRepository;
import com.project.shop.user.service.AnswerService;

@Service
public class AnswerServiceImpl implements AnswerService{
	
	@Autowired
	private AnswerRepository repository;
}
