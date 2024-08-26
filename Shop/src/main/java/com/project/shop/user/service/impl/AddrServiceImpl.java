package com.project.shop.user.service.impl;

import java.util.List;

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
		return repository.myaddrplus(vo); // 배송 주소 등록하는 메서드 호출
	}

	@Override
	public AddrVO myaddr_modify(int addrNo) {
		// TODO Auto-generated method stub
		return repository.myaddr_modify(addrNo);
	}

}
