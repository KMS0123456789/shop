package com.project.shop.progress.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.progress.repository.AskRepository;
import com.project.shop.progress.service.AskService;

@Service
public class AskServiceImpl implements AskService{
	
	@Autowired
	private AskRepository repository;
}
