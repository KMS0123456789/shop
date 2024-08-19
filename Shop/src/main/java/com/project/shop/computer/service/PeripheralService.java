package com.project.shop.computer.service;

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
	PeripheralVO peripheralPost(int peripheralNo);
	
	int peripheralInsert(PeripheralVO vo);
}
