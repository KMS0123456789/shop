package com.project.shop.progress.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.shop.progress.vo.KeepVO;


public interface KeepService {
	//완제품 찜하기
	int keepComputer(KeepVO vo);
	
	//완제품 찜하기 취소
	int keepDeleteComputer(KeepVO vo);
	
	//주변기기 찜하기
	int keepPeripheral(KeepVO vo);
	
	//주변기기 찜하기 취소
	int keepDeletePeripheral(KeepVO vo);
	
	List<KeepVO> myKeep(KeepVO vo);
	
	int keepDelete(int keepNo);
	
	int keepSelectDelete(List<String> arrayParams);

}
