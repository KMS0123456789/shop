package com.project.shop.progress.service;

import java.util.List;

import com.project.shop.progress.vo.FileVO;

public interface FileService {
	
	 int computerwriteOk(List<FileVO> vo);
	 
	 int peripheralwriteOk(List<FileVO> vo);
}
