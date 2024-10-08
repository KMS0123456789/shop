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
	
	//마우스 전체 조회
	public Page<PeripheralVO> mouse(Pageable pageable, String searchType, String keyword, int peripheralCategory) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword, peripheralCategory);
		List<PeripheralVO> mouses = template.selectList(NAME_SPACE + ".mouse", map);//PeripheralMapper의 mouse 메서드 실행
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
	public PeripheralVO peripheralPost(HashMap<String, Object> map) {
		return template.selectOne(NAME_SPACE + ".peripheralPost", map);
	}
	public int peripheralInsert(PeripheralVO vo) {
		return template.insert(NAME_SPACE + ".peripheralInsert", vo);
	}
	
	//마우스 높은 가격순 조회
	public Page<PeripheralVO> mouseHighPrice(Pageable pageable, String searchType, String keyword, int peripheralCategory) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword, peripheralCategory);
		List<PeripheralVO> mouses = template.selectList(NAME_SPACE + ".mouseHighPrice", map);//PeripheralMapper의 mouseHighPrice 메서드 실행
		return new PageImpl<PeripheralVO>(mouses, pageable, total);
	}
	
	//마우스 낮은 가격순 조회
	public Page<PeripheralVO> mouseLowPrice(Pageable pageable, String searchType, String keyword, int peripheralCategory) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword, peripheralCategory);
		List<PeripheralVO> mouses = template.selectList(NAME_SPACE + ".mouseLowPrice", map);//PeripheralMapper의 mouseLowPrice 메서드 실행
		return new PageImpl<PeripheralVO>(mouses, pageable, total);
	}
	
	//키보드 높은 가격순 조회
	public Page<PeripheralVO> keyboardHighPrice(Pageable pageable, String searchType, String keyword, int peripheralCategory) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword, peripheralCategory);
		List<PeripheralVO> keyboards = template.selectList(NAME_SPACE + ".keyboardHighPrice", map);//PeripheralMapper의 keyboardHighPrice 메서드 실행
		return new PageImpl<PeripheralVO>(keyboards, pageable, total);
	}
	
	//키보드 낮은 가격순 조회
	public Page<PeripheralVO> keyboardLowPrice(Pageable pageable, String searchType, String keyword, int peripheralCategory) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword, peripheralCategory);
		List<PeripheralVO> keyboards = template.selectList(NAME_SPACE + ".keyboardLowPrice", map);//PeripheralMapper의 keyboardLowPrice 메서드 실행
		return new PageImpl<PeripheralVO>(keyboards, pageable, total);
	}
	
	//키보드 높은 가격순 조회
	public Page<PeripheralVO> monitorHighPrice(Pageable pageable, String searchType, String keyword, int peripheralCategory) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword, peripheralCategory);
		List<PeripheralVO> monitors = template.selectList(NAME_SPACE + ".monitorHighPrice", map);//PeripheralMapper의 monitorHighPrice 메서드 실행
		return new PageImpl<PeripheralVO>(monitors, pageable, total);
	}
	
	//키보드 낮은 가격순 조회
	public Page<PeripheralVO> monitorLowPrice(Pageable pageable, String searchType, String keyword, int peripheralCategory) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword, peripheralCategory);
		List<PeripheralVO> monitors = template.selectList(NAME_SPACE + ".monitorLowPrice", map);//PeripheralMapper의monitorLowPrice 메서드 실행
		return new PageImpl<PeripheralVO>(monitors, pageable, total);
	}
	
	//주변기기 목록 조회
	public Page<PeripheralVO> peripheralmanager(Pageable pageable, String searchType, String keyword){
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = peripheralcount(searchType, keyword);
    	List<PeripheralVO> peripheralmanagers = template.selectList(NAME_SPACE+".peripheralmanager", map);
		return new PageImpl<PeripheralVO>(peripheralmanagers, pageable, total);
    }
	
	//주변기기 개수 조회
	public int peripheralcount(String searchType, String keyword) {
    	Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return template.selectOne(NAME_SPACE +".peripheralcount", map); //ComputerMapper의 count 메서드 실행
	}
	//등록된 주변기기 목록 조회
	public Page<PeripheralVO> peripheralList(Pageable pageable, String searchType, String keyword){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = peripheralcount(searchType, keyword);
		List<PeripheralVO> peripherals = template.selectList(NAME_SPACE + ".peripheralList", map); //ComputerMapper의 computer 메서드 실행
		return new PageImpl<PeripheralVO>(peripherals, pageable, total);
	}
	
	//등록된 주변기기 삭제
	public int peripheralDelete (PeripheralVO vo) {
		return template.update(NAME_SPACE+ ".peripheralDelete", vo);
	}	
}
