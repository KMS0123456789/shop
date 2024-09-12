package com.project.shop.progress.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.project.shop.progress.vo.AskVO;

	public interface AskService {
	    void completePay(AskVO ask) throws Exception;
	    
	    AskVO selectlastone();
	    
	    AskVO getAskById(AskVO vo); 
		
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
				
		int askStateModify(AskVO vo);
		
		int deliveryComplete(AskVO vo);
		
		// 주문 취소로 업데이트
		int cancelOk(AskVO vo);
		
		// 상품 교환으로 업데이트
		int changeOk(AskVO vo);
		
		//상품 교환중으로 업데이트
		int changing(AskVO vo);
		
		int changecomplete(AskVO vo);
	}
	
