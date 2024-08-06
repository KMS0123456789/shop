package com.project.shop.computer.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PeripheralRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "PeripheralMapper";
}
