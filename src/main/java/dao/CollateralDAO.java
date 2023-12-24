package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Car;
import model.Collateral;

public class CollateralDAO extends DAO{
	public CollateralDAO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ArrayList<Collateral> getCollateral(){
		ArrayList<Collateral> listCollaterals = new ArrayList<Collateral>();
		String sql = "SELECT * FROM collateral";
		try {
			System.out.println(sql);
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Collateral collateral = new Collateral(rs.getInt("id"), rs.getString("name"), rs.getString("des"));
				listCollaterals.add(collateral);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return listCollaterals;
	}
}
