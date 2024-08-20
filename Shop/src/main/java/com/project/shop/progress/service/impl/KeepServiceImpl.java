package com.project.shop.progress.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.progress.repository.KeepRepository;
import com.project.shop.progress.service.KeepService;
import com.project.shop.progress.vo.KeepVO;
import com.project.shop.user.vo.UserVO;

@Service
public class KeepServiceImpl implements KeepService{
	
	@Autowired
	private KeepRepository repository;
	
	//완제품 찜하기
	@Override
	public int keepComputer(KeepVO vo) {
		//QuestionRepository의 keepComputer 메서드 실행 KeepVO vo 파라미터로 같이 보냄
		return repository.keepComputer(vo);
	}
	
	//완제품 찜하기 취소
	@Override
	public int keepDeleteComputer(KeepVO vo) {
		//QuestionRepository의 keepDeleteComputer 메서드 실행 KeepVO vo 파라미터로 같이 보냄
		return repository.keepDeleteComputer(vo);
	}
	
	//주변기기 찜하기
	@Override
	public int keepPeripheral(KeepVO vo) {
		//QuestionRepository의 keepPeripheral 메서드 실행 KeepVO vo 파라미터로 같이 보냄
		return repository.keepPeripheral(vo);
	}
	
	//주변기기 찜하기 취소
	@Override
	public int keepDeletePeripheral(KeepVO vo) {
		//QuestionRepository의 keepDeletePeripheral 메서드 실행 KeepVO vo 파라미터로 같이 보냄
		return repository.keepDeletePeripheral(vo);
	}

}
