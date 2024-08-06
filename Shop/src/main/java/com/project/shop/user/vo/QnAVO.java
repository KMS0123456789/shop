package com.project.shop.user.vo;

public class QnAVO {
	private int QnANo;
	private String QnAUser;
	private int computerNo;
	private int peripheralNo;
	private String QnATitle;
	private String QnABody;
	private String QnACreateDate;
	private int QnAFlag;
	private int itemCategory;
	
	public int getQnANo() {
		return QnANo;
	}
	public String getQnAUser() {
		return QnAUser;
	}
	public int getComputerNo() {
		return computerNo;
	}
	public int getPeripheralNo() {
		return peripheralNo;
	}
	public String getQnATitle() {
		return QnATitle;
	}
	public String getQnABody() {
		return QnABody;
	}
	public String getQnACreateDate() {
		return QnACreateDate;
	}
	public int getQnAFlag() {
		return QnAFlag;
	}
	public int getItemCategory() {
		return itemCategory;
	}
	public void setQnANo(int qnANo) {
		QnANo = qnANo;
	}
	public void setQnAUser(String qnAUser) {
		QnAUser = qnAUser;
	}
	public void setComputerNo(int computerNo) {
		this.computerNo = computerNo;
	}
	public void setPeripheralNo(int peripheralNo) {
		this.peripheralNo = peripheralNo;
	}
	public void setQnATitle(String qnATitle) {
		QnATitle = qnATitle;
	}
	public void setQnABody(String qnABody) {
		QnABody = qnABody;
	}
	public void setQnACreateDate(String qnACreateDate) {
		QnACreateDate = qnACreateDate;
	}
	public void setQnAFlag(int qnAFlag) {
		QnAFlag = qnAFlag;
	}
	public void setItemCategory(int itemCategory) {
		this.itemCategory = itemCategory;
	}
}
