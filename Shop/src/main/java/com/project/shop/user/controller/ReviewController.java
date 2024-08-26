package com.project.shop.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.shop.user.service.ReviewService;
import com.project.shop.user.service.StarService;
import com.project.shop.user.vo.ReviewVO;
import com.project.shop.user.vo.StarVO;


@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private StarService starService;
	
	@RequestMapping(value="/reviewComputer", method = RequestMethod.POST)
	public String reviewComputer(ReviewVO rvo, StarVO svo,
			@RequestParam("computerNo") int computerNo) {
		reviewService.reviewComputer(rvo);
		starService.starComputer(svo);
		return "redirect:/computer/computer.do/"+computerNo;
	}
	
	@RequestMapping(value="/reviewPeripheral", method = RequestMethod.POST)
	public String reviewPeripheral(ReviewVO rvo, StarVO svo,
			@RequestParam("peripheralNo") int peripheralNo) {
		reviewService.reviewPeripheral(rvo);
		starService.starPeripheral(svo);
		return "redirect:/peripheral/peripheral.do/"+peripheralNo;
	}
}
