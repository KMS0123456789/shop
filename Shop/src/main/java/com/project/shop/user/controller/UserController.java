package com.project.shop.user.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.shop.computer.service.ComputerService;
import com.project.shop.computer.service.PeripheralService;
import com.project.shop.computer.vo.ComputerVO;
import com.project.shop.computer.vo.PeripheralVO;
import com.project.shop.progress.vo.KeepVO;
import com.project.shop.user.service.QuestionService;
import com.project.shop.user.service.ReviewService;
import com.project.shop.user.service.UserService;
import com.project.shop.user.vo.AddrVO;
import com.project.shop.user.vo.QuestionVO;
import com.project.shop.user.vo.ReviewVO;
import com.project.shop.user.vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    
    @Autowired
    private ReviewService reviewService;
    
    @Autowired
    private QuestionService questionService;
    
    @Autowired
	private ComputerService computerService;
	
	@Autowired
	private PeripheralService perpheralService;
    
    //마이페이지
    @RequestMapping(value = "/mypage.do", method = RequestMethod.POST)
    public String mypage(UserVO vo, Model model, KeepVO kvo) {
    	
    	UserVO mylist = userService.mylist(vo); // 내가 찜한 개수,장바구니 개수, 결제완료 개수 ,배송준비중 개수,배송완료 개수, 취소/교환 개수 불러옴.
    	model.addAttribute("my", mylist); // 모델에 담아 화면에 출력할수 있게 함.
        return "mypage";
    }

    @RequestMapping(value = "/myboard.do", method = RequestMethod.GET)
    public String myboard(Model model, String email,
    							@RequestParam(name="page", required=false, defaultValue = "1") int page,
    							@RequestParam(name="page2", required=false, defaultValue = "1") int page2,
    							@RequestParam(name="searchType", required=false) String searchType,
    							@RequestParam(name="keyword", required=false) String keyword,
     							HttpSession session) {
    	Pageable pageable = PageRequest.of(page-1, 5);
		Pageable pageable2 = PageRequest.of(page2-1, 5);
		Page<ReviewVO> myreviewlist = reviewService.myreview(pageable2, searchType, keyword, email);
    	Page<QuestionVO> myquestionlist = questionService.myquestion(pageable, searchType, keyword, email); 
    	model.addAttribute("myreview", myreviewlist.getContent());
    	model.addAttribute("myquestion", myquestionlist.getContent());
    	model.addAttribute("currentPage", page); //currentPage 키에 페이지 수 넣어 보내기
    	model.addAttribute("currentPage2", page2); //currentPage2 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", myquestionlist.getTotalPages()); //totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("totalPage2", myreviewlist.getTotalPages()); //totalPage2 키에 총 페이지 수 넣어 보내기
		model.addAttribute("pageSize", 10); //pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		model.addAttribute("email", email);
		model.addAttribute("email2", email);
        return "myboard";
    }

    //user 전체 조회
    @RequestMapping(value="/blacklist.do",method = RequestMethod.GET)
	public String manageuser(Model model,
		@RequestParam(name="page", required=false, defaultValue = "1") int page,
		@RequestParam(name="searchType", required=false) String searchType,
		@RequestParam(name="keyword", required=false) String keyword,
		HttpSession session) {
	PageRequest pageable = PageRequest.of(page-1, 10);
	Page<UserVO> data = userService.userAll(pageable, searchType, keyword);//data에 service.blacklist 값 넣기
	model.addAttribute("user", data.getContent()); //question키에 조회할 페이지 정보 넣어 보내기
	model.addAttribute("currentPage", page); //currentPage 키에 페이지 수 넣어 보내기
	model.addAttribute("totalPage", data.getTotalPages()); //totalPage 키에 총 페이지 수 넣어 보내기
	model.addAttribute("pageSize", 10); //pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
	return "blacklist"; 
	}

    //유저 타입을 블랙리스트로 변경
    @RequestMapping(value = "/blackList.do", method = RequestMethod.POST)
    public String blackList(UserVO vo) {
    	//result에 userService.blackList 값 넣기
        int result = userService.blackList(vo);
        return "redirect:/user/blacklist.do"; //블랙리스트 추가 후 관리자 페이지로 리다이렉트
    }

    @RequestMapping(value = "/kakao/callback.do", produces = "application/json;charset=UTF-8")
    public String join(@RequestParam String code, HttpSession session) {
        try {
            UserVO user = userService.join(code);  // 카카오 인증 코드를 처리하고 사용자 정보를 가져옴

            // 이미 가입한 사용자인지 확인
            if (user != null) {
                // 로그인 처리
                session.setAttribute("user", user);  // 세션에 사용자 정보를 저장
                return "redirect:/?loginSuccess=true";  // 로그인 성공 후 홈으로 리다이렉트, 성공 여부 전달
            }

            return "redirect:/user/login.do";  // 가입되지 않은 사용자는 로그인 페이지로 리다이렉트
        } catch (Exception e) {
            e.printStackTrace();  // 에러 발생 시 스택 트레이스를 출력
            return "error";  // 에러 페이지로 이동
        }
    }

    @GetMapping("/login.do")
    public String login(HttpSession session, HttpServletRequest request) {
        return "login";  // 로그인되지 않은 상태라면 홈으로 이동
    }
    
    @PostMapping("/login.do")
    public String login(@ModelAttribute UserVO vo, HttpSession session, HttpServletRequest request) {
        UserVO user = userService.login(vo);  // 서비스 계층을 통해 로그인 처리
        if (user != null) {
            session.setAttribute("user", user);
            return "redirect:/user/mypage.do";  // 로그인 성공 시 마이페이지로 리다이렉트
        }
        return "/";  // 로그인 실패 시 홈으로 이동
    }

    @GetMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();  // 세션 무효화 (로그아웃)
        return "redirect:/?logoutSuccess=true";  // 로그아웃 후 홈으로 리다이렉트하면서 로그아웃 성공 여부 전달
    }
    @RequestMapping(value ="/manager.do", method = RequestMethod.GET)
	public String manager(Model model,
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="page2", required=false, defaultValue = "1") int page2,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword,
				HttpSession session) {
    	Pageable pageable = PageRequest.of(page-1, 5);
		Pageable pageable2 = PageRequest.of(page2-1, 5);
		Page<ComputerVO> computer = computerService.computerManager(pageable2, searchType, keyword);
    	Page<PeripheralVO> peripheral = perpheralService.peripheralmanager(pageable, searchType, keyword); 
    	model.addAttribute("computer", computer.getContent());
    	model.addAttribute("peripheral", peripheral.getContent());
    	model.addAttribute("currentPage", page); //currentPage 키에 페이지 수 넣어 보내기
    	model.addAttribute("currentPage2", page2); //currentPage2 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", computer.getTotalPages()); //totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("totalPage2", peripheral.getTotalPages()); //totalPage2 키에 총 페이지 수 넣어 보내기		model.addAttribute("pageSize", 10); //pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		return "manager";
	}
    
}

