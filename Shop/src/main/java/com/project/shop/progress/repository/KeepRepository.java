package com.project.shop.progress.repository;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.user.vo.UserVO;

@Repository
public class KeepRepository {
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "KeepMapper";
	
	public int keepComputer(HashMap<String, Object> map) {
		return template.insert(NAME_SPACE + ".keepComputer", map);
	}
	
	public int keepDeleteComputer(HashMap<String, Object> map) {
		return template.delete(NAME_SPACE + ".keepDeleteComputer", map);
	}
}
