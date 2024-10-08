package com.project.shop.computer.vo;

import java.util.List;

import com.project.shop.progress.vo.FileVO;
import com.project.shop.progress.vo.KeepVO;
import com.project.shop.user.vo.AnswerVO;
import com.project.shop.user.vo.QuestionVO;
import com.project.shop.user.vo.ReviewVO;
import com.project.shop.user.vo.StarVO;

public class ComputerVO {
	private int computerNo;
	private String computerTitle;
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
	private List<PeripheralVO> peripherals;
	private List<StarVO> stars;
	private List<FileVO> files;
	private int keepFlag;
	private int reviewFlag;
	private int buyFlag;
	private int starAvg;
	private String computerFilePath;
	private int searchNo;
	private String searchTitle;
	private int searchPrice;
	private int searchFlag;
	private String searchFilePath;


	public List<FileVO> getFiles() {
		return files;
	}
	public void setFiles(List<FileVO> files) {
		this.files = files;
	}
	public int getSearchNo() {
		return searchNo;
	}
	public void setSearchNo(int searchNo) {
		this.searchNo = searchNo;
	}
	public String getSearchTitle() {
		return searchTitle;
	}
	public void setSearchTitle(String searchTitle) {
		this.searchTitle = searchTitle;
	}
	public int getSearchPrice() {
		return searchPrice;
	}
	public void setSearchPrice(int searchPrice) {
		this.searchPrice = searchPrice;
	}
	public int getSearchFlag() {
		return searchFlag;
	}
	public void setSearchFlag(int searchFlag) {
		this.searchFlag = searchFlag;
	}
	public String getSearchFilePath() {
		return searchFilePath;
	}
	public void setSearchFilePath(String searchFilePath) {
		this.searchFilePath = searchFilePath;
	}
	public String getComputerFilePath() {
		return computerFilePath;
	}
	public void setComputerFilePath(String computerFilePath) {
		this.computerFilePath = computerFilePath;
	}
	public int getStarAvg() {
		return starAvg;
	}
	public void setStarAvg(int starAvg) {
		this.starAvg = starAvg;
	}
	public int getBuyFlag() {
		return buyFlag;
	}
	public void setBuyFlag(int buyFlag) {
		this.buyFlag = buyFlag;
	}
	public int getReviewFlag() {
		return reviewFlag;
	}
	public void setReviewFlag(int reviewFlag) {
		this.reviewFlag = reviewFlag;
	}
	public List<StarVO> getStars() {
		return stars;
	}
	public void setStars(List<StarVO> stars) {
		this.stars = stars;
	}
	public int getKeepFlag() {
		return keepFlag;
	}
	public void setKeepFlag(int keepFlag) {
		this.keepFlag = keepFlag;
	}
	public List<PeripheralVO> getPeripherals() {
		return peripherals;
	}
	public void setPeripherals(List<PeripheralVO> peripherals) {
		this.peripherals = peripherals;
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
