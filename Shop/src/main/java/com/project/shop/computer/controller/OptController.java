package com.project.shop.computer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.shop.computer.repository.OptRepository;
import com.project.shop.computer.service.OptService;
import com.project.shop.computer.vo.ComputerVO;
import com.project.shop.computer.vo.OptVO;


@Controller
@RequestMapping("/opt")
public class OptController {
	
	@Autowired
	private com.project.shop.computer.service.ComputerService ComputerService;
	@Autowired
	private OptService service;
	@Autowired
	private OptRepository repository;
	
	@RequestMapping(value="/optionwrite.do", method=RequestMethod.GET)
	public String optionwrite() {
		return "optionwrite";
	}
	@RequestMapping(value="/optionwrite.do",method=RequestMethod.POST)
	public String optionwriteOk(OptVO vo){

		repository.optionInsert(vo);
		return "redirect:/user/manager.do";
	}
}

