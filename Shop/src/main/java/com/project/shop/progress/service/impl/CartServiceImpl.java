package com.project.shop.progress.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.shop.progress.repository.CartRepository;
import com.project.shop.progress.service.CartService;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartRepository repository;

	@Override
	public int cartComputer(HashMap<String, Object> map) {
		return repository.cartComputer(map);
	}
}
