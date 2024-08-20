package com.project.shop.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.user.repository.AddrRepository;
import com.project.shop.user.service.AddrService;
import com.project.shop.user.vo.AddrVO;

@Service
public class AddrServiceImpl implements AddrService {
	
	@Autowired
	private AddrRepository repository;

	@Override
	public int myaddrplus(AddrVO vo) {
		return repository.myaddrplus(vo);
	}
}
