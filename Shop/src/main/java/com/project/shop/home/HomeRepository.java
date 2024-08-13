package com.project.shop.home;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.computer.vo.ComputerVO;

@Repository
public class HomeRepository {
	
	@Autowired
	SqlSessionTemplate template;
	private final String NAME_SPACE = "ComputerMapper";
	
	public List<ComputerVO> home(){
		return template.selectList(NAME_SPACE + ".home");	
	}
}
