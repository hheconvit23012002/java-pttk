package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import com.mysql.cj.xdevapi.Result;

import model.Car;
import model.Collateral;
import model.CollateralDetail;
import model.Contract;
import model.ContractDetail;
import model.Damaged;
import model.DamagedDetail;
import model.User;

public class ContractDAO extends DAO{
	public ContractDAO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public boolean createContract(Contract contract) {
		boolean kq = true;
		String sqlContract = "INSERT INTO contract(day,user_id) VALUES(?,?)";
		String sqlSelectContract = "SELECT max(ID) as id FROM CONTRACT WHERE user_id="+contract.getUser().getId();
		String sqlCollateral = "INSERT INTO collateraldetail(collateral_id,contract_id,isReturn,number,des) VALUES(?,?,?,?,?)";
		String sqlContractDetail = "INSERT INTO contractdetail(startDate,endDate,price,isReturn,car_id,contract_id) VALUES(?,?,?,?,?,?)";
		try {
			con.setAutoCommit(false);
			PreparedStatement ps = null;
			ps = con.prepareStatement(sqlContract);
			ps.setDate(1, contract.getDay());
			ps.setInt(2, contract.getUser().getId());
			ps.executeUpdate();
			
			ps = con.prepareStatement(sqlSelectContract);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				contract.setId(rs.getInt("id"));
			}
			for(CollateralDetail cd : contract.getListCollateral()) {
				ps = con.prepareStatement(sqlCollateral);
				ps.setInt(1, cd.getCollateral().getId());
				ps.setInt(2, contract.getId());
				ps.setInt(3, cd.getIsReturn());
				ps.setInt(4, cd.getNumber());
				ps.setString(5, cd.getDes());
				ps.executeUpdate();
			}
			for(ContractDetail cd : contract.getListCar()) {
				ps = con.prepareStatement(sqlContractDetail);
				ps.setDate(1, cd.getStartDate());
				ps.setDate(2, cd.getEndDate());
				ps.setInt(3, cd.getPrice());
				ps.setInt(4, cd.getIsReturn());
				ps.setInt(5, cd.getCar().getId());
				ps.setInt(6, contract.getId());
				ps.executeUpdate();
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
            kq = false;
			// TODO: handle exception
		}
		return kq;
	}
	
	public ArrayList<Contract> searchContract(String contractId,String nameCustomer) {

		ArrayList<Contract> listContracts = new ArrayList<Contract>();
		String sql = "SELECT \r\n"
				+ "	 contract.id AS id_contract,\r\n"
				+ "	 user.id AS id_user,\r\n"
				+ "    contract.*,\r\n"
				+ "    user.*\r\n"
				+ "FROM contract\r\n"
				+ "JOIN user ON contract.user_id = user.id\r\n"
				+ "WHERE \r\n"
				+ "contract.id = ? AND user.username LIKE ?"
				+ "";
		String sqlCollateral = "SELECT \r\n"
				+ "	 collateraldetail.id AS id_collateraldetail,\r\n"
				+ "	 collateral.id AS id_collateral,\r\n"
				+ "    collateral.*,\r\n"
				+ "    collateraldetail.*\r\n"
				+ "FROM collateral\r\n"
				+ "JOIN collateraldetail ON collateral.id = collateraldetail.collateral_id\r\n"
				+ "WHERE collateraldetail.contract_id = ?\r\n"
				+ "";
		String sqlCar = "SELECT \r\n"
				+ "	 car.id AS id_car,\r\n"
				+ "	 contractDetail.id AS id_contractDetail,\r\n"
				+ "	 contractdetail.price AS price_rental,\r\n"
				+ "    car.*,\r\n"
				+ "    contractDetail.*\r\n"
				+ "FROM car\r\n"
				+ "JOIN contractDetail ON car.id = contractDetail.car_id\r\n"
				+ "WHERE contractDetail.contract_id = ?";
		String sqlDamaged = "SELECT \r\n"
				+ "	 damaged.id AS id_damaged,\r\n"
				+ "	 damageddetail.id AS id_damagedDetail,\r\n"
				+ "    damaged.*,\r\n"
				+ "    damageddetail.*\r\n"
				+ "FROM damaged\r\n"
				+ "JOIN damageddetail ON damaged.id = damageddetail.damaged_id\r\n"
				+ "WHERE damageddetail.contract_detail_id = ?"
				+ "";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(contractId));
			String inputSql = "%" + nameCustomer + "%";
			ps.setString(2, inputSql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Contract contract = new Contract();
				User u = new User();
				u.setId(rs.getInt("id_user"));
				u.setUsername(rs.getString("username"));
				u.setEmail(rs.getString("email"));
				contract.setUser(u);
				contract.setDay(rs.getDate("day"));
				contract.setId(rs.getShort("id_contract"));
				listContracts.add(contract);
			}
			for (Contract c : listContracts) {
				ps = con.prepareStatement(sqlCollateral);
				ps.setInt(1, c.getId());
				rs = ps.executeQuery();
				ArrayList<CollateralDetail> listCollateralDetails = new ArrayList<CollateralDetail>();
				while (rs.next()) {
					Collateral collateral = new Collateral();
					CollateralDetail coDetail = new CollateralDetail();
					collateral.setId(rs.getInt("id_collateral"));
					collateral.setName(rs.getString("name"));
					coDetail.setId(rs.getInt("id_collateraldetail"));
					coDetail.setCollateral(collateral);
					coDetail.setNumber(rs.getInt("number"));
					coDetail.setIsReturn(rs.getInt("isReturn"));
					listCollateralDetails.add(coDetail);
				}
				c.setListCollateral(listCollateralDetails);
				ps = con.prepareStatement(sqlCar);
				ps.setInt(1, c.getId());
				rs = ps.executeQuery();
				ArrayList<ContractDetail> listCd = new ArrayList<ContractDetail>();
				while (rs.next()) {
					Car car = new Car();
					ContractDetail cd = new ContractDetail();
					car.setId(rs.getInt("id_car"));
					car.setLicenseOlate(rs.getString("licenseOlate"));
					car.setManufacturer(rs.getString("manufacturer"));
					car.setType(rs.getString("type"));
					cd.setId(rs.getInt("id_contractDetail"));
					cd.setCar(car);
					cd.setStartDate(rs.getDate("startDate"));
					cd.setEndDate(rs.getDate("endDate"));
					cd.setPrice(rs.getInt("price_rental"));
					listCd.add(cd);
				}
				for(ContractDetail contractDetail : listCd) {
					ps = con.prepareStatement(sqlDamaged);
					ps.setInt(1, contractDetail.getId());
					rs = ps.executeQuery();
					ArrayList<DamagedDetail> listDamaged = new ArrayList<DamagedDetail>();
					while (rs.next()) {
						Damaged damaged = new Damaged();
						DamagedDetail dd = new DamagedDetail();
						damaged.setId(rs.getInt("id_damaged"));
						damaged.setName(rs.getString("name"));
						dd.setId(rs.getInt("id_damagedDetail"));
						dd.setDamaged(damaged);
						dd.setNumber(rs.getInt("number"));
						listDamaged.add(dd);
					}
					contractDetail.setDamaged(listDamaged);


				}
				c.setListCar(listCd);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return listContracts;
		
	}
}
