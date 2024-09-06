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
public class AskRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "AskMapper";
	
    // Ask 테이블에 데이터 삽입
    public void completePay(AskVO ask) {
        template.insert(NAME_SPACE + ".completePay", ask);
    }

    public AskVO selectlastone() {
    	return template.selectOne(NAME_SPACE + ".selectlastone");
    }
    
	public AskVO getAskById(AskVO vo){
		HashMap<String, Object> map=new HashMap<>();
		map.put("askNo", vo.getAskNo());
		return template.selectOne(NAME_SPACE + ".getAskById", map);
	}
	
    // Ask 테이블에 데이터 삽입
    public void insertAsk(AskVO ask) {
        template.insert(NAME_SPACE + ".insertAsk", ask);
    }

	//주문 전체 조회
	public Page<AskVO> askAll(Pageable pageable, String searchType, String keyword){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword);
		List<AskVO> asks = template.selectList(NAME_SPACE + ".askAll",map);  //AskMapper의 askAll 메서드 실행
		return new PageImpl<AskVO>(asks, pageable, total);
	}
	//주문 개수 조회
	public int count(String searchType, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return template.selectOne(NAME_SPACE + ".count", map); //AskMapper의 count 메서드 실행
	}
	public Page<AskVO> deliveryAll(Pageable pageable, String searchType, String keyword){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = deliveryCount(searchType, keyword);
		List<AskVO> deliverys = template.selectList(NAME_SPACE + ".deliveryAll",map);  //AskMapper의 askAll 메서드 실행
		return new PageImpl<AskVO>(deliverys, pageable, total);
	}
	//주문 개수 조회
	public int deliveryCount(String searchType, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return template.selectOne(NAME_SPACE + ".deliveryCount", map); //AskMapper의 count 메서드 실행
	}
	
	
	
	public List<AskVO> myOnedate(){
		return template.selectList(NAME_SPACE + ".myOnedate");
	}
	
	public List<AskVO> computerPost(int computerNo){
		return template.selectList(NAME_SPACE + ".computerPost", computerNo);
	}
	
	public List<AskVO> peripheralPost(int perihperalNo){
		return template.selectList(NAME_SPACE + ".peripheralPost", perihperalNo);
	}
	public int computerBuy(AskVO avo) {
    	return template.insert(NAME_SPACE + ".computerBuy", avo);
    }
	
	public AskVO computerBuySelect(AskVO avo) {
		return template.selectOne(NAME_SPACE + ".computerBuySelect", avo);
	}
	
	public int completeComputerBuy(AskVO vo) {
		return template.update(NAME_SPACE + ".completeComputerBuy", vo);
	}
	
	public int peripheralBuy(AskVO avo) {
    	return template.insert(NAME_SPACE + ".peripheralBuy", avo);
    }
	
	public AskVO peripheralBuySelect(AskVO avo) {
		return template.selectOne(NAME_SPACE + ".peripheralBuySelect", avo);
	}
	
	public int completePeripheralBuy(AskVO vo) {
		return template.update(NAME_SPACE + ".completePeripheralBuy", vo);
	}
	
	// 구매확정으로 업데이트
	public int buyOk (AskVO vo) {
		return template.update(NAME_SPACE+ ".buyOk", vo);
	}
	public int askStateModify (AskVO vo) {
		return template.update(NAME_SPACE+ ".askStateModify", vo);
	}
	
	public int deliveryComplete (AskVO vo) {
		return template.update(NAME_SPACE+ ".deliveryComplete", vo);
	}
}
