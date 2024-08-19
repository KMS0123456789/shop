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
	
	public int questionComputer(QuestionVO vo) {
		return template.insert(NAME_SPACE + ".questionComputer", vo);
	}
	
	public int questionPeripheral(QuestionVO vo) {
		return template.insert(NAME_SPACE + ".questionPeripheral", vo);
	}
}
