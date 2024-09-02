package com.project.shop.progress.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.progress.vo.AskDetailVO;


@Repository
public class AskDetailRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "AskDetailMapper";
	
    // AskDetail 테이블에 데이터 삽입
    public void insertAskDetail(AskDetailVO askDetail) {
        template.insert(NAME_SPACE + ".insertAskDetail", askDetail);
    }
}
