package com.project.shop.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.project.shop.user.repository.AnswerRepository;
import com.project.shop.user.service.AnswerService;
import com.project.shop.user.vo.AnswerVO;

@Controller
@RequestMapping("/answer")
public class AnswerController {
	
	@Autowired
	private AnswerService service;
	
	@Autowired
	private AnswerRepository repository;
	
	//QnA 답글
	@RequestMapping(value="/answerwrite.do", method=RequestMethod.GET)
	public String answerwrite(Model model,@RequestParam(value="questionNo") int questionNo) { 
		model.addAttribute("questionNo",questionNo); //questionNo에 questionNo 값을 넣어준다.
		return "answerwrite"; //answerwrite에 리턴한다.
	}
	
	//QnA 답글
	@RequestMapping(value="/answerwrite.do", method=RequestMethod.POST)
	public String answerwriteOk(AnswerVO vo) { 
		
		repository.answerwrite(vo); //repository에 있는 answerwite에 vo값 넣어준다.
		
		return "redirect:/question/managerQnA.do/"; // /question/managerQnA.do/으로 이동한다.
	}
		
}

