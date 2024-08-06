package com.project.shop.computer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.shop.computer.service.OptService;


@Controller
@RequestMapping("/opt")
public class OptController {
	
	@Autowired
	private OptService service;
}
