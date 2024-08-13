package com.project.shop.user.vo;

import java.util.List;

import com.project.shop.progress.vo.AskVO;
import com.project.shop.progress.vo.CartVO;
import com.project.shop.progress.vo.KeepVO;


public class UserVO {
	private String email;
	private String name;
	private String phoneNum;
	private int userType;
	private String createDate;
	private String updateDate;
	private String deleteDate;
	private String blackListDate;
	private List<KeepVO> keeps;
	private List<CartVO> carts;
	private List<AskVO> asks;
	
	public List<AskVO> getAsks() {
		return asks;
	}
	public void setAsks(List<AskVO> asks) {
		this.asks = asks;
	}
	public List<CartVO> getCarts() {
		return carts;
	}
	public void setCarts(List<CartVO> carts) {
		this.carts = carts;
	}
	public List<KeepVO> getKeeps() {
		return keeps;
	}
	public void setKeeps(List<KeepVO> keeps) {
		this.keeps = keeps;
	}
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
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
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
