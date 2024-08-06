package com.project.shop.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.user.repository.QnARepository;
import com.project.shop.user.service.QnAService;

@Service
public class QnAServiceImpl implements QnAService{
	
	@Autowired
	private QnARepository repository;
}
