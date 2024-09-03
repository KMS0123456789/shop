package com.project.shop.user.vo;

import java.util.List;

public class ReviewVO {
	private int reviewNo;
	private String reviewUser;
	private int computerNo;
	private int peripheralNo;
	private String reviewBody;
	private String reviewCreateDate;
	private int itemCategory;
	private List<UserVO> users;
	
	public List<UserVO> getUsers() {
		return users;
	}
	public void setUsers(List<UserVO> users) {
		this.users = users;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public String getReviewUser() {
		return reviewUser;
	}
	public int getComputerNo() {
		return computerNo;
	}
	public int getPeripheralNo() {
		return peripheralNo;
	}
	public String getReviewBody() {
		return reviewBody;
	}
	public String getReviewCreateDate() {
		return reviewCreateDate;
	}
	public int getItemCategory() {
		return itemCategory;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public void setReviewUser(String reviewUser) {
		this.reviewUser = reviewUser;
	}
	public void setComputerNo(int computerNo) {
		this.computerNo = computerNo;
	}
	public void setPeripheralNo(int peripheralNo) {
		this.peripheralNo = peripheralNo;
	}
	public void setReviewBody(String reviewBody) {
		this.reviewBody = reviewBody;
	}
	public void setReviewCreateDate(String reviewCreateDate) {
		this.reviewCreateDate = reviewCreateDate;
	}
	public void setItemCategory(int itemCategory) {
		this.itemCategory = itemCategory;
	}
}
