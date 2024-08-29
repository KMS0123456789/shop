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
	public AddrVO myaddrOne(int addrNo) {
		// TODO Auto-generated method stub
		return repository.myaddrOne(addrNo); // 배송 주소 단건 조회하는 메서드 호출
	}

	@Override
	public int myaddrModify(AddrVO vo) {
		// TODO Auto-generated method stub
		return repository.myaddrModify(vo); // 배송 주소 수정하는 메서드 호출
	}

	@Override
	public int myaddrDelete( List<String> arrayParams) {
		// TODO Auto-generated method stub
		return repository.myaddrDelete(arrayParams); // 배송 주소 삭제하는 메서드 호출.
	}
	
	@Override
	public List<AddrVO> myaddrlist(AddrVO vo) {
		// TODO Auto-generated method stub
		return repository.myaddrlist(vo); // 배송주소 가져오는 메서드 호출.
	}

	@Override
	public int myaddr1(AddrVO vo) {
		// TODO Auto-generated method stub
		return repository.myaddr1(vo); // 특정 배송주소를 제외한 나머지를 1로 업데이트하는 메서드 호출.
	}
	

	

}
