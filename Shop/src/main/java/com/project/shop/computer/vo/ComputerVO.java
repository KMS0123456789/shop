package com.project.shop.computer.vo;

import java.util.List;

import com.project.shop.user.vo.AnswerVO;
import com.project.shop.user.vo.QuestionVO;
import com.project.shop.user.vo.ReviewVO;

public class ComputerVO {
	private int computerNo;
	private String computerTitle;
	private String computerBody;
	private int computerSalePrice;
	private String cpu;
	private String ssd;
	private String mainBoard;
	private String gpu;
	private String power;
	private String bCase;
	private String ram;
	private String cooler;
	private int computerStock;
	private int computerOutFlag;
	private String computerSaleDate;
	private String computerCreateDate;
	private List<ReviewVO> reviews;
	private List<QuestionVO> questions;
	private List<AnswerVO> answers;
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
	public int getComputerNo() {
		return computerNo;
	}
	public void setComputerNo(int computerNo) {
		this.computerNo = computerNo;
	}
	public String getComputerTitle() {
		return computerTitle;
	}
	public void setComputerTitle(String computerTitle) {
		this.computerTitle = computerTitle;
	}
	public String getComputerBody() {
		return computerBody;
	}
	public void setComputerBody(String computerBody) {
		this.computerBody = computerBody;
	}
	public int getComputerSalePrice() {
		return computerSalePrice;
	}
	public void setComputerSalePrice(int computerSalePrice) {
		this.computerSalePrice = computerSalePrice;
	}
	public String getCpu() {
		return cpu;
	}
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	public String getSsd() {
		return ssd;
	}
	public void setSsd(String ssd) {
		this.ssd = ssd;
	}
	public String getMainBoard() {
		return mainBoard;
	}
	public void setMainBoard(String mainBoard) {
		this.mainBoard = mainBoard;
	}
	public String getGpu() {
		return gpu;
	}
	public void setGpu(String gpu) {
		this.gpu = gpu;
	}
	public String getPower() {
		return power;
	}
	public void setPower(String power) {
		this.power = power;
	}
	public String getbCase() {
		return bCase;
	}
	public void setbCase(String bCase) {
		this.bCase = bCase;
	}
	public String getRam() {
		return ram;
	}
	public void setRam(String ram) {
		this.ram = ram;
	}
	public String getCooler() {
		return cooler;
	}
	public void setCooler(String cooler) {
		this.cooler = cooler;
	}
	public int getComputerStock() {
		return computerStock;
	}
	public void setComputerStock(int computerStock) {
		this.computerStock = computerStock;
	}
	public int getComputerOutFlag() {
		return computerOutFlag;
	}
	public void setComputerOutFlag(int computerOutFlag) {
		this.computerOutFlag = computerOutFlag;
	}
	public String getComputerSaleDate() {
		return computerSaleDate;
	}
	public void setComputerSaleDate(String computerSaleDate) {
		this.computerSaleDate = computerSaleDate;
	}
	public String getComputerCreateDate() {
		return computerCreateDate;
	}
	public void setComputerCreateDate(String computerCreateDate) {
		this.computerCreateDate = computerCreateDate;
	}
}
