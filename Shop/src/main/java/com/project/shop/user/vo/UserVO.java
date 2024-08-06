package com.project.shop.user.vo;

public class UserVO {
	private String email;
	private String name;
	private String phoneNum;
	private int userType;
	private String createDate;
	private String updateDate;
	private String deleteDate;
	private String blackListDate;
	
	public String getEmail() {
		return email;
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
		return createDate;
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
		this.createDate = creatDate;
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
