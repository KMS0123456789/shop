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
	
	public int cancelOk (AskVO vo) {
		return template.update(NAME_SPACE+ ".cancelOk", vo);
	}
	
	public int changeOk (AskVO vo) {
		return template.update(NAME_SPACE+ ".changeOk", vo);
	}
	
	public int changing (AskVO vo) {
		return template.update(NAME_SPACE+ ".changing", vo);
	}
	
	public int changecomplete (AskVO vo) {
		return template.update(NAME_SPACE+ ".changecomplete", vo);
	}
}
