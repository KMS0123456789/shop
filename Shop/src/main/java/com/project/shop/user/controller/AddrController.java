package com.project.shop.user.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.shop.user.service.AddrService;
import com.project.shop.user.vo.AddrVO;
import com.project.shop.user.vo.UserVO;


@Controller
@RequestMapping("/addr")
public class AddrController {
	
	@Autowired
	private AddrService service;
	
	// 주소 등록
	@RequestMapping(value="/myaddrplus.do" , method=RequestMethod.POST)
	public String myaddrplus(AddrVO vo, @RequestParam(value="addrUserEmail") String email, 
									@RequestParam(value="addrFlag")int addrFlag, HttpSession session,
									RedirectAttributes redirect) {
		
		int result = service.myaddrplus(vo); //result에 myaddrplus값 넣기.
		redirect.addAttribute("addrUserEmail",email); // redirect할때 같이 값 넘겨주기.
		if(addrFlag == 0) { 
			UserVO user = (UserVO)session.getAttribute("user"); // User에 세션에서 가져온 아이디값 넣기.
			vo.setAddrNo(vo.getAddrNo()); // vo 타입으로 받아온 주소번호  넣기.
			vo.setAddrUserEmail(user.getEmail()); //userEmail에 세션에서 가져온 아이디 넣기.
			service.myaddr1(vo); // service.myaddr1에 vo 값 넣어줌.
		}
		if(result > 0) {
			return "redirect:/addr/myaddrlist.do"; // 성공시 myaddrlist로..
		}else {
			return "redirect:/addr/myaddradd.do";
		}
	}
	
	// 주소 단건 조회
	@RequestMapping(value = "/myaddrOne.do", method = RequestMethod.GET)
    public String myaddrOne(Model model, int addrNo) {
		
		AddrVO myaddrOne =service.myaddrOne(addrNo); //myaddrOne에 service.myaddrOne 값 넣기.
		model.addAttribute("myaddr", myaddrOne); // myaddr키에 myaddrOne값 넣기.
		
        return "myaddr_modify"; // myaddr_modify에 보내기.
    }
	
	// 주소 수정
	@RequestMapping(value="/myaddrModify.do" , method=RequestMethod.POST)
	public String myaddrModify(AddrVO vo, @RequestParam(value="addrFlag") int addrFlag,
										@RequestParam(value="addrUserEmail") String email, HttpSession session,
										RedirectAttributes redirect) {
		
		int result = service.myaddrModify(vo); //result에 service.myaddrModify 값 넣기.
		System.out.println(addrFlag); // addrFlag값 잘 넘어오나 확인.
		redirect.addAttribute("addrUserEmail", email); // redirect 할때 같이 값보내기 위해 param으로 가져온 email값 넣기.
		if(addrFlag == 0 && result > 0) {
			UserVO user = (UserVO)session.getAttribute("user");  // User에 세션에서 가져온 아이디값 넣기.
			vo.setAddrUserEmail(user.getEmail()); //userEmail에 세션에서 가져온 아이디 넣기.
			service.myaddr1(vo); // service.myaddr1에 vo 값 넣어줌.
			return "redirect:/addr/myaddrlist.do"; // 성공시 리스트로 redirect.
		}else {
			return "redirect:/addr/myaddrOne.do";
		}
			
	}
	
	// 주소 삭제 
	@RequestMapping(value="/myaddrDelete.do" , method=RequestMethod.POST)
	public String myaddrDelete(AddrVO vo, @RequestParam(value="checkArray[]") String[] arrayParams, Model model) {
			
			 service.myaddrDelete(Arrays.asList(arrayParams)); // 배열로 받아온 주소를 리스트로 변환 해서 service.myaddrDelete에 넣기.
			
			 return "redirect:/addr/myaddrlist.do"; // list 페이지 리턴.
	}
	
	// 주소 전체 조회.
	@RequestMapping(value = "/myaddrlist.do", method = RequestMethod.GET)
    public String myaddrlist(Model model, AddrVO vo) {
    	
    	List<AddrVO> myaddrlist = service.myaddrlist(vo); //myaddrlist에 service.myaddrlist(vo)값 넣기.
    	model.addAttribute("my", myaddrlist); // my 키에 myaddrlist 넣기.
        return "myaddrlist"; // list페이지로 보냄.
    }
	
	// 주소 추가 페이지
	@RequestMapping(value = "/myaddradd.do", method = RequestMethod.GET)
    public String myaddradd() {
        return "myaddradd";
    }
}
