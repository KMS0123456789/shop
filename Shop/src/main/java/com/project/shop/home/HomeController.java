package com.project.shop.home;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.shop.computer.vo.ComputerVO;
import com.project.shop.computer.vo.PeripheralVO;


@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	HomeService service;
	
	//홈페이지를 위한 조회 메서드
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home(Model model) {	
		List<ComputerVO> computer = service.computer(); //List<ComputerVO> 타입의 computer에 service.computer의 값 넣기
		List<PeripheralVO> peripheral = service.peripheral();//List<PeripheralVO> 타입의 peripheral에 service.peripheral의 값 넣기
		model.addAttribute("computer", computer); //포워딩할 때 computer에 computer 값 넣어 보내기
		model.addAttribute("peripheral", peripheral); //포워딩할 때 peripheral에 peripheral 값 넣어 보내기
		return "home";
	}
	
}
