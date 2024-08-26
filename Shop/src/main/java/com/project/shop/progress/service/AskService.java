package com.project.shop.progress.service;

import java.util.List;

import com.project.shop.progress.vo.AskVO;

	public interface AskService {
		//ask 전체 조회
		List<AskVO> askAll();
		
		List<AskVO> myOnedate();
		
		List<AskVO> computerPost(int computerNo);
		
		List<AskVO> peripheralPost(int peripheralNo);
	}
	
