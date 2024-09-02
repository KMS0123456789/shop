package com.project.shop.progress.service;

import com.project.shop.progress.vo.CartVO;
import java.util.List;

public interface CartService {
	//주문 상품 리스트 조회
    List<CartVO> getCartItemsByUser(String userId);
    //장바구니 상품 리스트 조회
    List<CartVO> getCartItemsWithDetails(String userId);
    
    void deleteCartItem(int cartNo);

    void deleteSelectedItems(List<Integer> cartNos);

    int deleteAllItems(String cartUser);
    
	//완제품 상세페이지에서 장바구니 담기
	int cartComputer(CartVO vo);
	
	//주변기기 상세페이지에서 장바구니 담기
	int cartPeripheral(CartVO vo);
}
