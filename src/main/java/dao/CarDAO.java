package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Car;

public class CarDAO extends DAO{
	public CarDAO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ArrayList<Car> searchCar(Date start, Date end, String type){
		ArrayList<Car> listCar = new ArrayList<Car>();
		String sql = "SELECT * from car WHERE car.type like '%" + type +"%' AND id NOT IN ( SELECT car_id FROM contractdetail WHERE startDate <= '" + end.toString() +"'  AND endDate >= '" + start.toString() +"' )";
		try {
			System.out.println(sql);
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Car car = new Car(rs.getInt("id"), rs.getString("manufacturer"), rs.getString("type"), rs.getInt("price"), rs.getString("des"), rs.getString("color"), rs.getString("licenseOlate"));
				listCar.add(car);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return listCar;
	}
}
