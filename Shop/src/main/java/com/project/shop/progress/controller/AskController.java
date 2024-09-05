package com.project.shop.progress.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.shop.progress.service.AskDetailService;
import com.project.shop.progress.service.AskService;
import com.project.shop.progress.vo.AskDetailVO;
import com.project.shop.progress.vo.AskVO;
import com.project.shop.user.vo.UserVO;

@Controller
@RequestMapping("/ask")
public class AskController {
	
	@Autowired
	private AskService service;
	
	@Autowired
	private AskDetailService detailService;
	
	@PostMapping(value = "/completePay.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> completePayment(@RequestBody AskVO ask) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        service.completePaymentAndInsert(ask);
	        response.put("status", 200);
	        response.put("message", "결제가 완료되었습니다.");
	        return ResponseEntity.ok(response);
	    } catch (Exception e) {
	        response.put("status", 400);
	        response.put("message", "결제 실패: " + e.getMessage());
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
	    }
	}
	
    @GetMapping("/orderComplete.do")
    public String orderComplete() {
        return "orderComplete";
    }

	//주문 전체 조회
	@RequestMapping(value="/managerAsk.do",method =RequestMethod.GET)
		public String askAll(Model model,
				@RequestParam(name="page", required=false, defaultValue = "1") int page,
				@RequestParam(name="searchType", required=false) String searchType,
				@RequestParam(name="keyword", required=false) String keyword,
				HttpSession session) {
			PageRequest pageable = PageRequest.of(page-1, 10); //한 페이지에 뜰 게시물 갯수(10개)
			Page<AskVO> data = service.askAll(pageable, searchType, keyword); //data에 service.askAll 값 넣기
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
		Page<AskVO> data = service.askAll(pageable, searchType, keyword); //data에 service.askAll 값 넣기
		model.addAttribute("ask",data.getContent()); //ask 키에 조회할 페이지 정보 넣어 보내기
		model.addAttribute("currentPage", page); //currentPage 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", data.getTotalPages()); //totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("pageSize", 10); //pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		return"managercancel";
	}
	
	//배송 목록 조회
	@RequestMapping(value="/managerdelivery.do", method = RequestMethod.GET)
		public String managerdeliver(Model model,
				@RequestParam(name="page", required=false, defaultValue = "1") int page,
				@RequestParam(name="searchType", required=false) String searchType,
				@RequestParam(name="keyword", required=false) String keyword,
				HttpSession session) {
		PageRequest pageable =  PageRequest.of(page-1, 10); //한 페이지에 뜰 게시물 갯수(10개)
		Page<AskVO> data = service.askAll(pageable, searchType, keyword);  //data에 service.askAll 값 넣기
		model.addAttribute("ask",data.getContent()); //ask 키에 조회할 페이지 정보 넣어 보내기
		model.addAttribute("currentPage", page); //currentPage 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", data.getTotalPages()); //totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("pageSize", 10); //pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		return"managerdelivery";
	}
	
	
	@RequestMapping(value="/myOnedate.do",method =RequestMethod.GET)
	public String myOnedate(Model model) {
		List<AskVO> myOnedate = service.myOnedate();
		model.addAttribute("date",myOnedate);
		return "myorder";
	}
	
	@RequestMapping(value = "/myorder_cancel.do", method = RequestMethod.POST)
    public String myorder_cancel() {
        return "myorder_cancel";
    }
    
    @RequestMapping(value = "/myorder_past.do", method = RequestMethod.POST)
    public String myorder_past() {
        return "myorder_past";
    }
	
    @RequestMapping(value = "/myorder.do", method = RequestMethod.GET)
    public String myorder() {
        return "myorder";
    }
    
    @RequestMapping(value="/computerBuy.do", method = RequestMethod.POST)
    public String computerBuy(AskVO avo, AskDetailVO advo, Model model) {
    	service.computerBuy(avo);
    	advo.setAskNo(avo.getAskNo());
    	detailService.computerBuy(advo);
    	avo.setAskNo(avo.getAskNo());
    	AskVO ask = service.computerBuySelect(avo);
    	AskDetailVO detail = detailService.computerBuySelect(advo);
    	model.addAttribute("ask", ask);
    	model.addAttribute("detail",detail);
    	return "computerBuy";
    }
    
    @RequestMapping(value="/completeComputerBuy.do", method = RequestMethod.POST)
    public String completeComputerBuy(AskVO vo) {
    	service.completeComputerBuy(vo);
    	return "orderCompleteComputer";
    }
    
    @RequestMapping(value="/orderCompleteComputer.do")
    public String orderCompleteComputer(@RequestParam("askNo") int askNo, 
    		Model model, AskDetailVO vo, HttpSession session) {
    	UserVO user = (UserVO)session.getAttribute("user");
    	vo.setAskDetailUser(user.getEmail());
    	vo.setAskNo(askNo);
    	AskDetailVO detail = detailService.orderCompleteComputer(vo);
    	model.addAttribute("detail",detail);
    	return "orderCompleteComputer";
    }
    
    
    @RequestMapping(value="/peripheralBuy.do", method = RequestMethod.POST)
    public String peripheralBuy(AskVO avo, AskDetailVO advo, Model model) {
    	service.peripheralBuy(avo);
    	advo.setAskNo(avo.getAskNo());
    	detailService.peripheralBuy(advo);
    	avo.setAskNo(avo.getAskNo());
    	AskVO ask = service.peripheralBuySelect(avo);
    	AskDetailVO detail = detailService.peripheralBuySelect(advo);
    	model.addAttribute("ask", ask);
    	model.addAttribute("detail",detail);
    	return "peripheralBuy";
    }
    
    @RequestMapping(value="/completePeripheralBuy.do", method = RequestMethod.POST)
    public String completeperipheralBuy(AskVO vo) {
    	service.completePeripheralBuy(vo);
    	return "orderCompletePeripheral";
    }
    
    @RequestMapping(value="/orderCompletePeripheral.do")
    public String orderCompletePeripheral(@RequestParam("askNo") int askNo, 
    		Model model, AskDetailVO vo, HttpSession session) {
    	UserVO user = (UserVO)session.getAttribute("user");
    	vo.setAskDetailUser(user.getEmail());
    	vo.setAskNo(askNo);
    	AskDetailVO detail = detailService.orderCompletePeripheral(vo);
    	model.addAttribute("detail",detail);
    	return "orderCompletePeripheral";
    }
    // 구매확정
    @RequestMapping(value = "/buyOk.do", method = RequestMethod.GET)
    public String buyOk(AskVO vo , Model model, int askNo) {
    	
    	System.out.println(askNo);
    	int buyOk = service.buyOk(vo);
    	
    	if(buyOk > 0) {
    		return "redirect:/ask/myorder.do";
    	}else {
    		return "redirect:/ask/myorder.do";
    	}
    }
}
