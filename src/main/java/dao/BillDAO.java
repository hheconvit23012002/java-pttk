package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Iterator;

import model.Bill;
import model.CollateralDetail;
import model.ContractDetail;
import model.DamagedDetail;

public class BillDAO extends DAO{
	public BillDAO() {
		// TODO Auto-generated constructor stub
	}
	public boolean addBill(Bill bill) {
		boolean kq = true;
		String sqlDamaged = "INSERT INTO damageddetail(des,number,contract_detail_id,damaged_id) VALUES(?,?,?,?)";
		String sqlCar = "UPDATE contractdetail SET isReturn = ? WHERE id = ?";
		String sqlCollateral = "UPDATE collateraldetail SET isReturn = ? WHERE id = ?";
		String sqlBill = "INSERT INTO bill(des,sum,contract_id,day) VALUES(?,?,?,?)";
		try {
			
			con.setAutoCommit(false);
			PreparedStatement ps = null;
			ps = con.prepareStatement(sqlBill);
			ps.setString(1, bill.getNote());
			ps.setLong(2, bill.getSum());
			ps.setInt(3, bill.getContract().getId());
			ps.setDate(4, bill.getDay());
			ps.executeUpdate();
			for(CollateralDetail cd : bill.getContract().getListCollateral()) {
				ps = con.prepareStatement(sqlCollateral);
				ps.setInt(1, cd.getIsReturn());
				ps.setInt(2, cd.getId());
				ps.executeUpdate();
			}
			for(ContractDetail cd : bill.getContract().getListCar()) {
				
				ps = con.prepareStatement(sqlCar);
				ps.setInt(1, cd.getIsReturn());
				ps.setInt(2, cd.getId());
				ps.executeUpdate();
				for(DamagedDetail dd : cd.getDamaged()) {
					if(dd.getId() == 0) {
						ps = con.prepareStatement(sqlDamaged);
						ps.setString(1, dd.getDes());
						ps.setInt(2, dd.getNumber());
						ps.setInt(3, cd.getId());
						ps.setInt(4, dd.getDamaged().getId());
						
						ps.executeUpdate();
					}
				}
			}
			con.commit();
		} catch (Exception e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
			kq=false;
			// TODO: handle exception
		}
		return kq;
	}

}
