package com.project.shop.user.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.user.vo.AddrVO;

@Repository
public class AddrRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "AddrMapper";
	
	// 배송주소 등록하는 메서드
	public int myaddrplus(AddrVO vo) {
		return template.insert(NAME_SPACE + ".myaddrplus", vo);
	}
	
	public AddrVO myaddr_modify(int addrNo) {
		return template.selectOne(NAME_SPACE + ".myaddr_modify", addrNo);
	}
}
