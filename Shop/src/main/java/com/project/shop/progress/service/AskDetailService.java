package com.project.shop.progress.service;

import java.util.List;

import com.project.shop.progress.vo.AskDetailVO;

public interface AskDetailService {
	void insertAskDetail(AskDetailVO detail) throws Exception;
	
	int computerBuy(AskDetailVO advo);
	
	AskDetailVO computerBuySelect(AskDetailVO advo);

	AskDetailVO orderCompleteComputer(AskDetailVO vo);
	
	int peripheralBuy(AskDetailVO advo);
	
	AskDetailVO peripheralBuySelect(AskDetailVO advo);

	AskDetailVO orderCompletePeripheral(AskDetailVO vo);
}
