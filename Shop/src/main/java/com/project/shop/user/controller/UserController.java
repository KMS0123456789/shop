package com.project.shop.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.shop.user.service.UserService;
import com.project.shop.user.vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
    public String mypage(UserVO vo, Model model) {
    	
    	int keepCount = userService.keepCount(vo); // 내가 찜한 개수 불러옴.
    	int cartCount = userService.cartCount(vo); // 내가 장바구니에 담은 개수 불러옴.
    	int payCount = userService.payCount(vo); // 내가 결제완료한 개수 불러옴.
    	int dReadyCount = userService.dReadyCount(vo); // 상품 배송 준비중인 개수 불러옴.
    	int clearCount = userService.clearCount(vo); // 배송 완료된 개수 불러옴.
    	int orcancelCount = userService.orcancelCount(vo); // 상품교환한 개수 불러옴.
    	int orchangeCount = userService.orchangeCount(vo); // 상품 주문 취소한 개수 불러옴.
    	
    	model.addAttribute("keepCount", keepCount); // 찜한 개수를 모델에 담아 화면에 출력할수 있게 함.
    	model.addAttribute("cartCount", cartCount); // 장바구니에 담은 개수를 모델에 담아 화면에 출력할수 있게 함.
    	model.addAttribute("payCount", payCount); // 결제완료된 개수를 모델에 담아 화면에 출력할수 있게 함.
    	model.addAttribute("dReadyCount", dReadyCount); // 배송준비중인 개수를 모델에 담아 화면에 출력할수 있게 함.
    	model.addAttribute("clearCount", clearCount); // 배송 완료된 개수를 모델에 담아 화면에 출력할수 있게 함.
    	model.addAttribute("orcancelCount", orcancelCount); // 상품 교환한 개수를 모델에 담아 화면에 출력할수 있게 함.
    	model.addAttribute("orchangeCount", orchangeCount); // 상품 취소한 개수를 모델에 담아 화면에 출력할수 있게 함.
    	
        return "mypage";
    }
    
    @RequestMapping(value = "/myorder_cancel.do", method = RequestMethod.GET)
    public String myorder_cancel() {
        return "myorder_cancel";
    }
    
    @RequestMapping(value = "/myorder_past.do", method = RequestMethod.GET)
    public String myorder_past() {
        return "myorder_past";
    }
    
    @RequestMapping(value = "/myorder.do", method = RequestMethod.GET)
    public String myorder() {
        return "myorder";
    }
    
    @RequestMapping(value = "/mymodify.do", method = RequestMethod.GET)
    public String mymodify() {
        return "mymodify";
    }
    
    @RequestMapping(value = "/myaddrlist.do", method = RequestMethod.GET)
    public String myaddrlist() {
        return "myaddrlist";
    }
    
    @RequestMapping(value = "/myaddradd.do", method = RequestMethod.GET)
    public String myaddradd() {
        return "myaddradd";
    }
    
    @RequestMapping(value = "/myboard.do", method = RequestMethod.GET)
    public String myboard() {
        return "myboard";
    }
    
    
    //user 전체 조회
    @RequestMapping(value = "/blacklist.do", method = RequestMethod.GET)
    public String manageuser(Model model) {
    	//user에 대한 모든 유저 조회
        List<UserVO> userList = userService.userAll();
        //userList에 service.userAll 값 넣기
        model.addAttribute("user", userList);//포워딩할 때 키 user에 값 넣어 보내기
        return "blacklist";
    }

    //유저 타입을 블랙리스트로 변경
    @RequestMapping(value = "/blackList.do", method = RequestMethod.POST)
    public String blackList(UserVO vo) {
    	//result에 userService.blackList 값 넣기
        int result = userService.blackList(vo);
        return "redirect:/user/blacklist.do"; //블랙리스트 추가 후 관리자 페이지로 리다이렉트
    }
    @RequestMapping(value="/manager.do", method = RequestMethod.GET)
    public String manager() {
    	return "manager";
    }

    @RequestMapping(value = "/kakao/callback.do", produces = "application/json;charset=UTF-8")
    public String join(@RequestParam String code, HttpSession session) {
        try {
            UserVO user = userService.join(code);  // 카카오 인증 코드를 처리하고 사용자 정보를 가져옴

            // 이미 가입한 사용자인지 확인
            if (user != null) {
                // 로그인 처리
                session.setAttribute("user", user);  // 세션에 사용자 정보를 저장
                return "redirect:/user/mypage.do";  // 로그인 후 마이페이지로 리다이렉트
            }

            return "redirect:/user/login.do";  // 가입되지 않은 사용자는 로그인 페이지로 리다이렉트
        } catch (Exception e) {
            e.printStackTrace();  // 에러 발생 시 스택 트레이스를 출력
            return "error";  // 에러 페이지로 이동
        }
    }

    @GetMapping("/login.do")
    public String login(HttpSession session, HttpServletRequest request) {
        return "login";  // 로그인되지 않은 상태라면 로그인 페이지로 이동
    }
    
    @PostMapping("/login.do")
    public String login(@ModelAttribute UserVO vo, HttpSession session, HttpServletRequest request) {
        UserVO user = userService.login(vo);  // 서비스 계층을 통해 로그인 처리
        if (user != null) {
            session.setAttribute("user", user);
            return "redirect:/user/mypage.do";  // 로그인 성공 시 마이페이지로 리다이렉트
        }
        return "login";  // 로그인 실패 시 로그인 페이지로 이동
    }

    @GetMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();  // 세션 무효화 (로그아웃)
        return "redirect:/user/login.do";  // 로그아웃 후 로그인 페이지로 리다이렉트
    }
    
}

