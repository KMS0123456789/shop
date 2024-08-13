package com.project.shop.home;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.computer.vo.ComputerVO;
import com.project.shop.computer.vo.PeripheralVO;

@Repository
public class HomeRepository {
	
	@Autowired
	SqlSessionTemplate template;
	private final String C_NAME_SPACE = "ComputerMapper";
	private final String P_NAME_SPACE = "PeripheralMapper";
	
	//ComputerMapper의 home 메서드 실행
	public List<ComputerVO> computer(){
		return template.selectList(C_NAME_SPACE + ".home");	
	}
	
	//PeripheralMapper의 home 메서드 실행
	public List<PeripheralVO> peripheral(){
		return template.selectList(P_NAME_SPACE + ".home");
	}
}
