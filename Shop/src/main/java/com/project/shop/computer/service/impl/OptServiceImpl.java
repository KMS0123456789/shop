package com.project.shop.computer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.computer.repository.OptRepository;
import com.project.shop.computer.service.OptService;
import com.project.shop.computer.vo.OptVO;

@Service
public class OptServiceImpl implements OptService{
	
	@Autowired
	private OptRepository repository;

	//repository의 computerPost 메서드 실행
	@Override
	public List<OptVO> computerPost() {
		return repository.computerPost();
	}
}
