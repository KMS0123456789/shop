package com.project.shop.progress.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.progress.repository.KeepRepository;
import com.project.shop.progress.service.KeepService;

@Service
public class KeepServiceImpl implements KeepService{
	
	@Autowired
	private KeepRepository repository;
}
