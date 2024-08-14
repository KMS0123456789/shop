package com.project.shop.progress.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.progress.vo.AskVO;

@Repository
public class AskRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "AskMapper";
	
	public List<AskVO> askAll(){
		return template.selectList(NAME_SPACE + ".askAll");
	}
}
