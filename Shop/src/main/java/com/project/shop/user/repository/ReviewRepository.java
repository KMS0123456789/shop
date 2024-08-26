package com.project.shop.user.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.user.vo.ReviewVO;

@Repository
public class ReviewRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "ReviewMapper";
	
	public int reviewComputer(ReviewVO vo){
		return template.insert(NAME_SPACE + ".reviewComputer", vo);
	}
	
	public int reviewPeripheral(ReviewVO vo){
		return template.insert(NAME_SPACE + ".reviewPeripheral", vo);
	}
}
