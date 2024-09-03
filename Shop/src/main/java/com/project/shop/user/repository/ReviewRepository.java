package com.project.shop.user.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.project.shop.user.vo.ReviewVO;
import com.project.shop.user.vo.UserVO;

@Repository
public class ReviewRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "ReviewMapper";
	
	public int reviewComputer(ReviewVO vo){
		return template.insert(NAME_SPACE + ".reviewComputer", vo);
	}
	
	public int reviewPeripheral(ReviewVO vo){
		return template.insert(NAME_SPACE + ".reviewPeripheral", vo);
	}
	
	public Page<ReviewVO> myreview(Pageable pageable, String searchType, String keyword, String email){
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("email", email);
		int total = count(searchType, keyword);
    	List<ReviewVO> myreview = template.selectList(NAME_SPACE+".myreview", map);
		return new PageImpl<ReviewVO>(myreview, pageable, total);
    }
	
	 public int count(String searchType, String keyword) {
	    	Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchType", searchType);
			map.put("keyword", keyword);
			return template.selectOne(NAME_SPACE + ".count" , map); //ComputerMapper의 count 메서드 실행
	}
	 
	 public int mycount(String searchType, String keyword, String email) {
	    	Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchType", searchType);
			map.put("keyword", keyword);
			return template.selectOne(NAME_SPACE + ".count" , map); //ComputerMapper의 count 메서드 실행
	}
	    
}
