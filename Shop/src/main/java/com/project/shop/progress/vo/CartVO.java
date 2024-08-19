package com.project.shop.progress.vo;

public class CartVO {
	private int cartNo;
	private String cartUser;
	private int computerNo;
	private int peripheralNo;
	private int optNo;
	private int itemCount;
	
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public String getCartUser() {
		return cartUser;
	}
	public void setCartUser(String cartUser) {
		this.cartUser = cartUser;
	}
	public int getComputerNo() {
		return computerNo;
	}
	public void setComputerNo(int conputerNo) {
		this.computerNo = conputerNo;
	}
	public int getPeripheralNo() {
		return peripheralNo;
	}
	public void setPeripheralNo(int peripheralNo) {
		this.peripheralNo = peripheralNo;
	}
	public int getOptNo() {
		return optNo;
	}
	public void setOptNo(int optNo) {
		this.optNo = optNo;
	}
	public int getItemCount() {
		return itemCount;
	}
	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}
	public int getItemCategory() {
		return itemCategory;
	}
	public void setItemCategory(int itemCategory) {
		this.itemCategory = itemCategory;
	}
	private int itemCategory;	
}
