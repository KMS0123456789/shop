package com.project.shop.progress.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "FileMapper";
}
