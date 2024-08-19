package com.project.shop.computer.vo;

import java.util.List;

import com.project.shop.user.vo.AnswerVO;
import com.project.shop.user.vo.QuestionVO;
import com.project.shop.user.vo.ReviewVO;

public class PeripheralVO {
	private int peripheralNo;
	private int peripheralCategory;
	private String peripheralTitle;
	private String peripheralName;
	private int peripheralStock;
	private int peripheralSalePrice;
	private int peripheralOutFlag;
	private String peripheralSaleDate;
	private List<ReviewVO> reviews;
	private List<QuestionVO> questions;
	private List<AnswerVO> answers;
	private int keepFlag;

	public int getKeepFlag() {
		return keepFlag;
	}
	public void setKeepFlag(int keepFlag) {
		this.keepFlag = keepFlag;
	}
	public List<ReviewVO> getReviews() {
		return reviews;
	}
	public void setReviews(List<ReviewVO> reviews) {
		this.reviews = reviews;
	}
	public List<QuestionVO> getQuestions() {
		return questions;
	}
	public void setQuestions(List<QuestionVO> questions) {
		this.questions = questions;
	}
	public List<AnswerVO> getAnswers() {
		return answers;
	}
	public void setAnswers(List<AnswerVO> answers) {
		this.answers = answers;
	}
	public int getPeripheralNo() {
		return peripheralNo;
	}
	public void setPeripheralNo(int peripheralNo) {
		this.peripheralNo = peripheralNo;
	}
	public int getPeripheralCategory() {
		return peripheralCategory;
	}
	public void setPeripheralCategory(int peripheralCategory) {
		this.peripheralCategory = peripheralCategory;
	}
	public String getPeripheralTitle() {
		return peripheralTitle;
	}
	public void setPeripheralTitle(String peripheralTitle) {
		this.peripheralTitle = peripheralTitle;
	}
	public String getPeripheralName() {
		return peripheralName;
	}
	public void setPeripheralName(String peripheralName) {
		this.peripheralName = peripheralName;
	}
	public int getPeripheralStock() {
		return peripheralStock;
	}
	public void setPeripheralStock(int peripheralStock) {
		this.peripheralStock = peripheralStock;
	}
	public int getPeripheralSalePrice() {
		return peripheralSalePrice;
	}
	public void setPeripheralSalePrice(int peripheralSalePrice) {
		this.peripheralSalePrice = peripheralSalePrice;
	}
	public int getPeripheralOutFlag() {
		return peripheralOutFlag;
	}
	public void setPeripheralOutFlag(int peripheralOutFlag) {
		this.peripheralOutFlag = peripheralOutFlag;
	}
	public String getPeripheralSaleDate() {
		return peripheralSaleDate;
	}
	public void setPeripheralSaleDate(String peripheralSaleDate) {
		this.peripheralSaleDate = peripheralSaleDate;
	}
	public String getPeripheralCreateDate() {
		return peripheralCreateDate;
	}
	public void setPeripheralCreateDate(String peripheralCreateDate) {
		this.peripheralCreateDate = peripheralCreateDate;
	}
	private String peripheralCreateDate;
}
