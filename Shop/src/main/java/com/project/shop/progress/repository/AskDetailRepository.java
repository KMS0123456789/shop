package com.project.shop.progress.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
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

}
