package com.project.shop.computer.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.shop.computer.service.ComputerService;
import com.project.shop.computer.vo.ComputerVO;

@Controller
@RequestMapping("/computer")
public class ComputerController {
	
	@Autowired
	private ComputerService service;
	
	//완제품 전제 조회
	@RequestMapping(value="/computer.do", method=RequestMethod.GET)
	public String computer(Model model, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword,
			HttpSession session) {
		Pageable pageable = PageRequest.of(page-1, 20); //한 페이지에 뜰 게시물 갯수(20개)
		Page<ComputerVO> data = service.computer(pageable, searchType, keyword);//data에 service.computer 값 넣기
		model.addAttribute("computer", data.getContent()); //computer키에 조회할 페이지 정보 넣어 보내기
		model.addAttribute("currentPage", page); //currentPage 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", data.getTotalPages()); //totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("pageSize", 10); //pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		return "computer"; //computer.jsp로 보냄
	}
	
	//완제품 단건 조회
	@RequestMapping(value="/computer.do/{computerNo}", method = RequestMethod.GET)
	public String computerPost(@PathVariable int computerNo, Model model) {
		//computerNo에 해당하는 데이터 조회
		ComputerVO computer = service.computerPost(computerNo); //컴퓨터에 service.computerPost 값 넣기
		model.addAttribute("computer", computer); //포워딩할 때 키 computer에 값 넣어 보내기
		return "computerPost";
	}
}
