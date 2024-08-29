package com.project.shop.computer.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.project.shop.computer.repository.ComputerRepository;
import com.project.shop.computer.service.ComputerService;
import com.project.shop.computer.vo.ComputerVO;

@Service
public class ComputerServiceImpl implements ComputerService{
	
	@Autowired
	private ComputerRepository repository;

	//완제품 전체 조회
	@Override
	public Page<ComputerVO> computer(Pageable pageable, String searchType, String keyword) {
		return repository.computer(pageable, searchType, keyword); //ComputerRepository의 메서드 computer 실행
	}
	
	//완제품 전체 개수 조회
	@Override
	public int count(String searchType, String keyword) {
		return repository.count(searchType, keyword); //ComputerRepository의 메서드 count 실행
	}
	
	//완제품 단건 조회
	@Override
	public ComputerVO computerPost(HashMap<String, Object> map) {
		return repository.computerPost(map);
	}
	
	//완제품 인서트
	@Override
	public int computerInsert(ComputerVO vo) {
		return repository.computerInsert(vo);
	}
	
	//완제품 높은 가격순 조회
	@Override
	public Page<ComputerVO> computerHighPrice(Pageable pageable, String searchType, String keyword) {
		return repository.computerHighPrice(pageable, searchType, keyword); //ComputerRepository의 메서드 computerHighPrice 실행
	}
	
	//완제품 낮은 가격순 조회
	@Override
	public Page<ComputerVO> computerLowPrice(Pageable pageable, String searchType, String keyword) {
		return repository.computerLowPrice(pageable, searchType, keyword); //ComputerRepository의 메서드 computerHighPrice 실행
	}
}
