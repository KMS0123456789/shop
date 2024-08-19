package com.project.shop.progress.service;

import java.util.HashMap;

public interface CartService {
	int cartComputer(HashMap<String, Object> map);
	
	int cartPeripheral(HashMap<String, Object> map);
}
