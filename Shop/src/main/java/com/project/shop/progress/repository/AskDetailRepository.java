package com.project.shop.progress.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.project.shop.progress.vo.AskDetailVO;
import com.project.shop.progress.vo.AskVO;


@Repository
public class AskDetailRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "AskDetailMapper";
	
    public List<AskDetailVO> getAskDetailsByAskNo(AskDetailVO advo) {
		HashMap<String, Object> map=new HashMap<>();
		map.put("askNo", advo.getAskNo());
		return template.selectList(NAME_SPACE + ".getAskDetailsByAskNo", map);
	}
    
    // AskDetail 테이블에 데이터 삽입
    public void completePay(AskDetailVO detail) {
        template.insert(NAME_SPACE + ".completePay", detail);
    }
	
    // AskDetail 테이블에 데이터 삽입
    public void insertAskDetail(AskDetailVO askDetail) {
        template.insert(NAME_SPACE + ".insertAskDetail", askDetail);
    }
    
    public int computerBuy(AskDetailVO advo) {
    	return template.insert(NAME_SPACE + ".computerBuy", advo);
    }
    
    public AskDetailVO computerBuySelect(AskDetailVO advo) {
		return template.selectOne(NAME_SPACE + ".computerBuySelect", advo);
	}
    
    public AskDetailVO orderCompleteComputer(AskDetailVO vo) {
    	return template.selectOne(NAME_SPACE + ".orderCompleteComputer", vo);
    }
    
    public int peripheralBuy(AskDetailVO advo) {
    	return template.insert(NAME_SPACE + ".peripheralBuy", advo);
    }
    
    public AskDetailVO peripheralBuySelect(AskDetailVO advo) {
		return template.selectOne(NAME_SPACE + ".peripheralBuySelect", advo);
	}
    
    public AskDetailVO orderCompletePeripheral(AskDetailVO vo) {
    	return template.selectOne(NAME_SPACE + ".orderCompletePeripheral", vo);
    }

    // 내가 주문한 목록 조회하는 메서드(하루).
    public Page<AskDetailVO> myOnedate(Pageable pageable, String searchType, String keyword, AskDetailVO vo){
    	Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("email", vo.getAskDetailUser());
		int total = mydaycount(searchType, keyword , vo);
		List<AskDetailVO> myOnedate = template.selectList(NAME_SPACE+".myOnedate", map );
    	return new PageImpl<AskDetailVO>(myOnedate, pageable, total);
    }
    
    // 내가 주문한 개수 조회
    public int mydaycount(String searchType, String keyword, AskDetailVO vo)  {
  		Map<String, Object> map = new HashMap<String, Object>();
  		map.put("searchType", searchType);
  		map.put("keyword", keyword);
  		map.put("email", vo.getAskDetailUser());
  		return template.selectOne(NAME_SPACE + ".mydaycount", map); //ComputerMapper의 count 메서드 실행
  	}
    
    // 특정유저가 주문한 상품 일주일 조회.
 	 public Page<AskDetailVO> myOneweek(Pageable pageable, String searchType, String keyword, AskDetailVO vo){
 	    	Map<String, Object> map = new HashMap<String, Object>();
 			map.put("offset", pageable.getOffset());
 			map.put("limit", pageable.getPageSize());
 			map.put("searchType", searchType);
 			map.put("keyword", keyword);
 			map.put("email", vo.getAskDetailUser());
 			int total = myweekcount(searchType, keyword , vo);
 			List<AskDetailVO> myOneweek = template.selectList(NAME_SPACE+".myOneweek", map );
 	    	return new PageImpl<AskDetailVO>(myOneweek, pageable, total);
 	    }
 	    
 	    // 특정유저가 일주일 간 주문한 개수 조회
 	    public int myweekcount(String searchType, String keyword, AskDetailVO vo)  {
 	  		Map<String, Object> map = new HashMap<String, Object>();
 	  		map.put("searchType", searchType);
 	  		map.put("keyword", keyword);
 	  		map.put("email", vo.getAskDetailUser());
 	  		return template.selectOne(NAME_SPACE + ".myweekcount", map); //ComputerMapper의 count 메서드 실행
 	  	}
 	    
 	// 특정유저가 주문한 상품 한달 조회.
 	    public Page<AskDetailVO> myOnemonth(Pageable pageable, String searchType, String keyword, AskDetailVO vo){
 	    	Map<String, Object> map = new HashMap<String, Object>();
 			map.put("offset", pageable.getOffset());
 			map.put("limit", pageable.getPageSize());
 			map.put("searchType", searchType);
 			map.put("keyword", keyword);
 			map.put("email", vo.getAskDetailUser());
 			int total = myMonthcount(searchType, keyword , vo);
 			List<AskDetailVO> myOnemonth = template.selectList(NAME_SPACE+".myOnemonth", map );
 	    	return new PageImpl<AskDetailVO>(myOnemonth, pageable, total);
 	    }
 	    
 	    // 특정 유저가 한달간 주문한 개수 조회
 	    public int myMonthcount(String searchType, String keyword, AskDetailVO vo)  {
 	  		Map<String, Object> map = new HashMap<String, Object>();
 	  		map.put("searchType", searchType);
 	  		map.put("keyword", keyword);
 	  		map.put("email", vo.getAskDetailUser());
 	  		return template.selectOne(NAME_SPACE + ".myMonthcount", map); //ComputerMapper의 count 메서드 실행
 	  	}
 	    
 	   // 특정유저가 주문한 상품 세달 조회.
 	   public Page<AskDetailVO> myThreemonth(Pageable pageable, String searchType, String keyword, AskDetailVO vo){
	    	Map<String, Object> map = new HashMap<String, Object>();
			map.put("offset", pageable.getOffset());
			map.put("limit", pageable.getPageSize());
			map.put("searchType", searchType);
			map.put("keyword", keyword);
			map.put("email", vo.getAskDetailUser());
			int total = myThreeMonthcount(searchType, keyword , vo);
			List<AskDetailVO> myThreemonth = template.selectList(NAME_SPACE+".myThreemonth", map );
	    	return new PageImpl<AskDetailVO>(myThreemonth, pageable, total);
	    }
	    
 	   // 특정 유저가 최근 세달간 주문한 개수 조회
	    public int myThreeMonthcount(String searchType, String keyword, AskDetailVO vo)  {
	  		Map<String, Object> map = new HashMap<String, Object>();
	  		map.put("searchType", searchType);
	  		map.put("keyword", keyword);
	  		map.put("email", vo.getAskDetailUser());
	  		return template.selectOne(NAME_SPACE + ".myThreeMonthcount", map); //ComputerMapper의 count 메서드 실행
	  	}
	    
	    // 특정유저가 주문한 상품 6달 조회.
	    public Page<AskDetailVO> mySixmonth(Pageable pageable, String searchType, String keyword, AskDetailVO vo){
	    	Map<String, Object> map = new HashMap<String, Object>();
			map.put("offset", pageable.getOffset());
			map.put("limit", pageable.getPageSize());
			map.put("searchType", searchType);
			map.put("keyword", keyword);
			map.put("email", vo.getAskDetailUser());
			int total = mySixMonthcount(searchType, keyword , vo);
			List<AskDetailVO> mySixmonth = template.selectList(NAME_SPACE+".mySixmonth", map );
	    	return new PageImpl<AskDetailVO>(mySixmonth, pageable, total);
	    }
	    
	    // 특정 유저가 최근 6달 주문한 개수 조회
	    public int mySixMonthcount(String searchType, String keyword, AskDetailVO vo)  {
	  		Map<String, Object> map = new HashMap<String, Object>();
	  		map.put("searchType", searchType);
	  		map.put("keyword", keyword);
	  		map.put("email", vo.getAskDetailUser());
	  		return template.selectOne(NAME_SPACE + ".mySixMonthcount", map); //ComputerMapper의 count 메서드 실행
	  	}
	    
		//주문 전체 조회
		public Page<AskDetailVO> askAll(Pageable pageable, String searchType, String keyword){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("offset", pageable.getOffset());
			map.put("limit", pageable.getPageSize());
			map.put("searchType", searchType);
			map.put("keyword", keyword);
			int total = count(searchType, keyword);
			List<AskDetailVO> asks = template.selectList(NAME_SPACE + ".askAll",map);  //AskMapper의 askAll 메서드 실행
			return new PageImpl<AskDetailVO>(asks, pageable, total);
		}
		//주문 개수 조회
		public int count(String searchType, String keyword) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchType", searchType);
			map.put("keyword", keyword);
			return template.selectOne(NAME_SPACE + ".count", map); //AskMapper의 count 메서드 실행
		}
		public Page<AskDetailVO> deliveryAll(Pageable pageable, String searchType, String keyword){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("offset", pageable.getOffset());
			map.put("limit", pageable.getPageSize());
			map.put("searchType", searchType);
			map.put("keyword", keyword);
			int total = deliveryCount(searchType, keyword);
			List<AskDetailVO> deliverys = template.selectList(NAME_SPACE + ".deliveryAll",map);  //AskMapper의 askAll 메서드 실행
			return new PageImpl<AskDetailVO>(deliverys, pageable, total);
		}
		//주문 개수 조회
		public int deliveryCount(String searchType, String keyword) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchType", searchType);
			map.put("keyword", keyword);
			return template.selectOne(NAME_SPACE + ".deliveryCount", map); //AskMapper의 count 메서드 실행
		}
		
		 // 특정유저가 취소한 상품 하루 조회.
	    public Page<AskDetailVO> myOnecanceldate(Pageable pageable, String searchType, String keyword, AskDetailVO vo){
	    	Map<String, Object> map = new HashMap<String, Object>();
			map.put("offset", pageable.getOffset());
			map.put("limit", pageable.getPageSize());
			map.put("searchType", searchType);
			map.put("keyword", keyword);
			map.put("email", vo.getAskDetailUser());
			int total = mydayCancelcount(searchType, keyword , vo);
			List<AskDetailVO> myOnecanceldate = template.selectList(NAME_SPACE+".myOnecanceldate", map );
	    	return new PageImpl<AskDetailVO>(myOnecanceldate, pageable, total);
	    }
	    
	    // 특정유저가 취소한 상품 하루 개수 조회.
		public int mydayCancelcount(String searchType, String keyword, AskDetailVO vo) {
  			Map<String, Object> map = new HashMap<String, Object>();
  			map.put("searchType", searchType);
  			map.put("keyword", keyword);
  			map.put("email", vo.getAskDetailUser());
  			return template.selectOne(NAME_SPACE + ".mydayCancelcount", map); //AskMapper의 count 메서드 실행
	  	}
		
		 // 특정유저가 취소한 상품 일주일 조회.
	    public Page<AskDetailVO> myOnecancelweek(Pageable pageable, String searchType, String keyword, AskDetailVO vo){
	    	Map<String, Object> map = new HashMap<String, Object>();
			map.put("offset", pageable.getOffset());
			map.put("limit", pageable.getPageSize());
			map.put("searchType", searchType);
			map.put("keyword", keyword);
			map.put("email", vo.getAskDetailUser());
			int total = myweekCancelcount(searchType, keyword , vo);
			List<AskDetailVO> myOnecancelweek = template.selectList(NAME_SPACE+".myOnecancelweek", map );
	    	return new PageImpl<AskDetailVO>(myOnecancelweek, pageable, total);
	    }
	    
	    // 특정유저가 취소한 상품 일주일 개수 조회.
		public int myweekCancelcount(String searchType, String keyword, AskDetailVO vo) {
  			Map<String, Object> map = new HashMap<String, Object>();
  			map.put("searchType", searchType);
  			map.put("keyword", keyword);
  			map.put("email", vo.getAskDetailUser());
  			return template.selectOne(NAME_SPACE + ".myweekCancelcount", map); //AskMapper의 count 메서드 실행
	  	}
		
		 // 특정유저가 취소한 상품 한달 조회.
	    public Page<AskDetailVO> myOnemonthcancel(Pageable pageable, String searchType, String keyword, AskDetailVO vo){
	    	Map<String, Object> map = new HashMap<String, Object>();
			map.put("offset", pageable.getOffset());
			map.put("limit", pageable.getPageSize());
			map.put("searchType", searchType);
			map.put("keyword", keyword);
			map.put("email", vo.getAskDetailUser());
			int total = mymonthCancelcount(searchType, keyword , vo);
			List<AskDetailVO> myOnemonthcancel = template.selectList(NAME_SPACE+".myOnemonthcancel", map );
	    	return new PageImpl<AskDetailVO>(myOnemonthcancel, pageable, total);
	    }
	    
	    // 특정유저가 취소한 상품 한달 개수 조회.
		public int mymonthCancelcount(String searchType, String keyword, AskDetailVO vo) {
  			Map<String, Object> map = new HashMap<String, Object>();
  			map.put("searchType", searchType);
  			map.put("keyword", keyword);
  			map.put("email", vo.getAskDetailUser());
  			return template.selectOne(NAME_SPACE + ".mymonthCancelcount", map); //AskMapper의 count 메서드 실행
	  	}
		
		 // 특정유저가 취소한 상품 세달 조회.
	    public Page<AskDetailVO> myThreemonthcancel(Pageable pageable, String searchType, String keyword, AskDetailVO vo){
	    	Map<String, Object> map = new HashMap<String, Object>();
			map.put("offset", pageable.getOffset());
			map.put("limit", pageable.getPageSize());
			map.put("searchType", searchType);
			map.put("keyword", keyword);
			map.put("email", vo.getAskDetailUser());
			int total = myThreemonthCancelcount(searchType, keyword , vo);
			List<AskDetailVO> myThreemonthcancel = template.selectList(NAME_SPACE+".myThreemonthcancel", map );
	    	return new PageImpl<AskDetailVO>(myThreemonthcancel, pageable, total);
	    }
	    
	    // 특정유저가 취소한 상품 세달 개수 조회.
		public int myThreemonthCancelcount(String searchType, String keyword, AskDetailVO vo) {
  			Map<String, Object> map = new HashMap<String, Object>();
  			map.put("searchType", searchType);
  			map.put("keyword", keyword);
  			map.put("email", vo.getAskDetailUser());
  			return template.selectOne(NAME_SPACE + ".myThreemonthCancelcount", map); //AskMapper의 count 메서드 실행
	  	}
		
		 // 특정유저가 취소한 상품 세달 조회.
	    public Page<AskDetailVO> mySixmonthcancel(Pageable pageable, String searchType, String keyword, AskDetailVO vo){
	    	Map<String, Object> map = new HashMap<String, Object>();
			map.put("offset", pageable.getOffset());
			map.put("limit", pageable.getPageSize());
			map.put("searchType", searchType);
			map.put("keyword", keyword);
			map.put("email", vo.getAskDetailUser());
			int total = mySixmonthCancelcount(searchType, keyword , vo);
			List<AskDetailVO> mySixmonthcancel = template.selectList(NAME_SPACE+".mySixmonthcancel", map );
	    	return new PageImpl<AskDetailVO>(mySixmonthcancel, pageable, total);
	    }
	    
	    // 특정유저가 취소한 상품 세달 개수 조회.
		public int mySixmonthCancelcount(String searchType, String keyword, AskDetailVO vo) {
  			Map<String, Object> map = new HashMap<String, Object>();
  			map.put("searchType", searchType);
  			map.put("keyword", keyword);
  			map.put("email", vo.getAskDetailUser());
  			return template.selectOne(NAME_SPACE + ".mySixmonthCancelcount", map); //AskMapper의 count 메서드 실행
	  	}
		
		//취소목록 리스트
		public Page<AskDetailVO> managercancel(Pageable pageable, String searchType, String keyword){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("offset", pageable.getOffset());
			map.put("limit", pageable.getPageSize());
			map.put("searchType", searchType);
			map.put("keyword", keyword);
			int total = cancelcount(searchType, keyword);
			List<AskDetailVO> cancels = template.selectList(NAME_SPACE + ".managercancel",map);  //AskMapper의 askAll 메서드 실행
			return new PageImpl<AskDetailVO>(cancels, pageable, total);
		}
		
		//취소목록 개수
		public int cancelcount(String searchType, String keyword) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchType", searchType);
			map.put("keyword", keyword);
			return template.selectOne(NAME_SPACE + ".cancelcount", map); //AskMapper의 count 메서드 실행
		}
		
		public Page<AskDetailVO> changelist(Pageable pageable, String searchType, String keyword){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("offset", pageable.getOffset());
			map.put("limit", pageable.getPageSize());
			map.put("searchType", searchType);
			map.put("keyword", keyword);
			int total = changecount(searchType, keyword);
			List<AskDetailVO> changelist = template.selectList(NAME_SPACE + ".changelist",map);  //AskMapper의 askAll 메서드 실행
			return new PageImpl<AskDetailVO>(changelist, pageable, total);
		}
		
		public int changecount(String searchType, String keyword) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchType", searchType);
			map.put("keyword", keyword);
			return template.selectOne(NAME_SPACE + ".changecount", map); //AskMapper의 count 메서드 실행
		}
}
