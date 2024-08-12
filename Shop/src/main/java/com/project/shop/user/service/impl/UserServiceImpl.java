package com.project.shop.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.shop.user.repository.UserRepository;
import com.project.shop.user.service.UserService;
import com.project.shop.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserRepository repository;
	
	@Override
	public List<UserVO>userAll() { //UserService에 있는 List<UserVO>userAll()을 가져온다
		return repository.userAll(); //repository.userAll값을 리턴
	}
	@Override
	public int blackList(UserVO vo) {
		return repository.blackList(vo);
	}
}
