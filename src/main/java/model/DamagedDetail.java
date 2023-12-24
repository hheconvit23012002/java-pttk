package model;

import java.io.Serializable;

public class DamagedDetail implements Serializable{
	private int id;
	private int number;
	private String des;
	private Damaged damaged;
	public DamagedDetail() {
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public Damaged getDamaged() {
		return damaged;
	}
	public void setDamaged(Damaged damaged) {
		this.damaged = damaged;
	}
	
}
