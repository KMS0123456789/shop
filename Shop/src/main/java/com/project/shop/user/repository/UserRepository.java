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

    public List<UserVO> userAll() { 
        return template.selectList(NAME_SPACE + ".userAll");
    }

    public int blackList(UserVO vo) {
        return template.update(NAME_SPACE + ".blackList", vo);
    }

    // 사용자의 정보를 데이터베이스에 저장하는 메서드
    public void saveUser(UserVO user) {
        // MyBatis의 insert 메서드를 사용하여 user 객체를 "saveUser" 쿼리로 데이터베이스에 삽입
        template.insert(NAME_SPACE + ".saveUser", user);
    }

    // 이메일로 사용자를 찾는 메서드
    public UserVO findUserByEmail(String email) {
        // MyBatis의 selectOne 메서드를 사용하여 주어진 이메일로 사용자 정보를 조회
        // "findUserByEmail" 쿼리를 실행하고, 결과로 UserVO 객체를 반환
        return template.selectOne(NAME_SPACE + ".findUserByEmail", email);
    }
}
