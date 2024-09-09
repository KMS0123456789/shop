package com.project.shop.progress.vo;

import java.util.List;

import com.project.shop.computer.vo.ComputerVO;
import com.project.shop.computer.vo.OptVO;
import com.project.shop.computer.vo.PeripheralVO;
import com.project.shop.user.vo.ReviewVO;

public class AskDetailVO {
	private int askDetailNo;
	private int askNo;
	private String askDetailUser;
	private int computerNo;
	private int peripheralNo;
	private int optSsd;
	private int optHdd;
	private int optOs;
	private int itemCount;
	private int itemCategory;
	private String computerTitle;
	private int computerSalePrice;
	private int ssdPrice;
	private int hddPrice;
	private int osPrice;
	private String filePath;
	private String ssdName;
	private String hddName;
	private String osName;
	private String peripheralTitle;
	private int peripheralSalePrice;
	private List<AskVO> asks;
	private List<ComputerVO> computers;
	private List<PeripheralVO> peripherals;
	private List<FileVO> files;
	private List<OptVO> opts;
	private List<ReviewVO> reviews;
	
	public List<ReviewVO> getReviews() {
		return reviews;
	}
	public void setReviews(List<ReviewVO> reviews) {
		this.reviews = reviews;
	}
	public List<AskVO> getAsks() {
		return asks;
	}
	public List<ComputerVO> getComputers() {
		return computers;
	}
	public List<PeripheralVO> getPeripherals() {
		return peripherals;
	}
	public List<FileVO> getFiles() {
		return files;
	}
	public List<OptVO> getOpts() {
		return opts;
	}
	public void setAsks(List<AskVO> asks) {
		this.asks = asks;
	}
	public void setComputers(List<ComputerVO> computers) {
		this.computers = computers;
	}
	public void setPeripherals(List<PeripheralVO> peripherals) {
		this.peripherals = peripherals;
	}
	public void setFiles(List<FileVO> files) {
		this.files = files;
	}
	public void setOpts(List<OptVO> opts) {
		this.opts = opts;
	}
	public String getPeripheralTitle() {
		return peripheralTitle;
	}
	public void setPeripheralTitle(String peripheralTitle) {
		this.peripheralTitle = peripheralTitle;
	}
	public int getPeripheralSalePrice() {
		return peripheralSalePrice;
	}
	public void setPeripheralSalePrice(int peripheralSalePrice) {
		this.peripheralSalePrice = peripheralSalePrice;
	}
	public int getAskDetailNo() {
		return askDetailNo;
	}
	public void setAskDetailNo(int askDetailNo) {
		this.askDetailNo = askDetailNo;
	}
	public int getAskNo() {
		return askNo;
	}
	public void setAskNo(int askNo) {
		this.askNo = askNo;
	}
	public String getAskDetailUser() {
		return askDetailUser;
	}
	public void setAskDetailUser(String askDetailUser) {
		this.askDetailUser = askDetailUser;
	}
	public int getComputerNo() {
		return computerNo;
	}
	public void setComputerNo(int computerNo) {
		this.computerNo = computerNo;
	}
	public int getPeripheralNo() {
		return peripheralNo;
	}
	public void setPeripheralNo(int peripheralNo) {
		this.peripheralNo = peripheralNo;
	}
	public int getOptSsd() {
		return optSsd;
	}
	public void setOptSsd(int optSsd) {
		this.optSsd = optSsd;
	}
	public int getOptHdd() {
		return optHdd;
	}
	public void setOptHdd(int optHdd) {
		this.optHdd = optHdd;
	}
	public int getOptOs() {
		return optOs;
	}
	public void setOptOs(int optOs) {
		this.optOs = optOs;
	}
	public int getItemCount() {
		return itemCount;
	}
	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}
	public int getItemCategory() {
		return itemCategory;
	}
	public void setItemCategory(int itemCategory) {
		this.itemCategory = itemCategory;
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
	public int getSsdPrice() {
		return ssdPrice;
	}
	public void setSsdPrice(int ssdPrice) {
		this.ssdPrice = ssdPrice;
	}
	public int getHddPrice() {
		return hddPrice;
	}
	public void setHddPrice(int hddPrice) {
		this.hddPrice = hddPrice;
	}
	public int getOsPrice() {
		return osPrice;
	}
	public void setOsPrice(int osPrice) {
		this.osPrice = osPrice;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getSsdName() {
		return ssdName;
	}
	public void setSsdName(String ssdName) {
		this.ssdName = ssdName;
	}
	public String getHddName() {
		return hddName;
	}
	public void setHddName(String hddName) {
		this.hddName = hddName;
	}
	public String getOsName() {
		return osName;
	}
	public void setOsName(String osName) {
		this.osName = osName;
	}

}