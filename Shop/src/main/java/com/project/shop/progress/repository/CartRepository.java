package com.project.shop.progress.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.computer.vo.ComputerVO;
import com.project.shop.computer.vo.PeripheralVO;
import com.project.shop.progress.vo.CartVO;

@Repository
public class CartRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "CartMapper";
	
    public CartVO selectItemByCartNo(int cartNo) {
        return template.selectOne(NAME_SPACE + ".selectItemByCartNo", cartNo);
    }
	
    public List<ComputerVO> selectComputerByNo(int computerNo) {
        return template.selectList(NAME_SPACE + ".selectComputerByNo", computerNo);
    }

    public List<PeripheralVO> selectPeripheralByNo(int peripheralNo) {
        return template.selectList(NAME_SPACE + ".selectPeripheralByNo", peripheralNo);
    }

    public List<CartVO> getCartItemsWithDetails(String user) {
        return template.selectList(NAME_SPACE + ".getCartItemsWithDetails", user);
    }
    
    public void deleteAllByUserEmail(String userEmail) {
        template.delete(NAME_SPACE + ".deleteAllByUserEmail", userEmail);
    }
    
    // 개별 상품 삭제
    public void deleteCartItem(int cartNo) {
        template.delete(NAME_SPACE + ".deleteCartItem", cartNo);
    }

    // 선택된 상품 삭제
    public void deleteSelectedItems(List<Integer> cartNos) {
        template.delete(NAME_SPACE + ".deleteSelectedItems", cartNos);
    }

    // 모든 상품 삭제
    public int deleteAllItems(String cartUser) {
        return template.delete(NAME_SPACE + ".deleteAllItems", cartUser);
    }
    
	//완제품 상세 페이지에서 장바구니 담기
	public int cartComputer(CartVO vo) {
		//CartMapper의 cartComputer 메서드 실행 CartVO vo 파라미터로 같이 보냄
		return template.insert(NAME_SPACE + ".cartComputer", vo);
	}
	
	//주변기기 상세 페이지에서 장바구니 담기
	public int cartPeripheral(CartVO vo) {
		//CartMapper의 cartPeripheral 메서드 실행 CartVO vo 파라미터로 같이 보냄
		return template.insert(NAME_SPACE + ".cartPeripheral", vo);
	}
}
