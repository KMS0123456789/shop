package com.project.shop.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.user.repository.ReviewRepository;
import com.project.shop.user.service.ReviewService;
import com.project.shop.user.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewRepository repository;

	@Override
	public int reviewComputer(ReviewVO vo) {
		return repository.reviewComputer(vo);
	}
	
	@Override
	public int reviewPeripheral(ReviewVO vo) {
		return repository.reviewPeripheral(vo);
	}
}
