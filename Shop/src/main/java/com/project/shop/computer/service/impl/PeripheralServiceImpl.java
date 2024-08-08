package com.project.shop.computer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.project.shop.computer.repository.PeripheralRepository;
import com.project.shop.computer.service.PeripheralService;
import com.project.shop.computer.vo.PeripheralVO;

@Service
public class PeripheralServiceImpl implements PeripheralService{
	
	@Autowired
	private PeripheralRepository repository;

	//마우스 전체 조회
	@Override
	public Page<PeripheralVO> mouse(Pageable pageable, String searchType, String keyword, int peripheralCategory) {
		return repository.mouse(pageable, searchType, keyword, peripheralCategory);
	}

	//키보드 전체 조회
	@Override
	public Page<PeripheralVO> keyboard(Pageable pageable, String searchType, String keyword, int peripheralCategory) {
		return repository.keyboard(pageable, searchType, keyword, peripheralCategory);
	}

	//모니터 전체 조회
	@Override
	public Page<PeripheralVO> monitor(Pageable pageable, String searchType, String keyword, int peripheralCategory) {
		return repository.monitor(pageable, searchType, keyword, peripheralCategory);
	}

	//마우스, 키보드 , 모니터 전체 개수 조회
	@Override
	public int count(String searchType, String keyword, int peripheralCategory) {
		return repository.count(searchType, keyword, peripheralCategory);
	}

	
}
