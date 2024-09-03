package com.project.shop.user.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.project.shop.computer.vo.ComputerVO;
import com.project.shop.progress.vo.KeepVO;
import com.project.shop.user.vo.AddrVO;
import com.project.shop.user.vo.QuestionVO;
import com.project.shop.user.vo.UserVO;

public interface UserService {
	//블랙리스트 페이징 기능
	Page<UserVO> userAll(Pageable pageable, String searchType, String keyword);
		
	//블랙리스트 전체 개수 조회
	int count(String searchType, String keyword);

	//유저 타입을 블랙리스트로 바꾸는 메서드
	int blackList(UserVO vo);
	
	// 카카오 로그인 콜백 처리 메서드, 카카오에서 받은 인증 코드를 사용하여 사용자 정보를 가져옴
	UserVO join(String code) throws Exception;
	// 이메일을 사용하여 사용자 정보를 조회하는 메서드
	UserVO findUserByEmail(String email); 
	// 사용자 정보를 이용하여 로그인하는 메서드
	UserVO login(UserVO vo);
	
	// 찜한 개수 조회하는 메서드
	UserVO mylist(UserVO vo);
	
}
