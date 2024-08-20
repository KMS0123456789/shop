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
}
