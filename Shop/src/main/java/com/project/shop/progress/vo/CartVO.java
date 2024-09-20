package com.project.shop.progress.vo;

import java.util.List;

import com.project.shop.computer.vo.ComputerVO;
import com.project.shop.computer.vo.OptVO;
import com.project.shop.computer.vo.PeripheralVO;

public class CartVO {
	private int cartNo;
	private String cartUser;
	private int computerNo;
	private int peripheralNo;
	private int optSsd;
	private int optHdd;
	private int optOs;
	private int itemCount;
	private int itemCategory;
	private String computerTitle;
	private int computerSalePrice;
	private String peripheralTitle;
	private int peripheralSalePrice;
	private String ssdName;
	private String hddName;
	private String osName;
	private int ssdPrice;
	private int hddPrice;
	private int osPrice;
	private int fileNo;
	private String filePath;
	private List<ComputerVO> computers; // 여러 컴퓨터
    private List<PeripheralVO> peripherals; // 여러 주변기기
    private List<OptVO> opts;
    private List<FileVO> files;
    
	public int getFileNo() {
		return fileNo;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	public List<FileVO> getFiles() {
		return files;
	}

	public void setFiles(List<FileVO> files) {
		this.files = files;
	}

	public String getComputerTitle() {
		return computerTitle;
	}

	public int getComputerSalePrice() {
		return computerSalePrice;
	}

	public String getPeripheralTitle() {
		return peripheralTitle;
	}

	public int getPeripheralSalePrice() {
		return peripheralSalePrice;
	}

	public void setComputerTitle(String computerTitle) {
		this.computerTitle = computerTitle;
	}

	public void setComputerSalePrice(int computerSalePrice) {
		this.computerSalePrice = computerSalePrice;
	}

	public void setPeripheralTitle(String peripheralTitle) {
		this.peripheralTitle = peripheralTitle;
	}

	public void setPeripheralSalePrice(int peripheralSalePrice) {
		this.peripheralSalePrice = peripheralSalePrice;
	}
	
	public String getSsdName() {
		return ssdName;
	}
	public String getHddName() {
		return hddName;
	}
	public String getOsName() {
		return osName;
	}
	public int getSsdPrice() {
		return ssdPrice;
	}
	public int getHddPrice() {
		return hddPrice;
	}
	public int getOsPrice() {
		return osPrice;
	}
	public void setSsdName(String ssdName) {
		this.ssdName = ssdName;
	}
	public void setHddName(String hddName) {
		this.hddName = hddName;
	}
	public void setOsName(String osName) {
		this.osName = osName;
	}
	public void setSsdPrice(int ssdPrice) {
		this.ssdPrice = ssdPrice;
	}
	public void setHddPrice(int hddPrice) {
		this.hddPrice = hddPrice;
	}
	public void setOsPrice(int osPrice) {
		this.osPrice = osPrice;
	}

	public List<OptVO> getOpts() {
		return opts;
	}
	public void setOpts(List<OptVO> opts) {
		this.opts = opts;
	}
	public List<ComputerVO> getComputers() {
		return computers;
	}
	public List<PeripheralVO> getPeripherals() {
		return peripherals;
	}
	public void setComputers(List<ComputerVO> computers) {
		this.computers = computers;
	}
	public void setPeripherals(List<PeripheralVO> peripherals) {
		this.peripherals = peripherals;
	}
	public int getCartNo() {
		return cartNo;
	}
	public String getCartUser() {
		return cartUser;
	}
	public int getComputerNo() {
		return computerNo;
	}
	public int getPeripheralNo() {
		return peripheralNo;
	}
	public int getOptSsd() {
		return optSsd;
	}
	public int getOptHdd() {
		return optHdd;
	}
	public int getOptOs() {
		return optOs;
	}
	public int getItemCount() {
		return itemCount;
	}
	public int getItemCategory() {
		return itemCategory;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public void setCartUser(String cartUser) {
		this.cartUser = cartUser;
	}
	public void setComputerNo(int computerNo) {
		this.computerNo = computerNo;
	}
	public void setPeripheralNo(int peripheralNo) {
		this.peripheralNo = peripheralNo;
	}
	public void setOptSsd(int optSsd) {
		this.optSsd = optSsd;
	}
	public void setOptHdd(int optHdd) {
		this.optHdd = optHdd;
	}
	public void setOptOs(int optOs) {
		this.optOs = optOs;
	}
	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}
	public void setItemCategory(int itemCategory) {
		this.itemCategory = itemCategory;
	}
}
