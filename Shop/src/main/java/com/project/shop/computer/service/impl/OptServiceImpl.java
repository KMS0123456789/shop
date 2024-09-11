package com.project.shop.computer.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.project.shop.computer.repository.OptRepository;
import com.project.shop.computer.service.OptService;
import com.project.shop.computer.vo.OptVO;

@Service
public class OptServiceImpl implements OptService{
	
	@Autowired
	private OptRepository repository;

	//repository의 computerPost 메서드 실행
	@Override
	public List<OptVO> computerPost() {
		return repository.computerPost();
	}
	
	//repository의 optionInsert 메서드 실행
	@Override
	public int optionInsert(OptVO vo) {
		return repository.optionInsert(vo);
	}
	
	//repository의 optList 메서드 실행
	@Override
	public Page<OptVO>optList(Pageable pageable, String searchType, String keyword){
		return repository.optList(pageable, searchType, keyword); //AskRepository에서 askAll 메서드 실행
	}
	
	//repository의 optCount 메서드 실행
	@Override
	public int optCount(String searchType, String keyword) {
		return repository.optCount(searchType, keyword); //AskRepository의 메서드 count 실행
	}
	
	//repository의 optDelete 메서드 실행
	@Override
	public int optDelete(OptVO vo) {
		return repository.optDelete(vo);
	}	
}
