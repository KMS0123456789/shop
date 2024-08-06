package com.project.shop.computer.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.computer.repository.ComputerRepository;
import com.project.shop.computer.service.ComputerService;

@Service
public class ComputerServiceImpl implements ComputerService{
	
	@Autowired
	private ComputerRepository repository;
}
