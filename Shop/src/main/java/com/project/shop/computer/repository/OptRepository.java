package com.project.shop.computer.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.computer.vo.OptVO;

@Repository
public class OptRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "OptMapper";
	
	//OptMapper의 computerPost 메서드 실행
	public List<OptVO> computerPost(){
		return template.selectList(NAME_SPACE+".computerPost");
	}
	public int optionInsert(OptVO vo){
		return template.insert(NAME_SPACE+".optionInsert", vo);
}
}
