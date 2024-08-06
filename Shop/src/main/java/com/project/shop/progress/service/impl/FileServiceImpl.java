package com.project.shop.progress.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.progress.repository.FileRepository;
import com.project.shop.progress.service.FileService;

@Service
public class FileServiceImpl implements FileService{
	
	@Autowired
	private FileRepository repository;
}
