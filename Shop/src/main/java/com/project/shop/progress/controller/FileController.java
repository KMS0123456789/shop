package com.project.shop.progress.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.shop.progress.service.FileService;


@Controller
@RequestMapping("/file")
public class FileController {
	
	@Autowired
	private FileService service;
}
