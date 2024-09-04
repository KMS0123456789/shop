package com.project.shop.progress.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.shop.progress.repository.AskDetailRepository;
import com.project.shop.progress.service.AskDetailService;
import com.project.shop.progress.vo.AskDetailVO;

@Service
public class AskDetailServiceImpl implements AskDetailService{
	
	@Autowired
	private AskDetailRepository repository;
	
    @Override
    @Transactional
    public void insertAskDetail(AskDetailVO detail) throws Exception {
        repository.insertAskDetail(detail);
    }

	@Override
	public int computerBuy(AskDetailVO advo) {
		return repository.computerBuy(advo);
	}

	@Override
	public AskDetailVO computerBuySelect(AskDetailVO advo) {
		return repository.computerBuySelect(advo);
	}

	@Override
	public AskDetailVO orderCompleteComputer(AskDetailVO vo) {
		return repository.orderCompleteComputer(vo);
	}
	
	@Override
	public int peripheralBuy(AskDetailVO advo) {
		return repository.peripheralBuy(advo);
	}

	@Override
	public AskDetailVO peripheralBuySelect(AskDetailVO advo) {
		return repository.peripheralBuySelect(advo);
	}

	@Override
	public AskDetailVO orderCompletePeripheral(AskDetailVO vo) {
		return repository.orderCompletePeripheral(vo);
	}
}
