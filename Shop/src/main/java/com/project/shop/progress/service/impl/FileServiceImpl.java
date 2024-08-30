package com.project.shop.progress.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.progress.repository.FileRepository;
import com.project.shop.progress.service.FileService;
import com.project.shop.progress.vo.FileVO;

@Service
public class FileServiceImpl implements FileService{
	
	@Autowired
	private FileRepository repository;

	@Override
	public int computerwriteOk(List<FileVO> vo) {
		return repository.computerwriteOk(vo);
	}

	@Override
	public int peripheralwriteOk(List<FileVO> vo) {
		return repository.peripheralwriteOk(vo);
	}
}
