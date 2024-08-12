package com.project.shop.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.shop.user.service.UserService;
import com.project.shop.user.vo.UserVO;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/mypage.do", method=RequestMethod.GET)
	public String mypage() {
		return "mypage";
	}
	@RequestMapping(value="/manager.do", method=RequestMethod.GET) //경로에 user/manager 값이 오면 밑에 메서드가 실행됨
	public String manage(Model model) {		
		List<UserVO> UserList = userService.userAll();  //UserService에 있는 userAll메서드 결과값을 UserList에 담는다.
		model.addAttribute("user",UserList); //UserList의 결과값을 user라는 키에 담아넣는다.
		return "manager"; //user/manager.jsp로 리턴해준다.
	}
	@RequestMapping(value="/blackList.do",method=RequestMethod.POST)
	public String blackList(UserVO vo) {
		int result = userService.blackList(vo);
		if(result > 0) {
			return "redirect:/user/manager.do";
		}else {
			return "redirect:/user/manager.do";
		}		
	}
	
	 @RequestMapping(value = "/kakao/callback", produces = "application/json;charset=UTF-8")
	    public String kakaoCallback(@RequestParam String code) {
	        try {
	            // 카카오 사용자 정보를 가져오고, 저장 후 리다이렉트
	            userService.handleKakaoCallback(code);
	            return "redirect:/user/confirmation";
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "error"; // 에러 페이지로 리다이렉트
	        }
	    }
	 
	@GetMapping("/login")
    public String login() {
        return "login"; 
    }
	 
	 
    @GetMapping("/confirmation")
    public String confirmationPage() {
        return "confirmation"; // confirmation.jsp를 반환
    }
}
