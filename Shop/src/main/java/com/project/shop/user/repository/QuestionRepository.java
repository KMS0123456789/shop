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

import com.project.shop.user.vo.QuestionVO;
import com.project.shop.user.vo.UserVO;

@Repository
public class QuestionRepository {

	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "QuestionMapper";
	
	//QnA 전체조회
	public Page<QuestionVO> managerQnA(Pageable pageable, String searchType, String keyword){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword);
		List<QuestionVO> questions = template.selectList(NAME_SPACE + ".managerQnA", map); //QuestionMapper의 questions 메서드 실행
		return new PageImpl<QuestionVO>(questions, pageable, total);
	}
	
	//QnA 전체 개수 조회
	public int count(String searchType, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return template.selectOne(NAME_SPACE + ".count", map); //ComputerMapper의 count 메서드 실행
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
	
	//question 상세 페이지로 이동
	public QuestionVO questionPost(int questionNo) {
		//questionMapper의 questionPost 메서드 실행 파라미터로 int questionNo도 같이 보낸다.
		return template.selectOne(NAME_SPACE + ".questionPost" , questionNo);
	}
	
	 // 내가 질문한 목록 조회하는 메서드.
    public Page<QuestionVO> myquestion(Pageable pageable, String searchType, String keyword, String email){
    	Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("email", email);
		int total = mycount(searchType, keyword , email);
		List<QuestionVO> myquestion = template.selectList(NAME_SPACE+".myquestion", map);
    	return new PageImpl<QuestionVO>(myquestion, pageable, total);	
    }
    
    public int mycount(String searchType, String keyword, String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("email", email);
		return template.selectOne(NAME_SPACE + ".mycount", map); //ComputerMapper의 count 메서드 실행
	}
    
	public int questionUpdate(QuestionVO qvo) {
		return template.update(NAME_SPACE + ".questionUpdate", qvo);
	}
}
