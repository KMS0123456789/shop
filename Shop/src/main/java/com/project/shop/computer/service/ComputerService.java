package com.project.shop.computer.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import com.project.shop.computer.vo.ComputerVO;

public interface ComputerService {
	//완제품 전체 조회
	Page<ComputerVO> computer(Pageable pageable, String searchType, String keyword);
	
	//완제품 전체 개수 조회
	int count(String searchType, String keyword);
	
	//완제품 단건 조회
	ComputerVO computerPost(int computerNo);
	
	//완제품 인서트
	int computerInsert(ComputerVO vo);
}
