package com.project.shop.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.computer.vo.ComputerVO;
import com.project.shop.computer.vo.PeripheralVO;

@Service
public class HomeServiceImpl implements HomeService{
	@Autowired
	HomeRepository repository;
	
	//HomeRepository의 computer 메서드 실행
	@Override
	public List<ComputerVO> computer() {
		return repository.computer();
	}
	
	//HomeRepository의 peripheral 메서드 실행
	@Override
	public List<PeripheralVO> peripheral() {
		return repository.peripheral();
	}
	
	

}
