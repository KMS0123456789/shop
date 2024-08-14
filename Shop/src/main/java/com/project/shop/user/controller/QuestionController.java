package com.project.shop.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.shop.user.service.QuestionService;
import com.project.shop.user.vo.QuestionVO;


@Controller
@RequestMapping("/question")
public class QuestionController {
	
	@Autowired
	private QuestionService service;
	
	@RequestMapping(value="/managerQnA.do",method = RequestMethod.GET)
	public String managerQnA(Model model) {
	        List<QuestionVO> questionList = service.questionAll();
	        model.addAttribute("question", questionList);
	        return "managerQnA";
	    }
}
