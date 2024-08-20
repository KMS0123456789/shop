package com.project.shop.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.shop.user.service.AddrService;
import com.project.shop.user.vo.AddrVO;


@Controller
@RequestMapping("/addr")
public class AddrController {
	
	@Autowired
	private AddrService service;
	
	@RequestMapping(value="/myaddrplus.do" , method=RequestMethod.POST)
	public String myaddrplus(AddrVO vo) {
		
		int result = service.myaddrplus(vo);
		if(result > 0) {
			return "redirect:/user/myaddrlist.do";
		}else {
			return "redirect:/user/myaddradd.do";
		}
	}
}
