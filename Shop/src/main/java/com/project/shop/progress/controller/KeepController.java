package com.project.shop.progress.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.shop.progress.service.KeepService;
import com.project.shop.progress.vo.KeepVO;
import com.project.shop.user.vo.UserVO;


@Controller
@RequestMapping("/keep")
public class KeepController {
	
	@Autowired
	private KeepService service;
	
	//완제품 찜하기
	@RequestMapping(value="/keepComputer.do", method = RequestMethod.POST)
	public String keepComputer(KeepVO vo,
			@RequestParam("computerNo") int computerNo) {
		//KeepService의 메서드 keepComputer 실행 KeepVO의 vo 파라미터로 같이 보냄
		service.keepComputer(vo);
		//해당 상세 페이지로 리다이렉드 
		//리다이렉트하기 위해 computerNo를 받아옴
		return "redirect:/computer/computer.do/"+computerNo;
	}
	
	//완제품 찜하기 취소
	@RequestMapping("keepDeleteComputer.do")
	public String keepDeleteComputer(KeepVO vo,
			@RequestParam("computerNo") int computerNo) {
		//KeepService의 메서드 keepDeleteComputer 실행 KeepVO의 vo 파라미터로 같이 보냄
		service.keepDeleteComputer(vo);
		//해당 상세 페이지로 리다이렉드 
		//리다이렉트하기 위해 computerNo를 받아옴
		return "redirect:/computer/computer.do/"+computerNo;
	}
	
	//주변기기 찜하기
	@RequestMapping(value="/keepPeripheral.do", method = RequestMethod.POST)
	public String keepPeripheral(KeepVO vo,
			@RequestParam("peripheralNo") int peripheralNo) {
		//KeepService의 메서드 keepPeripheral 실행 KeepVO의 vo 파라미터로 같이 보냄
		service.keepPeripheral(vo);
		//해당 상세 페이지로 리다이렉드 
		//리다이렉트하기 위해 computerNo를 받아옴
		return "redirect:/peripheral/peripheral.do/"+peripheralNo;
	}
	
	//주변기기 찜하기 취소
	@RequestMapping("keepDeletePeripheral.do")
	public String keepDeletePeripheral(KeepVO vo,
			@RequestParam("peripheralNo") int peripheralNo) {
		//KeepService의 메서드 keepDeletePeripheral 실행 KeepVO의 vo 파라미터로 같이 보냄
		service.keepDeletePeripheral(vo);
		//해당 상세 페이지로 리다이렉드 
		//리다이렉트하기 위해 computerNo를 받아옴
		return "redirect:/peripheral/peripheral.do/"+peripheralNo;
	}
}
