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
import com.project.shop.computer.vo.PeripheralVO;



@Repository
public class PeripheralRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "PeripheralMapper";
	
	public Page<PeripheralVO> mouse(Pageable pageable, String searchType, String keyword, int peripheralCategory) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword, peripheralCategory);
		List<PeripheralVO> mouses = template.selectList(NAME_SPACE + ".mouse", map);//PeripheralMapper의 mouser 메서드 실행
		return new PageImpl<PeripheralVO>(mouses, pageable, total);
	}
	
	//키보드 전체 조회
	public Page<PeripheralVO> keyboard(Pageable pageable, String searchType, String keyword, int peripheralCategory) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword, peripheralCategory);
		List<PeripheralVO> keyboards = template.selectList(NAME_SPACE + ".keyboard", map);//PeripheralMapper의 keyboard 메서드 실행
		return new PageImpl<PeripheralVO>(keyboards, pageable, total);
	}
	
	//모니터 전체 조회
	public Page<PeripheralVO> monitor(Pageable pageable, String searchType, String keyword, int peripheralCategory) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword, peripheralCategory);
		List<PeripheralVO> monitors = template.selectList(NAME_SPACE + ".monitor", map);//PeripheralMapper의 monitor 메서드 실행
		return new PageImpl<PeripheralVO>(monitors, pageable, total);
	}
	
	//마우스, 키보드 ,모니터의 전체 개수 조회
	public int count(String searchType, String keyword, int peripheralCategory) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("peripheralCategory", peripheralCategory);
		return template.selectOne(NAME_SPACE + ".count", map); //PeripheralMapper의 count 메서드 실행
	}
	
	//마우스, 키보드, 모니터 단건 조회
	public PeripheralVO peripheralPost(int peripheralNo) {
		return template.selectOne(NAME_SPACE + ".peripheralPost", peripheralNo);
	}
}
