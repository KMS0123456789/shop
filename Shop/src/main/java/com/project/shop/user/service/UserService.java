package com.project.shop.user.service;

import java.util.List;

import com.project.shop.user.vo.UserVO;

public interface UserService {
	List<UserVO> userAll();
	int blackList(UserVO vo);
	UserVO handleKakaoCallback(String code) throws Exception;
	// 카카오 로그인 콜백 처리 메서드, 카카오에서 받은 인증 코드를 사용하여 사용자 정보를 가져옴
	UserVO findUserByEmail(String email); 
	// 이메일을 사용하여 사용자 정보를 조회하는 메서드
	
	int keepCount(UserVO vo);
	
	int cartCount(UserVO vo);
	
	int payCount(UserVO vo);
	
	int dReadyCount(UserVO vo);
	
	int clearCount(UserVO vo);
	
	int orcancelCount(UserVO vo);
	
	int orchangeCount(UserVO vo);
}
