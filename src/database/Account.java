package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Account {

	private Connection conn;

	public Account(Connection conn) {
		this.conn = conn;
	}

	public boolean login(String email, String password) throws SQLException {

		String sql = "select count(*) as count from users where email=? and password=?";
		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setString(1, email);
		stmt.setString(2, password);

		ResultSet rs = stmt.executeQuery();
		int count = 0;
		if (rs.next()) {
			count = rs.getInt("count");
		}
		rs.close();
		if (count == 0) {
			return false;
		} else {
			return true;
		}

	}
	public void postData(String sender,String data) throws SQLException{
		String sql="insert into message (Sender,Data) values (?, ?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, sender);
		stmt.setString(2, data);
		stmt.executeUpdate();
		stmt.close();
		
		
	}
	public String Sender(String fromUser) throws SQLException{
		PreparedStatement stmt = null;
		String sql="SELECT Sender FROM `message`";
		 stmt = conn.prepareStatement(sql);

		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			fromUser = rs.getString("Sender");
	
		}
		return fromUser;
	
	}
	public String postedData(String data) throws SQLException{
		String sql="select Data from message";
		PreparedStatement stmt = conn.prepareStatement(sql);

		ResultSet rs = stmt.executeQuery();
		while(rs.next()){
			data = rs.getString("Data");
	
		}
		
		return data;
	}
	public void create(String email, String password) throws SQLException {
		String sql = "insert into users (email, password) values (?, ?)";

		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setString(1, email);
		stmt.setString(2, password);
		
		stmt.executeUpdate();
		
		stmt.close();
	}
	public boolean exists(String email) throws SQLException {

		String sql = "select count(*) as count from users where email=?";

		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setString(1, email);

		ResultSet rs = stmt.executeQuery();

		int count = 0;

		if (rs.next()) {
			count = rs.getInt("count");
		}
		
		rs.close();

		if (count == 0) {
			return false;
		} else {
			return true;
		}
	}
}
