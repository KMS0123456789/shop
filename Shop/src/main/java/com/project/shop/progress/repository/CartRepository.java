package com.project.shop.progress.repository;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "CartMapper";
	
	public int cartComputer(HashMap<String, Object> map) {
		return template.insert(NAME_SPACE + ".cartComputer", map);
	}
}
