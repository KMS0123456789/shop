package com.project.shop.computer.repository;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.project.shop.computer.vo.OptVO;
import com.project.shop.progress.vo.AskVO;

@Repository
public class OptRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "OptMapper";
	
	//OptMapper의 computerPost 메서드 실행
	public List<OptVO> computerPost(){
		return template.selectList(NAME_SPACE+".computerPost");
	}
	
	//OptMapper의 optionInsert 메서드 실행
	public int optionInsert(OptVO vo){
		return template.insert(NAME_SPACE+".optionInsert", vo);
	}
	
	//OptMapper의 optList 메서드 실행
	public Page<OptVO> optList(Pageable pageable, String searchType, String keyword){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = optCount(searchType, keyword);
		List<OptVO> optList = template.selectList(NAME_SPACE + ".optList",map);  //AskMapper의 askAll 메서드 실행
		return new PageImpl<OptVO>(optList, pageable, total);
	}
	
	//OptMapper의 optCount 메서드 실행
	public int optCount(String searchType, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return template.selectOne(NAME_SPACE + ".optCount", map); //AskMapper의 count 메서드 실행
	}
	
	//OptMapper의 optionDelete 메서드 실행
	public int optDelete (OptVO vo) {
		return template.update(NAME_SPACE+ ".optDelete", vo);
	}
}
