package com.project.shop.user.service;

import java.util.List;

import com.project.shop.user.vo.UserVO;

public interface UserService {
	//모든 유저 조회하는 메서드
	List<UserVO> userAll();
	//유저 타입을 블랙리스트로 바꾸는 메서드
	int blackList(UserVO vo);
	
	UserVO handleKakaoCallback(String code) throws Exception;
	// 카카오 로그인 콜백 처리 메서드, 카카오에서 받은 인증 코드를 사용하여 사용자 정보를 가져옴
	UserVO findUserByEmail(String email); 
	// 이메일을 사용하여 사용자 정보를 조회하는 메서드
	
	// 찜한 개수 조회하는 메서드
	int keepCount(UserVO vo);
	
	// 장바구니에 담은 개수 조회하는 메서드
	int cartCount(UserVO vo);
	
	// 결제완료된 개수 조회하는 메서드
	int payCount(UserVO vo);
	
	// 배송 준비중인 개수 조회하는 메서드
	int dReadyCount(UserVO vo);
	
	// 배송 완료된 개수 조회하는 메서드
	int clearCount(UserVO vo);
	
	// 주문 취소한 개수 조회하는 메서드
	int orcancelCount(UserVO vo);
	
	// 상품 교환한 개수 조회하는 메서드
	int orchangeCount(UserVO vo);
}
