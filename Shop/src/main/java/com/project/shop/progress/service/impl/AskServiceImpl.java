package com.project.shop.progress.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.progress.repository.AskRepository;
import com.project.shop.progress.service.AskService;
import com.project.shop.progress.vo.AskVO;

@Service
public class AskServiceImpl implements AskService{
	
	@Autowired
	private AskRepository repository;
	
	//ask 전체 조회
	@Override
	public List<AskVO> askAll(){
		return repository.askAll(); //askRepository에서 askAll 메서드 실행
	}
}
