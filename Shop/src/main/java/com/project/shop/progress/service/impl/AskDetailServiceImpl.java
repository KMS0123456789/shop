package com.project.shop.progress.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.progress.repository.AskDetailRepository;
import com.project.shop.progress.service.AskDetailService;
import com.project.shop.progress.vo.AskDetailVO;

@Service
public class AskDetailServiceImpl implements AskDetailService{
	
	@Autowired
	private AskDetailRepository repository;
	
}
