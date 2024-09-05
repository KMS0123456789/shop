package com.project.shop.progress.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.project.shop.progress.vo.AskDetailVO;

public interface AskDetailService {
	void insertAskDetail(AskDetailVO detail) throws Exception;
	
	int computerBuy(AskDetailVO advo);
	
	AskDetailVO computerBuySelect(AskDetailVO advo);

	AskDetailVO orderCompleteComputer(AskDetailVO vo);
	
	int peripheralBuy(AskDetailVO advo);
	
	AskDetailVO peripheralBuySelect(AskDetailVO advo);

	AskDetailVO orderCompletePeripheral(AskDetailVO vo);
	
	// 하루 주문한 내역 조회
	Page<AskDetailVO> myOnedate(Pageable pageable, String searchType, String keyword, AskDetailVO vo);
	
	// 특정 유저 개수 조회
	int mydaycount(String searchType, String keyword,  AskDetailVO vo );
	
	// 일주일 주문한 내역 조회
	Page<AskDetailVO> myOneweek(Pageable pageable, String searchType, String keyword, AskDetailVO vo);
	
	// 특정 유저 일주일 개수 조회
	int myweekcount(String searchType, String keyword,  AskDetailVO vo );
	
	// 한달 주문한 내역 조회
	Page<AskDetailVO> myOnemonth(Pageable pageable, String searchType, String keyword, AskDetailVO vo);
	
	// 특정 유저 1달 개수 조회
	int myMonthcount(String searchType, String keyword,  AskDetailVO vo );
	
	// 세달 주문한 내역 조회
	Page<AskDetailVO> myThreemonth(Pageable pageable, String searchType, String keyword, AskDetailVO vo);
	
	// 특정 유저 3달 개수 조회
	int myThreeMonthcount(String searchType, String keyword,  AskDetailVO vo );
	
	// 6달 주문한 내역 조회
	Page<AskDetailVO> mySixmonth(Pageable pageable, String searchType, String keyword, AskDetailVO vo);
	
	// 특정 유저 6달 개수 조회
	int mySixMonthcount(String searchType, String keyword,  AskDetailVO vo );
}
