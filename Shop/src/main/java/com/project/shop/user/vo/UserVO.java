package com.project.shop.user.vo;

public class UserVO {
	private String email;
	private String pw;
	private String name;
	private String phoneNum;
	private int userType;
	private String creatDate;
	private String updateDate;
	private String deleteDate;
	private String blackListDate;
	
	public String getEmail() {
		return email;
	}
	public String getPw() {
		return pw;
	}
	public String getName() {
		return name;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public int getUserType() {
		return userType;
	}
	public String getCreatDate() {
		return creatDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public String getDeleteDate() {
		return deleteDate;
	}
	public String getBlackListDate() {
		return blackListDate;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public void setCreatDate(String creatDate) {
		this.creatDate = creatDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public void setDeleteDate(String deleteDate) {
		this.deleteDate = deleteDate;
	}
	public void setBlackListDate(String blackListDate) {
		this.blackListDate = blackListDate;
	}
	
}
