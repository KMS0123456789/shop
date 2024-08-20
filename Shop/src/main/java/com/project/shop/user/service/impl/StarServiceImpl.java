package com.project.shop.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.user.repository.StarRepository;
import com.project.shop.user.service.StarService;
import com.project.shop.user.vo.StarVO;

@Service
public class StarServiceImpl implements StarService{
	
	@Autowired
	private StarRepository repository;

	@Override
	public int starComputer(StarVO vo) {
		return repository.starComputer(vo);
	}
	
}
