package com.project.shop.user.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.user.vo.StarVO;

@Repository
public class StarRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "StarMapper";
	
	public int starComputer(StarVO vo) {
		return template.insert(NAME_SPACE + ".starComputer", vo);
	}
}
