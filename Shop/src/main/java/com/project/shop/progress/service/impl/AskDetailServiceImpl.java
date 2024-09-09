package com.project.shop.progress.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.shop.progress.repository.AskDetailRepository;
import com.project.shop.progress.service.AskDetailService;
import com.project.shop.progress.vo.AskDetailVO;
import com.project.shop.progress.vo.AskVO;

@Service
public class AskDetailServiceImpl implements AskDetailService{
	
	@Autowired
	private AskDetailRepository repository;
	
    @Override
    @Transactional
    public void completePay(AskDetailVO detail) throws Exception {
        repository.completePay(detail);
    }
    
    @Override
    public List<AskDetailVO> getAskDetailsByAskNo(AskDetailVO advo) {
        return repository.getAskDetailsByAskNo(advo);
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
	
	// 특정 유저 주문 내역 하루 조회
 	@Override
 	public Page<AskDetailVO> myOnedate(Pageable pageable ,String searchType, String keyword, AskDetailVO vo) {
 		// AskRepository의 메서드 myOnedate 실행 pageable 파라미터도 같이 보낸다.
 		return repository.myOnedate(pageable, searchType, keyword, vo);
 	}

 	// 특정 유저 주문 내역 하루 개수 조회
 	@Override
 	public int mydaycount(String searchType, String keyword, AskDetailVO vo) {
 		return repository.mydaycount(searchType, keyword, vo); //AskRepository의 메서드 count 실행
 	}
 	
 	// 특정 유저 주문 내역 일주일 조회
 	@Override
	public Page<AskDetailVO> myOneweek(Pageable pageable, String searchType, String keyword, AskDetailVO vo) {
		// TODO Auto-generated method stub
		return repository.myOneweek(pageable, searchType, keyword, vo);
	}
 	
 	// 특정 유저 주문 내역 일주일 개수 조회
	@Override
	public int myweekcount(String searchType, String keyword, AskDetailVO vo) {
		// TODO Auto-generated method stub
		return repository.myweekcount(searchType, keyword, vo);
	}
	
	// 특정 유저 주문 내역 한달 조회
	@Override
	public Page<AskDetailVO> myOnemonth(Pageable pageable, String searchType, String keyword, AskDetailVO vo) {
		// TODO Auto-generated method stub
		return repository.myOnemonth(pageable, searchType, keyword, vo);
	}
	
	// 특정 유저 주문 내역 한달 개수 조회
	@Override
	public int myMonthcount(String searchType, String keyword, AskDetailVO vo) {
		// TODO Auto-generated method stub
		return repository.myMonthcount(searchType, keyword, vo);
	}
	
	// 특정 유저 주문 내역 3달 조회
	@Override
	public Page<AskDetailVO> myThreemonth(Pageable pageable, String searchType, String keyword, AskDetailVO vo) {
		// TODO Auto-generated method stub
		return repository.myThreemonth(pageable, searchType, keyword, vo);
	}

	// 특정 유저 주문 내역 세달 개수 조회
	@Override
	public int myThreeMonthcount(String searchType, String keyword, AskDetailVO vo) {
		// TODO Auto-generated method stub
		return repository.myThreeMonthcount(searchType, keyword, vo);
	}
	
	// 특정 유저 주문 내역 6달 조회
	@Override
	public Page<AskDetailVO> mySixmonth(Pageable pageable, String searchType, String keyword, AskDetailVO vo) {
		// TODO Auto-generated method stub
		return repository.mySixmonth(pageable, searchType, keyword, vo);
	}
	
	// 특정 유저 주문 내역 여섯달 개수 조회
	@Override
	public int mySixMonthcount(String searchType, String keyword, AskDetailVO vo) {
		// TODO Auto-generated method stub
		return repository.mySixMonthcount(searchType, keyword, vo);
	}
	
	//ask 전체 조회
	@Override
	public Page<AskDetailVO> askAll(Pageable pageable, String searchType, String keyword){
		return repository.askAll(pageable, searchType, keyword); //AskRepository에서 askAll 메서드 실행
	}
	//ask 전체 개수 조회
	@Override
	public int count(String searchType, String keyword) {
		return repository.count(searchType, keyword); //AskRepository의 메서드 count 실행
	}
	
	//ask 전체 조회
		@Override
		public Page<AskDetailVO> deliveryAll(Pageable pageable, String searchType, String keyword){
			return repository.deliveryAll(pageable, searchType, keyword); //AskRepository에서 askAll 메서드 실행
		}
		//ask 전체 개수 조회
		@Override
		public int deliveryCount(String searchType, String keyword) {
			return repository.deliveryCount(searchType, keyword); //AskRepository의 메서드 count 실행
		}		
		
}
