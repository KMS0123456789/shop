package com.project.shop.progress.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.shop.progress.service.CartService;
import com.project.shop.progress.vo.CartVO;


@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartService service;
	
	//완제품 상세페이지에서 장바구니 담기
	@RequestMapping(value="/cartComputer.do", method=RequestMethod.POST)
	public String cartComputer(CartVO vo,
			@RequestParam("computerNo") int computerNo){
		//CartService의 메서드 cartComputer 실행 CartVO vo 파라미터로 같이 보냄
		service.cartComputer(vo);
		//해당 상세페이지로 리다이렉트
		//리다이렉트 하기 위해서 computerNo 받아옴
		return "redirect:/computer/computer.do/"+computerNo;
	}
	
	//주변기기 상세페이지에서 장바구니 담기
	@RequestMapping(value="/cartPeripheral.do", method=RequestMethod.POST)
	public String cartPeripheral(CartVO vo,
			@RequestParam("peripheralNo") int peripheralNo){
		//CartService의 메서드 cartPeripheral실행 CartVO vo 파라미터로 같이 보냄
		service.cartPeripheral(vo);
		//해당 상세페이지로 리다이렉트
		//리다이렉트 하기 위해서 computerNo 받아옴
		return "redirect:/peripheral/peripheral.do/"+peripheralNo;
	}
}
