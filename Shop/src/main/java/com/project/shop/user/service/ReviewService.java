package com.project.shop.user.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.project.shop.user.vo.ReviewVO;
import com.project.shop.user.vo.UserVO;

public interface ReviewService {
	int reviewComputer(ReviewVO vo);
	
	int reviewPeripheral(ReviewVO vo);
	
	// 특정유저 리뷰 조회하는 메서드
	int mycount(String searchType, String keyword, String email );
	
	// 리뷰 조회하는 메서드
	Page<ReviewVO> myreview(Pageable pageable, String searchType, String keyword, String email);
}
