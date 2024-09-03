package com.project.shop.user.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.project.shop.computer.vo.ComputerVO;
import com.project.shop.progress.vo.KeepVO;
import com.project.shop.user.vo.AddrVO;
import com.project.shop.user.vo.QuestionVO;
import com.project.shop.user.vo.UserVO;

@Repository
public class UserRepository {

    @Autowired
    private SqlSessionTemplate template;

    private final String NAME_SPACE = "UserMapper";
    
    // 사용자의 정보를 데이터베이스에 저장하는 메서드
    public void join(UserVO user) {
        // MyBatis의 insert 메서드를 사용하여 user 객체를 "saveUser" 쿼리로 데이터베이스에 삽입
        template.insert(NAME_SPACE + ".join", user);
    }
    // 이메일로 사용자를 찾는 메서드
    public UserVO findUserByEmail(String email) {
        // MyBatis의 selectOne 메서드를 사용하여 주어진 이메일로 사용자 정보를 조회
        // "findUserByEmail" 쿼리를 실행하고, 결과로 UserVO 객체를 반환
        return template.selectOne(NAME_SPACE + ".findUserByEmail", email);
    }
    //로그인 하기위해 유저 한명 조회
    public UserVO login(UserVO vo) {
		return template.selectOne(NAME_SPACE + ".login", vo);
	}
    
  //블랙리스트 전체조회+페이징
  	public Page<UserVO> userAll(Pageable pageable, String searchType, String keyword){
  		Map<String, Object> map = new HashMap<String, Object>();
  		map.put("offset", pageable.getOffset());
  		map.put("limit", pageable.getPageSize());
  		map.put("searchType", searchType);
  		map.put("keyword", keyword);
  		int total = count(searchType, keyword);
  		List<UserVO> userAll = template.selectList(NAME_SPACE + ".userAll", map); //QuestionMapper의 questions 메서드 실행
  		return new PageImpl<UserVO>(userAll, pageable, total);
  	}
  	//블랙리스트 전제 개수 조회

  		public int count(String searchType, String keyword) {
  		Map<String, Object> map = new HashMap<String, Object>();
  		map.put("searchType", searchType);
  		map.put("keyword", keyword);
  		return template.selectOne(NAME_SPACE + ".count", map); //ComputerMapper의 count 메서드 실행
  	}
    
    //유저 타입을 변경하는 메서드
    public int blackList(UserVO vo) {
        return template.update(NAME_SPACE + ".blackList", vo);
    }

    
    // 내가 찜한 개수 찾는 메서드
    public UserVO mylist(UserVO vo) {
    	return template.selectOne(NAME_SPACE + ".mylist", vo);
    }
    
}
