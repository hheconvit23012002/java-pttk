package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.cj.jdbc.CallableStatement;

import model.User;

public class UserDAO extends DAO{

	public UserDAO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public boolean loginning(User u) {
		boolean kq = false;
        if(u.getUsername().contains("true") || u.getUsername().contains("=")||
                u.getPassword().contains("true") || u.getPassword().contains("=")) return false;
        String sql = "SELECT * FROM user WHERE username = ? AND password = ?"; 
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,u.getUsername());
            ps.setString(2,u.getPassword());
            ResultSet rs = ps.executeQuery();
             
            if(rs.next()){
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setAddress(rs.getString("address"));
                u.setPhoneNumber(rs.getString("phone_number"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getString("role"));
                kq = true;
            }
        }catch(Exception e){
            e.printStackTrace();
            kq = false;
        }
        return kq;
	}
	
	public boolean register(User u) {
		boolean kq = false;
		if(u.getUsername().contains("true") || u.getUsername().contains("=")||
                u.getPassword().contains("true") || u.getPassword().contains("=")) return false;
        String sql = "INSERT INTO user(username,password,email,birthdate,phone_number,address,role) VALUES (?,?,?,?,?,?,?)";
        try {
        	PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,u.getUsername());
            ps.setString(2,u.getPassword());
            ps.setString(3,u.getEmail());
            ps.setDate(4, u.getBirthdate());
            ps.setString(5, u.getPhoneNumber());
            ps.setString(6, u.getAddress());
            ps.setString(7, u.getRole());
            int rs = ps.executeUpdate();
            if(rs==1){
            	kq =true;
            }
			
		} catch (Exception e) {
            e.printStackTrace();
            kq = false;
			// TODO: handle exception
		}
		return kq;
	}
	
}
