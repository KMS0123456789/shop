package com.project.shop.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.project.shop.user.repository.ReviewRepository;
import com.project.shop.user.service.ReviewService;
import com.project.shop.user.vo.ReviewVO;
import com.project.shop.user.vo.UserVO;

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
	
	@Override
	public Page<ReviewVO> myreview(Pageable pageable , String searchType, String keyword, String email) {
		// TODO Auto-generated method stub
		return repository.myreview(pageable, searchType, keyword, email);
	}

	@Override
	public int mycount(String searchType, String keyword, String email) {
		// TODO Auto-generated method stub
		return repository.mycount(searchType, keyword, email);
	}

}
