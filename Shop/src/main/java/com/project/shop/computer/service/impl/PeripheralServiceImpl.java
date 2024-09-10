package com.project.shop.computer.service.impl;

import java.util.HashMap;
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
	
	//마우스, 키보드, 모니터 단건 조회
	@Override
	public PeripheralVO peripheralPost(HashMap<String, Object> map) {
		return repository.peripheralPost(map);
	}
	
	@Override
	public int peripheralInsert(PeripheralVO vo) {
		return repository.peripheralInsert(vo);
	}
	
	//마우스 가격 높은순 조회
	@Override
	public Page<PeripheralVO> mouseHighPrice(Pageable pageable, String searchType, String keyword, int peripheralCategory) {
		return repository.mouseHighPrice(pageable, searchType, keyword, peripheralCategory);
	}
	
	//마우스 가격 낮은순 조회
	@Override
	public Page<PeripheralVO> mouseLowPrice(Pageable pageable, String searchType, String keyword, int peripheralCategory) {
		return repository.mouseLowPrice(pageable, searchType, keyword, peripheralCategory);
	}
	
	//키보드 가격 높은순 조회
	@Override
	public Page<PeripheralVO> keyboardHighPrice(Pageable pageable, String searchType, String keyword, int peripheralCategory) {
		return repository.keyboardHighPrice(pageable, searchType, keyword, peripheralCategory);
	}
	
	//키보드 가격 낮은순 조회
	@Override
	public Page<PeripheralVO> keyboardLowPrice(Pageable pageable, String searchType, String keyword, int peripheralCategory) {
		return repository.keyboardLowPrice(pageable, searchType, keyword, peripheralCategory);
	}
	
	//모니터 가격 높은순 조회
	@Override
	public Page<PeripheralVO> monitorHighPrice(Pageable pageable, String searchType, String keyword, int peripheralCategory) {
		return repository.monitorHighPrice(pageable, searchType, keyword, peripheralCategory);
	}
	
	//모니터 가격 낮은순 조회
	@Override
	public Page<PeripheralVO> monitorLowPrice(Pageable pageable, String searchType, String keyword, int peripheralCategory) {
		return repository.monitorLowPrice(pageable, searchType, keyword, peripheralCategory);
	}
	
	@Override
	public Page<PeripheralVO> peripheralmanager(Pageable pageable , String searchType, String keyword) {
		// TODO Auto-generated method stub
		return repository.peripheralmanager(pageable, searchType, keyword);
	}

	@Override
	public int peripheralcount(String searchType, String keyword) {
		// TODO Auto-generated method stub
		return repository.peripheralcount(searchType, keyword);
	}
	
	@Override
	public Page<PeripheralVO> peripheralList(Pageable pageable, String searchType, String keyword) {
		return repository.peripheralList(pageable, searchType, keyword); //ComputerRepository의 메서드 computer 실행
	}
	@Override
	public int peripheralDelete(PeripheralVO vo) {
		return repository.peripheralDelete(vo);
	}	
}
