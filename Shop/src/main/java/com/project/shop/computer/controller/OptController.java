package com.project.shop.computer.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.shop.computer.repository.OptRepository;
import com.project.shop.computer.service.OptService;
import com.project.shop.computer.vo.ComputerVO;
import com.project.shop.computer.vo.OptVO;
import com.project.shop.progress.vo.AskVO;


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
	@RequestMapping(value="/optList.do",method =RequestMethod.GET)
	public String optList(Model model,
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword,
			HttpSession session) {
	PageRequest pageable = PageRequest.of(page-1, 10); //한 페이지에 뜰 게시물 갯수(10개)
	Page<OptVO> data = service.optList(pageable, searchType, keyword); //data에 service.askAll 값 넣기
	model.addAttribute("opt",data.getContent()); //ask 키에 조회할 페이지 정보 넣어 보내기
	model.addAttribute("currentPage", page); //currentPage 키에 페이지 수 넣어 보내기
	model.addAttribute("totalPage", data.getTotalPages()); //totalPage 키에 총 페이지 수 넣어 보내기
	model.addAttribute("pageSize", 10); //pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
	return"optList";
	}
	@RequestMapping(value = "/optDelete.do", method = RequestMethod.GET)
    public String optDelete(OptVO vo , Model model) {
    	
    	int optDelete = service.optDelete(vo);
    	
    	if(optDelete > 0) {
    		return "redirect:/opt/optList.do";
    	}else {
    		return "redirect:/user/manager.do";
    	}
    }
}

