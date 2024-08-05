package com.project.shop.computer.vo;

public class OptVO {
	private int optNo;
	private int optCategory;
	private String optName;
	private int optStock;
	private int optSalePrice;
	public int getOptNo() {
		return optNo;
	}
	public void setOptNo(int optNo) {
		this.optNo = optNo;
	}
	public int getOptCategory() {
		return optCategory;
	}
	public void setOptCategory(int optCategory) {
		this.optCategory = optCategory;
	}
	public String getOptName() {
		return optName;
	}
	public void setOptName(String optName) {
		this.optName = optName;
	}
	public int getOptStock() {
		return optStock;
	}
	public void setOptStock(int optStock) {
		this.optStock = optStock;
	}
	public int getOptSalePrice() {
		return optSalePrice;
	}
	public void setOptSalePrice(int optSalePrice) {
		this.optSalePrice = optSalePrice;
	}
	public int getOptOutFlag() {
		return optOutFlag;
	}
	public void setOptOutFlag(int optOutFlag) {
		this.optOutFlag = optOutFlag;
	}
	public String getOptSaleDate() {
		return optSaleDate;
	}
	public void setOptSaleDate(String optSaleDate) {
		this.optSaleDate = optSaleDate;
	}
	private int optOutFlag;
	private String optSaleDate;
}
