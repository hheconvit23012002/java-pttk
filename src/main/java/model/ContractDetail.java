package model;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

public class ContractDetail implements Serializable{
	private int id;
	private Date startDate;
	private Date endDate;
	private int price;
	private int isReturn;
	private String note;
	private int saleOff;
	private Car car;
	private ArrayList<DamagedDetail> damaged;
	
	public ArrayList<DamagedDetail> getDamaged() {
		return damaged;
	}

	public void setDamaged(ArrayList<DamagedDetail> damaged) {
		this.damaged = damaged;
	}

	public ContractDetail() {
		// TODO Auto-generated constructor stub
	}

	public ContractDetail(int id, Date startDate, Date endDate, int price, int isReturn, String note, int saleOff) {
		super();
		this.id = id;
		this.startDate = startDate;
		this.endDate = endDate;
		this.price = price;
		this.isReturn = isReturn;
		this.note = note;
		this.saleOff = saleOff;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getIsReturn() {
		return isReturn;
	}

	public void setIsReturn(int isReturn) {
		this.isReturn = isReturn;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getSaleOff() {
		return saleOff;
	}

	public void setSaleOff(int saleOff) {
		this.saleOff = saleOff;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}
	
	
}
