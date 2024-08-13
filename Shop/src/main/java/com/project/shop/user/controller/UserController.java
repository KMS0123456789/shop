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
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
    public String mypage() {
        return "mypage";
    }

    @RequestMapping(value = "/manager.do", method = RequestMethod.GET)
    public String manage(Model model) {
        List<UserVO> userList = userService.userAll();
        model.addAttribute("user", userList);
        return "manager";
    }

    @RequestMapping(value = "/blackList.do", method = RequestMethod.POST)
    public String blackList(UserVO vo) {
        int result = userService.blackList(vo);
        return "redirect:/user/manager.do";
    }

    @RequestMapping(value = "/kakao/callback.do", produces = "application/json;charset=UTF-8")
    public String kakaoCallback(@RequestParam String code, HttpSession session) {
        try {
            UserVO user = userService.handleKakaoCallback(code);  // 카카오 인증 코드를 처리하고 사용자 정보를 가져옴

            // 이미 가입한 사용자인지 확인
            if (user != null) {
                // 로그인 처리
                session.setAttribute("loggedInUser", user);  // 세션에 사용자 정보를 저장
                return "redirect:/user/mypage.do";  // 로그인 후 마이페이지로 리다이렉트
            }

            return "redirect:/user/login.do";  // 가입되지 않은 사용자는 로그인 페이지로 리다이렉트
        } catch (Exception e) {
            e.printStackTrace();  // 에러 발생 시 스택 트레이스를 출력
            return "error";  // 에러 페이지로 이동
        }
    }

    @GetMapping("/login.do")
    public String login(HttpSession session) {
        UserVO loggedInUser = (UserVO) session.getAttribute("loggedInUser");  // 세션에서 로그인된 사용자 정보를 가져옴

        if (loggedInUser != null) {
            return "redirect:/user/mypage.do";  // 이미 로그인된 상태라면 마이페이지로 이동
        }

        return "login";  // 로그인되지 않은 상태라면 로그인 페이지로 이동
    }

    @GetMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();  // 세션 무효화 (로그아웃)
        return "redirect:/user/login.do";  // 로그아웃 후 로그인 페이지로 리다이렉트
    }
}

