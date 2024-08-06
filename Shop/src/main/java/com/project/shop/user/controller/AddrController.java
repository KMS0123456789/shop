package com.project.shop.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.shop.user.service.AddrService;


@Controller
@RequestMapping("/addr")
public class AddrController {
	
	@Autowired
	private AddrService service;
}
