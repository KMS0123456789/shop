package com.project.shop.progress.repository;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.progress.vo.KeepVO;
import com.project.shop.user.vo.UserVO;

@Repository
public class KeepRepository {
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "KeepMapper";
	
	//완제품 찜하기
	public int keepComputer(KeepVO vo) {
		//KeepMapper의 keepComputer 메서드 실행 KeepVO vo 파라미터로 같이 보냄
		return template.insert(NAME_SPACE + ".keepComputer", vo);
	}
	
	//완제품 찜하기 취소
	public int keepDeleteComputer(KeepVO vo) {
		//KeepMapper의 keepDeleteComputer 메서드 실행 HashMap map 파라미터로 같이 보냄
		return template.delete(NAME_SPACE + ".keepDeleteComputer", vo);
	}
	
	//주변기기 찜하기
	public int keepPeripheral(KeepVO vo) {
		//KeepMapper의 keepPeripgeral 메서드 실행 HashMap map 파라미터로 같이 보냄
		return template.insert(NAME_SPACE + ".keepPeripheral", vo);
	}
	
	//주변기기 찜하기 취소
	public int keepDeletePeripheral(KeepVO vo) {
		//KeepMapper의 keepDeletePeripgeral 메서드 실행 HashMap map 파라미터로 같이 보냄
		return template.delete(NAME_SPACE + ".keepDeletePeripheral", vo);
	}
}
