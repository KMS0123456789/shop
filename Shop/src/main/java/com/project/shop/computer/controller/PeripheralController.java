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

import com.project.shop.computer.service.PeripheralService;
import com.project.shop.computer.vo.PeripheralVO;



@Controller
@RequestMapping("/peripheral")
public class PeripheralController {
	
	@Autowired
	private PeripheralService service;
	
	//마우스 전체 조회
	@RequestMapping(value="/mouse.do", method=RequestMethod.GET)
	public String mouse(Model model, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword,
			HttpSession session) {
		Pageable pageable = PageRequest.of(page-1, 20);//한 페이지에 뜰 게시물 갯수(20개)
		int peripheralCategory = 0;//count 조회시 필요하기 때문에 카테고리를 지정해서 보냄(mouse이기 때문에 0번)
		Page<PeripheralVO> data = service.mouse(pageable, searchType, keyword, peripheralCategory);//data에 service.mouse 값 넣기
		model.addAttribute("mouse", data.getContent());//mouse키에 조회할 페이지 정보 넣어 보내기
		model.addAttribute("currentPage", page);//currentPage 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", data.getTotalPages());//totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("pageSize", 10);//pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		
		return "mouse";//mouse.jsp로 보냄
	}
	
	//키보드 전체 조회
	@RequestMapping(value="/keyboard.do", method=RequestMethod.GET)
	public String keyboard(Model model, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword,
			HttpSession session) {
		Pageable pageable = PageRequest.of(page-1, 20);//한 페이지에 뜰 게시물 갯수(20개)
		int peripheralCategory = 1;//count 조회시 필요하기 때문에 카테고리를 지정해서 보냄(keyboard이기 때문에 1번)
		Page<PeripheralVO> data = service.keyboard(pageable, searchType, keyword, peripheralCategory);//data에 service.keyboard 값 넣기
		model.addAttribute("keyboard", data.getContent());//keyboard키에 조회할 페이지 정보 넣어 보내기
		model.addAttribute("currentPage", page);//currentPage 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", data.getTotalPages());//totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("pageSize", 10);//pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		
		return "keyboard";//keyboard.jsp로 보냄
	}
	
	//모니터 전체 조회
	@RequestMapping(value="/monitor.do", method=RequestMethod.GET)
	public String monitor(Model model, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword,
			HttpSession session) {
		Pageable pageable = PageRequest.of(page-1, 20);//한 페이지에 뜰 게시물 갯수(20개)
		int peripheralCategory = 2;//count 조회시 필요하기 때문에 카테고리를 지정해서 보냄(monitor이기 때문에 2번)
		Page<PeripheralVO> data = service.monitor(pageable, searchType, keyword, peripheralCategory);//data에 service.monitor 값 넣기
		model.addAttribute("monitor", data.getContent());//monitor키에 조회할 페이지 정보 넣어 보내기
		model.addAttribute("currentPage", page);//currentPage 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", data.getTotalPages());//totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("pageSize", 10);//pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		
		return "monitor";//monitor.jsp로 보냄
	}
	
	@RequestMapping(value="/*.do/{peripheralNo}", method = RequestMethod.GET)
	public String computerPost(@PathVariable int peripheralNo, Model model) {
		//PeripheralNo에 해당하는 데이터 조회
		PeripheralVO peripheral = service.peripheralPost(peripheralNo); //컴퓨터에 service.computerPost 값 넣기
		model.addAttribute("peripheral", peripheral); //포워딩할 때 키 computer에 값 넣어 보내기
		return "peripheralPost";
	}
}
