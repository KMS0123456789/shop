package com.project.shop.progress.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.progress.repository.KeepRepository;
import com.project.shop.progress.service.KeepService;
import com.project.shop.user.vo.UserVO;

@Service
public class KeepServiceImpl implements KeepService{
	
	@Autowired
	private KeepRepository repository;

	@Override
	public int keepComputer(HashMap<String, Object> map) {
		return repository.keepComputer(map);
	}

	@Override
	public int keepDeleteComputer(HashMap<String, Object> map) {
		return repository.keepDeleteComputer(map);
	}

}
