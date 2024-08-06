package com.project.shop.user.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnARepository {

	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "QnAMapper";
}
