package com.project.shop.home;

import java.util.List;

import com.project.shop.computer.vo.ComputerVO;
import com.project.shop.computer.vo.PeripheralVO;

public interface HomeService {
	public List<ComputerVO> computer();
	public List<PeripheralVO> peripheral();
}
