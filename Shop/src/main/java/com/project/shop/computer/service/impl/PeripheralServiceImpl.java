package com.project.shop.computer.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.computer.repository.PeripheralRepository;
import com.project.shop.computer.service.PeripheralService;

@Service
public class PeripheralServiceImpl implements PeripheralService{
	
	@Autowired
	private PeripheralRepository repository;
}
