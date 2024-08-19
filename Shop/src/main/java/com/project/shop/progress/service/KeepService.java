package com.project.shop.progress.service;

import java.util.HashMap;


public interface KeepService {
	int keepComputer(HashMap<String, Object> map);
	
	int keepDeleteComputer(HashMap<String, Object> map);
	
	int keepPeripheral(HashMap<String, Object> map);
	
	int keepDeletePeripheral(HashMap<String, Object> map);
}
