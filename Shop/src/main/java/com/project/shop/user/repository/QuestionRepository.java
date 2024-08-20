package com.project.shop.user.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.user.vo.QuestionVO;

@Repository
public class QuestionRepository {

	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "QuestionMapper";
	
	//question 전체 조회
	public List<QuestionVO> questionAll() { 
        return template.selectList(NAME_SPACE + ".questionAll"); //question mapper에서 questionAll 실행
    }
	
	//완제품 상세페이지에서 문의글 쓰기
	public int questionComputer(QuestionVO vo) {
		//QuestionMapper의 questionComputer 메서드 실행 파라미터로 QuestionVO vo 같이 보내기
		return template.insert(NAME_SPACE + ".questionComputer", vo);
		
	}
	
	//주변기기 상세페이지에서 문의글 쓰기
	public int questionPeripheral(QuestionVO vo) {
		//QuestionMapper의 questionPeripheral 메서드 실행 파라미터로 QuestionVO vo 같이 보내기
		return template.insert(NAME_SPACE + ".questionPeripheral", vo);
	}
}
