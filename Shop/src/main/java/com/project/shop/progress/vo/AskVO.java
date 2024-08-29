package com.project.shop.progress.vo;

import java.util.List;

public class AskVO {
	private int askNo;
	private String askUser;
	private String askDate;
	private int askStateFlag;
	public int getAskDeleteFlag() {
		return askDeleteFlag;
	}
	public void setAskDeleteFlag(int askDeleteFlag) {
		this.askDeleteFlag = askDeleteFlag;
	}
	private int askDeleteFlag;
	private List<AskDetailVO> askDetails;
	
	public List<AskDetailVO> getAskDetails() {
		return askDetails;
	}
	public void setAskDetails(List<AskDetailVO> askDetails) {
		this.askDetails = askDetails;
	}
	public int getAskNo() {
		return askNo;
	}
	public void setAskNo(int askNo) {
		this.askNo = askNo;
	}
	public String getAskUser() {
		return askUser;
	}
	public void setAskUser(String askUser) {
		this.askUser = askUser;
	}
	public String getAskDate() {
		return askDate;
	}
	public void setAskDate(String askDate) {
		this.askDate = askDate;
	}
	public int getAskStateFlag() {
		return askStateFlag;
	}
	public void setAskStateFlag(int askStateFlag) {
		this.askStateFlag = askStateFlag;
	}
	public int getAskDeleteflag() {
		return askDeleteFlag;
	}
	public void setAskDeleteflag(int askDeleteflag) {
		this.askDeleteFlag = askDeleteflag;
	}
}
