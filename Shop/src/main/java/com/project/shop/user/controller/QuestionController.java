package com.project.shop.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.shop.user.service.QuestionService;
import com.project.shop.user.vo.QuestionVO;


@Controller
@RequestMapping("/question")
public class QuestionController {
	
	@Autowired
	private QuestionService service;
	
	//QnA 전체 조회
	@RequestMapping(value="/managerQnA.do",method = RequestMethod.GET)
	public String managerQnA(Model model) {
		//question에 대한 모든 데이터 조회
	        List<QuestionVO> questionList = service.questionAll();
	        //questionList에 service.questionAll 값 넣기
	        model.addAttribute("question", questionList);//포워딩할 때 키 question에 값 넣어 보내기
	        return "managerQnA";
	    }
	
	@RequestMapping(value="/questionComputer", method=RequestMethod.POST)
	public String questionComputer(QuestionVO vo,
			@RequestParam("computerNo") int computerNo) {
		service.questionComputer(vo);
		return "redirect:/computer/computer.do/"+computerNo;
	}
}
