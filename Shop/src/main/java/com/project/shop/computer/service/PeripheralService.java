package com.project.shop.computer.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.project.shop.computer.vo.PeripheralVO;

public interface PeripheralService {
	
	//마우스 전체 조회
	Page<PeripheralVO> mouse(Pageable pageable, String searchType, String keyword, int peripheralCategory);
	
	//키보드 전체 조회
	Page<PeripheralVO> keyboard(Pageable pageable, String searchType, String keyword, int peripheralCategory);
	
	//모니터 전체 조회
	Page<PeripheralVO> monitor(Pageable pageable, String searchType, String keyword, int peripheralCategory);
	
	//마우스, 키보드, 모니터 전체 개수 조회
	int count(String searchType, String keyword, int peripheralCategory);
	
	//마우스, 키보드, 모니터 단건 조회
	PeripheralVO peripheralPost(HashMap<String, Object> map);
	
	int peripheralInsert(PeripheralVO vo);
	
	//마우스 높은 가격순 조회
	Page<PeripheralVO> mouseHighPrice(Pageable pageable, String searchType, String keyword, int peripheralCategory);
	
	//마우스 낮은 가격순 조회
	Page<PeripheralVO> mouseLowPrice(Pageable pageable, String searchType, String keyword, int peripheralCategory);
	
	//키보드 높은 가격순 조회
	Page<PeripheralVO> keyboardHighPrice(Pageable pageable, String searchType, String keyword, int peripheralCategory);
	
	//키보드 낮은 가격순 조회
	Page<PeripheralVO> keyboardLowPrice(Pageable pageable, String searchType, String keyword, int peripheralCategory);
	
	//모니터 높은 가격순 조회
	Page<PeripheralVO> monitorHighPrice(Pageable pageable, String searchType, String keyword, int peripheralCategory);
	
	//모니터 낮은 가격순 조회
	Page<PeripheralVO> monitorLowPrice(Pageable pageable, String searchType, String keyword, int peripheralCategory);

	Page<PeripheralVO> peripheralmanager(Pageable pageable, String searchType, String keyword);

	int peripheralcount(String searchType, String keyword);
}
