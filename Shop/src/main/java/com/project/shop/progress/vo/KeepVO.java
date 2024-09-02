package com.project.shop.progress.vo;

import java.util.List;

import com.project.shop.computer.vo.ComputerVO;
import com.project.shop.computer.vo.PeripheralVO;

public class KeepVO {
	private int keepNo;
	private String keepUser;
	private int computerNo;
	private int peripheralNo;
	private int itemCategory;
	private List<ComputerVO> computers;
	private List<PeripheralVO> peripherals;
	private List<FileVO> files;
	
	
	
	
	
	public List<ComputerVO> getComputers() {
		return computers;
	}
	public void setComputers(List<ComputerVO> computers) {
		this.computers = computers;
	}
	public List<PeripheralVO> getPeripherals() {
		return peripherals;
	}
	public void setPeripherals(List<PeripheralVO> peripherals) {
		this.peripherals = peripherals;
	}
	public List<FileVO> getFiles() {
		return files;
	}
	public void setFiles(List<FileVO> files) {
		this.files = files;
	}
	public int getKeepNo() {
		return keepNo;
	}
	public void setKeepNo(int keepNo) {
		this.keepNo = keepNo;
	}
	public String getKeepUser() {
		return keepUser;
	}
	public void setKeepUser(String keepUser) {
		this.keepUser = keepUser;
	}
	public int getComputerNo() {
		return computerNo;
	}
	public void setComputerNo(int computerNo) {
		this.computerNo = computerNo;
	}
	public int getPeripheralNo() {
		return peripheralNo;
	}
	public void setPeripheralNo(int peripheralNo) {
		this.peripheralNo = peripheralNo;
	}
	public int getItemCategory() {
		return itemCategory;
	}
	public void setItemCategory(int itemCategory) {
		this.itemCategory = itemCategory;
	}
}
