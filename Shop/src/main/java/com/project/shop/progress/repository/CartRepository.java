package com.project.shop.progress.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.progress.vo.CartVO;

@Repository
public class CartRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "CartMapper";
	
    public List<CartVO> getCartItemsByUser(String user) {
        return template.selectList(NAME_SPACE + ".getCartItemsByUser", user);
    }

    public List<CartVO> getCartItemsWithDetails(String user) {
        return template.selectList(NAME_SPACE + ".getCartItemsWithDetails", user);
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
