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
	
	//완제품 단건 조회
	public ComputerVO computerPost(HashMap<String, Object> map) {
		return template.selectOne(NAME_SPACE + ".computerPost", map);
	}
	
	//완제품 인서트
	public int computerInsert(ComputerVO vo) {
		return template.insert(NAME_SPACE + ".computerInsert", vo);
	}
	
	//완제품 높은 가격순 조회
	public Page<ComputerVO> computerHighPrice(Pageable pageable, String searchType, String keyword){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword);
		List<ComputerVO> computers = template.selectList(NAME_SPACE + ".computerHighPrice", map); //ComputerMapper의 computerHighPrice 메서드 실행
		return new PageImpl<ComputerVO>(computers, pageable, total);
	}
	
	//완제품 낮은 가격순 조회
	public Page<ComputerVO> computerLowPrice(Pageable pageable, String searchType, String keyword){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword);
		List<ComputerVO> computers = template.selectList(NAME_SPACE + ".computerLowPrice", map); //ComputerMapper의 computerLowPrice 메서드 실행
		return new PageImpl<ComputerVO>(computers, pageable, total);
	}
	
	public Page<ComputerVO> search(Pageable pageable, String keyword){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("keyword", keyword);
		int total = searchCount(keyword);
		List<ComputerVO> searchs = template.selectList(NAME_SPACE + ".search", map); //ComputerMapper의 search 메서드 실행
		return new PageImpl<ComputerVO>(searchs, pageable, total);
	}
	
	public int searchCount(String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		return template.selectOne(NAME_SPACE + ".searchCount", map); //ComputerMapper의 searchCount 메서드 실행
	}
	
	public Page<ComputerVO> computerManager(Pageable pageable, String searchType, String keyword){
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword);
    	List<ComputerVO> computerManagers = template.selectList(NAME_SPACE+".computerManager", map);
		return new PageImpl<ComputerVO>(computerManagers, pageable, total);
    }
	
	//등록된 컴퓨터 목록 조회
	public Page<ComputerVO> computerList(Pageable pageable, String searchType, String keyword){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword);
		List<ComputerVO> computers = template.selectList(NAME_SPACE + ".computerList", map); //ComputerMapper의 computer 메서드 실행
		return new PageImpl<ComputerVO>(computers, pageable, total);
	}
	
	//등록된 컴퓨터 삭제
	public int computerDelete (ComputerVO vo) {
		return template.update(NAME_SPACE+ ".computerDelete", vo);
	}


}
