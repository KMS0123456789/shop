package com.project.shop.user.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.user.vo.UserVO;

@Repository
public class UserRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private final String NAME_SPACE = "UserMapper";
	
	public List<UserVO> userAll(){ 
		 return template.selectList(NAME_SPACE + ".userAll");
	}
	
	public int blackList(UserVO vo) {
		return template.update(NAME_SPACE + ".blackList", vo);
	}
	
	public void saveUser(UserVO user) {
        template.insert(NAME_SPACE + ".saveUser", user);
    }
}
