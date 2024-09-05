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
    
}
