package com.project.shop.progress.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.shop.progress.service.AskService;
import com.project.shop.progress.vo.AskVO;

@Controller
@RequestMapping("/ask")
public class AskController {
	
	@Autowired
	private AskService service;
	
	//주문 전체 조회
	@RequestMapping(value="/managerAsk.do",method =RequestMethod.GET)
		public String managerask(Model model) {
			List<AskVO> askList = service.askAll();
			//askList에 service.askAll();의 값을 담는다.
			model.addAttribute("ask",askList);
			return"managerAsk"; //managerAsk.jsp로 리턴
		}
	//주문 수정
	@	RequestMapping(value="/managercancel.do",method =RequestMethod.GET)
		public String managercancel(Model model) {
		List<AskVO> askList = service.askAll();
		model.addAttribute("ask",askList);
		return"managercancel";
	}
	@RequestMapping(value="/managerdelivery.do", method = RequestMethod.GET)
		public String managerdeliver(Model model) {
		List<AskVO> askList = service.askAll();
		model.addAttribute("ask",askList);
		return"managerdelivery";
	}
	
	
	@RequestMapping(value="/myOnedate.do",method =RequestMethod.GET)
	public String myOnedate(Model model) {
		List<AskVO> myOnedate = service.myOnedate();
		model.addAttribute("date",myOnedate);
		return "myorder";
	}
		
}
