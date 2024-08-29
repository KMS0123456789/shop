package com.project.shop.user.service;

import java.util.List;

import com.project.shop.user.vo.AddrVO;

public interface AddrService {
	
	// 단일 주소 조회
	AddrVO getAddress(String userEmail);  
	// 주소 목록 조회
    List<AddrVO> getAddressesByUserEmail(String userEmail);  
	
	//배송 주소 등록하는 메서드
	int myaddrplus(AddrVO vo);
	
	// 배송 주소 단건 조회하는 메서드
	AddrVO myaddrOne(int addrNo);
	
	// 배송주소 수정하는 메서드
	int myaddrModify(AddrVO vo);
	
	//배송 주소 삭제하는 메서드
	int myaddrDelete(List<String> arrayParams);
	
	// 배송주소 가져오는 메서드
	List<AddrVO> myaddrlist(AddrVO vo);	
	
	// 배송주소 업데이트하는 메서드
	int myaddr1(AddrVO vo);
}
