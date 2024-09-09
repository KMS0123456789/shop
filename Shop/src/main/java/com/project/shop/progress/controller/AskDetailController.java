package com.project.shop.progress.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.shop.progress.service.AskDetailService;
import com.project.shop.progress.vo.AskDetailVO;
import com.project.shop.progress.vo.AskVO;
import com.project.shop.user.vo.UserVO;


@Controller
@RequestMapping("/askdetail")
public class AskDetailController {
	
	@Autowired
	private AskDetailService service;
	
	// 특정 유저 하루 조회.
		@RequestMapping(value="/myOnedate.do",method =RequestMethod.GET)
		public String myOnedate(Model model, HttpSession session, String email, AskDetailVO vo,
										@RequestParam(name="page", required=false, defaultValue = "1") int page,
										@RequestParam(name="searchType", required=false) String searchType,
										@RequestParam(name="keyword", required=false) String keyword) {
			Pageable pageable = PageRequest.of(page-1, 5);
			UserVO user = (UserVO)session.getAttribute("user");
			vo.setAskDetailUser(user.getEmail());
			Page<AskDetailVO> myOnedate = service.myOnedate(pageable, searchType , keyword , vo);
			model.addAttribute("currentPage", page); //currentPage 키에 페이지 수 넣어 보내기
			model.addAttribute("date", myOnedate.getContent());
			model.addAttribute("totalPage", myOnedate.getTotalPages()); //totalPage 키에 총 페이지 수 넣어 보내기
			model.addAttribute("pageSize", 10); //pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
			model.addAttribute("email", vo.getAskDetailUser());
			return "myorder";
		}
		
		// 특정 유저 일주일 조회.
		@RequestMapping(value="/myOneweek.do",method =RequestMethod.GET)
		public String myOneweek(Model model, HttpSession session, AskDetailVO vo,
										@RequestParam(name="page", required=false, defaultValue = "1") int page,
										@RequestParam(name="searchType", required=false) String searchType,
										@RequestParam(name="keyword", required=false) String keyword) {
			Pageable pageable = PageRequest.of(page-1, 5);
			UserVO user = (UserVO)session.getAttribute("user");
			vo.setAskDetailUser(user.getEmail());
			Page<AskDetailVO> myOneweek = service.myOneweek(pageable, searchType , keyword , vo);
			model.addAttribute("currentPage", page); //currentPage 키에 페이지 수 넣어 보내기
			model.addAttribute("week", myOneweek.getContent());
			model.addAttribute("totalPage", myOneweek.getTotalPages()); //totalPage 키에 총 페이지 수 넣어 보내기
			model.addAttribute("pageSize", 10); //pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
			model.addAttribute("email", vo.getAskDetailUser());
			return "myorder";
		}
		
		// 특정 유저 한달 조회.
		@RequestMapping(value="/myOnemonth.do",method =RequestMethod.GET)
		public String myOnemonth(Model model, HttpSession session, AskDetailVO vo,
										@RequestParam(name="page", required=false, defaultValue = "1") int page,
										@RequestParam(name="searchType", required=false) String searchType,
										@RequestParam(name="keyword", required=false) String keyword) {
			Pageable pageable = PageRequest.of(page-1, 5);
			UserVO user = (UserVO)session.getAttribute("user");
			vo.setAskDetailUser(user.getEmail());
			Page<AskDetailVO> myOnemonth = service.myOnemonth(pageable, searchType , keyword , vo);
			model.addAttribute("currentPage", page); //currentPage 키에 페이지 수 넣어 보내기
			model.addAttribute("month", myOnemonth.getContent());
			model.addAttribute("totalPage", myOnemonth.getTotalPages()); //totalPage 키에 총 페이지 수 넣어 보내기
			model.addAttribute("pageSize", 10); //pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
			model.addAttribute("email", vo.getAskDetailUser());
			return "myorder";
		}
		
		// 특정 유저 세달 조회.
		@RequestMapping(value="/myThreemonth.do",method =RequestMethod.GET)
		public String myThreemonth(Model model, HttpSession session, AskDetailVO vo,
										@RequestParam(name="page", required=false, defaultValue = "1") int page,
										@RequestParam(name="searchType", required=false) String searchType,
										@RequestParam(name="keyword", required=false) String keyword) {
			Pageable pageable = PageRequest.of(page-1, 5);
			UserVO user = (UserVO)session.getAttribute("user");
			vo.setAskDetailUser(user.getEmail());
			Page<AskDetailVO> myThreemonth = service.myThreemonth(pageable, searchType , keyword , vo);
			model.addAttribute("currentPage", page); //currentPage 키에 페이지 수 넣어 보내기
			model.addAttribute("three", myThreemonth.getContent());
			model.addAttribute("totalPage", myThreemonth.getTotalPages()); //totalPage 키에 총 페이지 수 넣어 보내기
			model.addAttribute("pageSize", 10); //pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
			model.addAttribute("email", vo.getAskDetailUser());
			return "myorder";
		}
		
		// 특정 유저 여섯달 조회.
		@RequestMapping(value="/mySixmonth.do",method =RequestMethod.GET)
		public String mySixmonth(Model model, HttpSession session, AskDetailVO vo,
										@RequestParam(name="page", required=false, defaultValue = "1") int page,
										@RequestParam(name="searchType", required=false) String searchType,
										@RequestParam(name="keyword", required=false) String keyword) {
			Pageable pageable = PageRequest.of(page-1, 5);
			UserVO user = (UserVO)session.getAttribute("user");
			vo.setAskDetailUser(user.getEmail());
			Page<AskDetailVO> mySixmonth = service.mySixmonth(pageable, searchType , keyword , vo);
			model.addAttribute("currentPage", page); //currentPage 키에 페이지 수 넣어 보내기
			model.addAttribute("six", mySixmonth.getContent());
			model.addAttribute("totalPage", mySixmonth.getTotalPages()); //totalPage 키에 총 페이지 수 넣어 보내기
			model.addAttribute("pageSize", 10); //pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
			model.addAttribute("email", vo.getAskDetailUser());
			return "myorder";
		}

		//주문 전체 조회
		@RequestMapping(value="/managerAsk.do",method =RequestMethod.GET)
			public String askAll(Model model,
					@RequestParam(name="page", required=false, defaultValue = "1") int page,
					@RequestParam(name="searchType", required=false) String searchType,
					@RequestParam(name="keyword", required=false) String keyword,
					HttpSession session) {
				PageRequest pageable = PageRequest.of(page-1, 10); //한 페이지에 뜰 게시물 갯수(10개)
				Page<AskDetailVO> data = service.askAll(pageable, searchType, keyword); //data에 service.askAll 값 넣기
				model.addAttribute("ask", data.getContent()); //ask 키에 조회할 페이지 정보 넣어 보내기
				model.addAttribute("currentPage", page); //currentPage 키에 페이지 수 넣어 보내기
				model.addAttribute("totalPage", data.getTotalPages()); //totalPage 키에 총 페이지 수 넣어 보내기
				model.addAttribute("pageSize", 10); //pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
				return"managerAsk"; //managerAsk.jsp로 리턴
			}
		//주문 취소 목록 조회
		@	RequestMapping(value="/managercancel.do",method =RequestMethod.GET)
			public String managercancel(Model model,
					@RequestParam(name="page", required=false, defaultValue = "1") int page,
					@RequestParam(name="searchType", required=false) String searchType,
					@RequestParam(name="keyword", required=false) String keyword,
					HttpSession session) {
			PageRequest pageable = PageRequest.of(page-1, 10); //한 페이지에 뜰 게시물 갯수(10개)
			Page<AskDetailVO> data = service.askAll(pageable, searchType, keyword); //data에 service.askAll 값 넣기
			model.addAttribute("ask",data.getContent()); //ask 키에 조회할 페이지 정보 넣어 보내기
			model.addAttribute("currentPage", page); //currentPage 키에 페이지 수 넣어 보내기
			model.addAttribute("totalPage", data.getTotalPages()); //totalPage 키에 총 페이지 수 넣어 보내기
			model.addAttribute("pageSize", 10); //pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
			return"managercancel";
		}
		
		//배송 목록 조회
		@RequestMapping(value="/managerdelivery.do", method = RequestMethod.GET)
			public String managerdelivery(Model model,
					@RequestParam(name="page", required=false, defaultValue = "1") int page,
					@RequestParam(name="searchType", required=false) String searchType,
					@RequestParam(name="keyword", required=false) String keyword,
					HttpSession session) {
			PageRequest pageable =  PageRequest.of(page-1, 10); //한 페이지에 뜰 게시물 갯수(10개)
			Page<AskDetailVO> data = service.deliveryAll(pageable, searchType, keyword);  //data에 service.askAll 값 넣기
			model.addAttribute("ask",data.getContent()); //ask 키에 조회할 페이지 정보 넣어 보내기
			model.addAttribute("currentPage", page); //currentPage 키에 페이지 수 넣어 보내기
			model.addAttribute("totalPage", data.getTotalPages()); //totalPage 키에 총 페이지 수 넣어 보내기
			model.addAttribute("pageSize", 10); //pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
			return"managerdelivery";
		}


}
