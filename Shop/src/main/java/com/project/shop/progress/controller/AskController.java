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
	
	@RequestMapping(value="/managerAsk.do",method =RequestMethod.GET)
		public String managerask(Model model) {
			List<AskVO> askList = service.askAll();
			model.addAttribute("ask",askList);
			return"managerAsk";
		}
		
}
