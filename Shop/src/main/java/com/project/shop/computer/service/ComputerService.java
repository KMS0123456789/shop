package com.project.shop.computer.service;

import java.util.HashMap;
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
	ComputerVO computerPost(HashMap<String, Object> map);
	
	//완제품 인서트
	int computerInsert(ComputerVO vo);
	
	//완제품 높은 가격순 조회
	Page<ComputerVO> computerHighPrice(Pageable pageable, String searchType, String keyword);
	
	//완제품 낮은 가격순 조회
	Page<ComputerVO> computerLowPrice(Pageable pageable, String searchType, String keyword);
	
	Page<ComputerVO> search(Pageable pageable, String keyword);

	Page<ComputerVO> computerManager(Pageable pageable, String searchType, String keyword);
	
	Page<ComputerVO> computerList(Pageable pageable, String searchType, String keyword);

	int computerDelete(ComputerVO vo);
	
}
