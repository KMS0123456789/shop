package com.project.shop.progress.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.progress.repository.CartRepository;
import com.project.shop.progress.service.CartService;
import com.project.shop.progress.vo.CartVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartRepository repository;

    @Override
    public List<CartVO> getCartItemsByUser(String user) {
        return repository.getCartItemsByUser(user);
    }
    
    @Override
    public List<CartVO> getCartItemsWithDetails(String userId) {
        return repository.getCartItemsWithDetails(userId);
    }
	
    // 개별 상품 삭제
    @Override
    public void deleteCartItem(int cartNo) {
        repository.deleteCartItem(cartNo);
    }

    // 선택된 상품 삭제
    @Override
    public void deleteSelectedItems(List<Integer> cartNos) {
        repository.deleteSelectedItems(cartNos);
    }

    // 모든 상품 삭제
    @Override
    public int deleteAllItems(String cartUser) {
        int deletedCount = repository.deleteAllItems(cartUser);
        return deletedCount;
    }
    
	@Override
	public int cartComputer(CartVO vo) {
		//CartRepository의 cartComputer 메서드 실행 CartVO vo 파라미터로 같이 보냄
		return repository.cartComputer(vo);
	}
	
	@Override
	public int cartPeripheral(CartVO vo) {
		//CartRepository의 cartPeripheral 메서드 실행 CartVO vo 파라미터로 같이 보냄
		return repository.cartPeripheral(vo);
	}
}
