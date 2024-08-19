package com.project.shop.progress.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.shop.progress.service.CartService;


@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartService service;
	
	@RequestMapping(value="/cartComputer.do", method=RequestMethod.POST)
	public String cartComputer(
			@RequestParam("computerNo") int computerNo,
			@RequestParam("cartUser") String cartUser,
			@RequestParam(value="optSsd") int optSsd,
			@RequestParam(value="optHdd") int optHdd,
			@RequestParam(value="optOs") int optOs){
		HashMap<String, Object> map = new HashMap<>();
		map.put("cartUser", cartUser);
		map.put("computerNo", computerNo);
		map.put("optSsd", optSsd);
		map.put("optHdd", optHdd);
		map.put("optOs", optOs);
		service.cartComputer(map);
		return "redirect:/computer/computer.do/"+computerNo;
	}
	
	@RequestMapping(value="/cartPeripheral.do", method=RequestMethod.POST)
	public String cartPeripheral(
			@RequestParam("peripheralNo") int peripheralNo,
			@RequestParam("cartUser") String cartUser){
		HashMap<String, Object> map = new HashMap<>();
		map.put("cartUser", cartUser);
		map.put("peripheralNo", peripheralNo);
		service.cartPeripheral(map);
		return "redirect:/peripheral/peripheral.do/"+peripheralNo;
	}
}
