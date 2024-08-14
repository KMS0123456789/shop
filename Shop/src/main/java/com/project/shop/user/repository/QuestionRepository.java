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
	
	public List<QuestionVO> questionAll() { 
        return template.selectList(NAME_SPACE + ".questionAll");
    }
}
