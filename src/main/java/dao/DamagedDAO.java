package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Car;
import model.Collateral;
import model.Damaged;

public class DamagedDAO extends DAO{
	public DamagedDAO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ArrayList<Damaged> getDamageds(){
		ArrayList<Damaged> listDamageds = new ArrayList<Damaged>();
		String sql = "SELECT * FROM damaged";
		try {
			System.out.println(sql);
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Damaged dd = new Damaged();
				dd.setId(rs.getInt("id"));
				dd.setName(rs.getString("name"));
				dd.setDes(rs.getString("des"));
				dd.setCompensation(rs.getInt("compensation"));
				listDamageds.add(dd);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return listDamageds;
	}
}
