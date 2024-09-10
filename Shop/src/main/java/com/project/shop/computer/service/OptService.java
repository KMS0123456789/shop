package com.project.shop.computer.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.project.shop.computer.vo.OptVO;

//옵션 전체 조회
public interface OptService {
	List<OptVO> computerPost();
	
	int optionInsert(OptVO vo);
	
	Page<OptVO> optList(Pageable pageable, String searchType, String keyword);
	
	//ask 전체 개수 조회
	int optCount(String searchType, String keyword);
	
	int optDelete(OptVO vo);
}
