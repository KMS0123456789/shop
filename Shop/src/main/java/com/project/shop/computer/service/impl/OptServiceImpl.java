package com.project.shop.computer.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.computer.repository.OptRepository;
import com.project.shop.computer.service.OptService;

@Service
public class OptServiceImpl implements OptService{
	
	@Autowired
	private OptRepository repository;
}
