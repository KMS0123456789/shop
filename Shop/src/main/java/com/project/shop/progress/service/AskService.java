package com.project.shop.progress.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.project.shop.progress.vo.AskVO;

	public interface AskService {
	    void completePaymentAndInsert(AskVO ask) throws Exception;
		
		//ask 전체 조회
		Page<AskVO> askAll(Pageable pageable, String searchType, String keyword);
		
		//ask 전체 개수 조회
		int count(String searchType, String keyword);
		
		List<AskVO> myOnedate();
		
		List<AskVO> computerPost(int computerNo);
		
		List<AskVO> peripheralPost(int peripheralNo);
		
		int computerBuy(AskVO avo);
		
		AskVO computerBuySelect(AskVO avo);
		
		int completeComputerBuy(AskVO vo);
		
		int peripheralBuy(AskVO avo);
		
		AskVO peripheralBuySelect(AskVO avo);
		
		int completePeripheralBuy(AskVO vo);
		
		// 구매확정으로 업데이트
		int buyOk(AskVO vo);
	}
	
