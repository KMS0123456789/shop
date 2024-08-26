package com.project.shop.progress.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.progress.vo.AskVO;

@Repository
public class AskRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "AskMapper";
	
	//ask 전체 조회
	public List<AskVO> askAll(){
		return template.selectList(NAME_SPACE + ".askAll"); //askmapper에서 askAll 실행
	}
	
	public List<AskVO> myOnedate(){
		return template.selectList(NAME_SPACE + ".myOnedate");
	}
	
	public List<AskVO> computerPost(int computerNo){
		return template.selectList(NAME_SPACE + ".computerPost", computerNo);
	}
	
	public List<AskVO> peripheralPost(int perihperalNo){
		return template.selectList(NAME_SPACE + ".peripheralPost", perihperalNo);
	}
}
