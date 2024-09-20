package com.project.shop.progress.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.computer.vo.ComputerVO;
import com.project.shop.computer.vo.PeripheralVO;
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
	public List<CartVO> getSelectedItems(int[] cartNos) {
	    List<CartVO> selectedItems = new ArrayList<>();
	    
	    for (int cartNo : cartNos) {
	        CartVO item = repository.selectItemByCartNo(cartNo);
	        if (item != null) {
	            // 컴퓨터 또는 주변기기 정보 설정
	            if (item.getItemCategory() == 1) {
	                List<ComputerVO> computers = repository.selectComputerByNo(item.getComputerNo());
	                item.setComputers(computers);
	                item.setFiles(computers.get(0).getFiles()); // 컴퓨터에 연결된 파일 설정
	            } else {
	                List<PeripheralVO> peripherals = repository.selectPeripheralByNo(item.getPeripheralNo());
	                item.setPeripherals(peripherals);
	                item.setFiles(peripherals.get(0).getFiles()); // 주변기기에 연결된 파일 설정
	            }
	            selectedItems.add(item);
	        }
	    }
	    
	    return selectedItems;
	}
    
    @Override
    public List<CartVO> getCartItemsWithDetails(String userId) {
        return repository.getCartItemsWithDetails(userId);
    }
    
    @Override
    public void clearCart(String userEmail) throws Exception {
        repository.deleteAllByUserEmail(userEmail);
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
