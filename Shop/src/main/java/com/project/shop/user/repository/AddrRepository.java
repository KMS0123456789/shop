package com.project.shop.user.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.user.vo.AddrVO;

@Repository
public class AddrRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "AddrMapper";
	
	public int myaddrplus(AddrVO vo) {
		return template.insert(NAME_SPACE + ".myaddrplus", vo);
	}
}
