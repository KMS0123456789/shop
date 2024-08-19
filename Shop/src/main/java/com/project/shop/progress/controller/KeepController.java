package com.project.shop.progress.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.shop.progress.service.KeepService;
import com.project.shop.user.vo.UserVO;


@Controller
@RequestMapping("/keep")
public class KeepController {
	
	@Autowired
	private KeepService service;
	
	@RequestMapping(value="/keepComputer.do", method = RequestMethod.POST)
	public String keepComputer(
			@RequestParam("computerNo") int computerNo,
			@RequestParam("keepUser") String keepUser) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("computerNo", computerNo);
		map.put("keepUser", keepUser);
		service.keepComputer(map);
		return "redirect:/computer/computer.do/"+computerNo;
	}
	@RequestMapping("keepDeleteComputer.do")
	public String keepDeleteComputer(
			@RequestParam("computerNo") int computerNo,
			@RequestParam("keepUser") String keepUser) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("computerNo", computerNo);
		map.put("keepUser", keepUser);
		service.keepDeleteComputer(map);
		return "redirect:/computer/computer.do/"+computerNo;
	}
}
