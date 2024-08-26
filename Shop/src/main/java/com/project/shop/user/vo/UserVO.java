package com.project.shop.user.vo;

import java.util.List;

import com.project.shop.progress.vo.AskVO;
import com.project.shop.progress.vo.CartVO;
import com.project.shop.progress.vo.KeepVO;
import com.project.shop.user.vo.AddrVO;


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
	private List<AddrVO> addrs;
	private List<QuestionVO> questions;
	private List<ReviewVO> reviews;
	private int keepCount;
	private int cartCount;
	private int payCount;
	private int dReadyCount;
	private int clearCount;
	private int orchangeCount;
	
	public int getOrchangeCount() {
		return orchangeCount;
	}
	public void setOrchangeCount(int orchangeCount) {
		this.orchangeCount = orchangeCount;
	}
	public int getKeepCount() {
		return keepCount;
	}
	public int getCartCount() {
		return cartCount;
	}
	public int getPayCount() {
		return payCount;
	}
	
	public int getClearCount() {
		return clearCount;
	}
	public int getOrcancelCount() {
		return orcancelCount;
	}
	public void setKeepCount(int keepCount) {
		this.keepCount = keepCount;
	}
	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}
	public void setPayCount(int payCount) {
		this.payCount = payCount;
	}
	
	public int getdReadyCount() {
		return dReadyCount;
	}
	public void setdReadyCount(int dReadyCount) {
		this.dReadyCount = dReadyCount;
	}
	public void setClearCount(int clearCount) {
		this.clearCount = clearCount;
	}
	public void setOrcancelCount(int orcancelCount) {
		this.orcancelCount = orcancelCount;
	}
	private int orcancelCount;
	
	public List<QuestionVO> getQuestions() {
		return questions;
	}
	public List<ReviewVO> getReviews() {
		return reviews;
	}
	public void setQuestions(List<QuestionVO> questions) {
		this.questions = questions;
	}
	public void setReviews(List<ReviewVO> reviews) {
		this.reviews = reviews;
	}
	public List<AskVO> getAsks() {
		return asks;
	}
	public void setAsks(List<AskVO> asks) {
		this.asks = asks;
	}
	public List<AddrVO> getAddrs() {
		return addrs;
	}
	public void setAddrs(List<AddrVO> addrs) {
		this.addrs = addrs;
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
