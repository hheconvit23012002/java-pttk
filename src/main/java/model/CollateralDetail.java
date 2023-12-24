package model;

import java.io.Serializable;
import java.util.ArrayList;

public class CollateralDetail implements Serializable{
	private int id;
	private int isReturn;
	private String des;
	private int number;
	private Collateral collateral;
	
	public CollateralDetail() {
		// TODO Auto-generated constructor stub
	}

	public CollateralDetail(int id, int isReturn, String des, int number, Collateral collateral) {
		super();
		this.id = id;
		this.isReturn = isReturn;
		this.des = des;
		this.number = number;
		this.collateral = collateral;
	}

	public CollateralDetail(int isReturn, String des, int number, Collateral collateral) {
		super();
		this.isReturn = isReturn;
		this.des = des;
		this.number = number;
		this.collateral = collateral;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIsReturn() {
		return isReturn;
	}

	public void setIsReturn(int isReturn) {
		this.isReturn = isReturn;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public Collateral getCollateral() {
		return collateral;
	}

	public void setCollateral(Collateral collateral) {
		this.collateral = collateral;
	}
	
	
	
}
