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

import com.project.shop.computer.vo.ComputerVO;


@Repository
public class ComputerRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "ComputerMapper";
	
	//완제품 전체 조회
	public Page<ComputerVO> computer(Pageable pageable, String searchType, String keyword){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword);
		List<ComputerVO> computers = template.selectList(NAME_SPACE + ".computer", map); //ComputerMapper의 computer 메서드 실행
		return new PageImpl<ComputerVO>(computers, pageable, total);
	}
	
	//완제품 전체 개수 조회
	public int count(String searchType, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return template.selectOne(NAME_SPACE + ".count", map); //ComputerMapper의 count 메서드 실행
	}
}
