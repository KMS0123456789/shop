package com.project.shop.progress.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.shop.progress.service.CartService;


@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartService service;
}
