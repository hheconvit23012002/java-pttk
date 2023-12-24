package model;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

public class Contract implements Serializable{
	private int id;
	private Date day;
	private int saleOff;
	private User user;
	private ArrayList<ContractDetail> listCar;
	private ArrayList<CollateralDetail> listCollateral;
	
	public Contract() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDay() {
		return day;
	}

	public void setDay(Date day) {
		this.day = day;
	}

	public int getSaleOff() {
		return saleOff;
	}

	public void setSaleOff(int saleOff) {
		this.saleOff = saleOff;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public ArrayList<ContractDetail> getListCar() {
		return listCar;
	}

	public void setListCar(ArrayList<ContractDetail> listCar) {
		this.listCar = listCar;
	}

	public ArrayList<CollateralDetail> getListCollateral() {
		return listCollateral;
	}

	public void setListCollateral(ArrayList<CollateralDetail> listCollateral) {
		this.listCollateral = listCollateral;
	}
	

}
