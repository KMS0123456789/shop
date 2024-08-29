package com.project.shop.user.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.project.shop.user.vo.AnswerVO;

@Repository
public class AnswerRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "AnswerMapper";
	
	public int answerwrite(AnswerVO vo) {
		return template.insert(NAME_SPACE + ".answerwrite",vo); // AnswerMapper에 있는 answerwrite에 있는곳에 vo값 넣어준다.
	}
}
