package com.project.shop.progress.vo;

import java.util.List;

import com.project.shop.computer.vo.ComputerVO;
import com.project.shop.computer.vo.PeripheralVO;

public class CartVO {
	private int cartNo;
	private String cartUser;
	private int computerNo;
	private int peripheralNo;
	private int optSsd;
	private int optHdd;
	private int optOs;
	private int itemCount;
	private int itemCategory;
	private List<ComputerVO> computers; // 여러 컴퓨터
    private List<PeripheralVO> peripherals; // 여러 주변기기

	public List<ComputerVO> getComputers() {
		return computers;
	}
	public List<PeripheralVO> getPeripherals() {
		return peripherals;
	}
	public void setComputers(List<ComputerVO> computers) {
		this.computers = computers;
	}
	public void setPeripherals(List<PeripheralVO> peripherals) {
		this.peripherals = peripherals;
	}
	public int getCartNo() {
		return cartNo;
	}
	public String getCartUser() {
		return cartUser;
	}
	public int getComputerNo() {
		return computerNo;
	}
	public int getPeripheralNo() {
		return peripheralNo;
	}
	public int getOptSsd() {
		return optSsd;
	}
	public int getOptHdd() {
		return optHdd;
	}
	public int getOptOs() {
		return optOs;
	}
	public int getItemCount() {
		return itemCount;
	}
	public int getItemCategory() {
		return itemCategory;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public void setCartUser(String cartUser) {
		this.cartUser = cartUser;
	}
	public void setComputerNo(int computerNo) {
		this.computerNo = computerNo;
	}
	public void setPeripheralNo(int peripheralNo) {
		this.peripheralNo = peripheralNo;
	}
	public void setOptSsd(int optSsd) {
		this.optSsd = optSsd;
	}
	public void setOptHdd(int optHdd) {
		this.optHdd = optHdd;
	}
	public void setOptOs(int optOs) {
		this.optOs = optOs;
	}
	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}
	public void setItemCategory(int itemCategory) {
		this.itemCategory = itemCategory;
	}
}
