package com.project.shop.user.service;

import java.util.List;

import com.project.shop.user.vo.AddrVO;

public interface AddrService {
	
	//배송 주소 등록하는 메서드
	int myaddrplus(AddrVO vo);
	
	AddrVO myaddr_modify(int addrNo);
}
