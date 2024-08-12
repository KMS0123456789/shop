package com.project.shop.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.shop.user.service.UserService;
import com.project.shop.user.vo.UserVO;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService service;
	
	@RequestMapping(value="/mypage.do", method=RequestMethod.GET)
	public String mypage() {
		return "mypage";
	}
	@RequestMapping(value="/manager.do", method=RequestMethod.GET) //경로에 user/manager 값이 오면 밑에 메서드가 실행됨
	public String manage(Model model) {		
		List<UserVO> UserList = service.userAll();  //UserService에 있는 userAll메서드 결과값을 UserList에 담는다.
		model.addAttribute("user",UserList); //UserList의 결과값을 user라는 키에 담아넣는다.
		return "manager"; //user/manager.jsp로 리턴해준다.
	}
	@RequestMapping(value="/blackList.do",method=RequestMethod.POST)
	public String blackList(UserVO vo) {
		int result = service.blackList(vo);
		if(result > 0) {
			return "redirect:/user/manager.do";
		}else {
			return "redirect:/user/manager.do";
		}		
	}
}
