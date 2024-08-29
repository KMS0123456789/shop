package com.project.shop.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.shop.user.repository.QuestionRepository;
import com.project.shop.user.service.QuestionService;
import com.project.shop.user.vo.QuestionVO;



@Controller
@RequestMapping("/question")
public class QuestionController {
	
	@Autowired
	private QuestionService service;
	
	@Autowired
	private QuestionRepository repository;
	
	
	//QnA 전체 조회
	@RequestMapping(value="/managerQnA.do",method = RequestMethod.GET)
	public String managerQnA(Model model,
		@RequestParam(name="page", required=false, defaultValue = "1") int page,
		@RequestParam(name="searchType", required=false) String searchType,
		@RequestParam(name="keyword", required=false) String keyword,
		HttpSession session) {
	PageRequest pageable = PageRequest.of(page-1, 10);
	Page<QuestionVO> data = service.managerQnA(pageable, searchType, keyword);//data에 service.question 값 넣기
	model.addAttribute("question", data.getContent()); //question키에 조회할 페이지 정보 넣어 보내기
	model.addAttribute("currentPage", page); //currentPage 키에 페이지 수 넣어 보내기
	model.addAttribute("totalPage", data.getTotalPages()); //totalPage 키에 총 페이지 수 넣어 보내기
	model.addAttribute("pageSize", 10); //pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
	return "managerQnA"; 
	}
	
	//완제품 상세페이지에서 문의글 쓰기
	@RequestMapping(value="/questionComputer", method=RequestMethod.POST)
	public String questionComputer(QuestionVO vo,
			@RequestParam("computerNo") int computerNo) {
		//QuestionService의 questionComputer 메서드 실행 QuestionVO vo 파라미터로 같이 보냄
		service.questionComputer(vo);
		
		//해당 페이지로 다시 리다이렉트
		//리다이렉트 하기 위해서 computerNo를 받아옴
		return "redirect:/computer/computer.do/"+computerNo;
	}
	
	//주변기기 상세페이지에서 문의글 쓰기
	@RequestMapping(value="/questionPeripheral", method=RequestMethod.POST)
	public String questionPeripheral(QuestionVO vo,
			@RequestParam("peripheralNo") int peripheralNo) {
		//QuestionService의 questionPeripheral 메서드 실행 QuestionVO vo 파라미터로 같이 보냄
		service.questionPeripheral(vo);
		
		//해당 페이지로 다시 리다이렉트
		//리다이렉트 하기 위해서 peripheralNo를 받아옴
		return "redirect:/peripheral/peripheral.do/"+peripheralNo;
	}
	
	//QnA 상세 페이지
	@RequestMapping(value="/questionPost.do/{questionNo}",method =RequestMethod.GET)
	public String questionPost(@PathVariable int questionNo,Model model){
		
		QuestionVO vo =service.questionPost(questionNo); //service에 있는 questionPost을 vo에 넣어준다.
		
		model.addAttribute("vo", vo);  //키 vo에 vo값을 넣어준다.
		
		return "questionPost";  //questionPost.jsp로 이동.
	}
}
