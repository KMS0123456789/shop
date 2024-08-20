package com.project.shop.progress.service;


import com.project.shop.progress.vo.CartVO;

public interface CartService {
	//완제품 상세페이지에서 장바구니 담기
	int cartComputer(CartVO vo);
	
	//주변기기 상세페이지에서 장바구니 담기
	int cartPeripheral(CartVO vo);
}
