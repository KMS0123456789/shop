package com.project.shop.progress.vo;

import java.util.List;

import com.project.shop.computer.vo.ComputerVO;
import com.project.shop.computer.vo.OptVO;
import com.project.shop.computer.vo.PeripheralVO;

public class AskVO {
	private int askNo;
	private String askUser;
	private String askDate;
	private int askStateFlag;
	private int askDeleteFlag;
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
	private List<AskDetailVO> askDetails;
	private List<FileVO> files;
	private List<ComputerVO> computers;
	private List<PeripheralVO> peripherals;
	private List<OptVO> opts;
	
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
	public List<OptVO> getOpts() {
		return opts;
	}
	public void setOpts(List<OptVO> opts) {
		this.opts = opts;
	}
	public List<PeripheralVO> getPeripherals() {
		return peripherals;
	}
	public void setPeripherals(List<PeripheralVO> peripherals) {
		this.peripherals = peripherals;
	}
	public List<ComputerVO> getComputers() {
		return computers;
	}
	public void setComputers(List<ComputerVO> computers) {
		this.computers = computers;
	}
	public List<FileVO> getFiles() {
		return files;
	}
	public void setFiles(List<FileVO> files) {
		this.files = files;
	}
	public int getAskDeleteFlag() {
		return askDeleteFlag;
	}
	public void setAskDeleteFlag(int askDeleteFlag) {
		this.askDeleteFlag = askDeleteFlag;
	}
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
