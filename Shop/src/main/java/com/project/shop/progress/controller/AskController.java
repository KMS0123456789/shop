package com.project.shop.progress.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.shop.progress.service.AskService;

@Controller
@RequestMapping("/ask")
public class AskController {
	
	@Autowired
	private AskService service;
}
