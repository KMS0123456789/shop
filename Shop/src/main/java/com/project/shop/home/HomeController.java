package com.project.shop.home;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.shop.computer.vo.ComputerVO;


@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	HomeService service;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home(Model model) {	
		List<ComputerVO> home = service.home();
		model.addAttribute("home", home);
		return "home";
	}
	
}
