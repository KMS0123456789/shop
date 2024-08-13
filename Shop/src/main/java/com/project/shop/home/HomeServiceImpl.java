package com.project.shop.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.computer.vo.ComputerVO;

@Service
public class HomeServiceImpl implements HomeService{
	@Autowired
	HomeRepository repository;
	
	@Override
	public List<ComputerVO> home() {
		return repository.home();
	}

}
