package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.User;
import util.DbUtil;

public class UserDao {
	
	private Connection connection;
	
	public UserDao() {
		connection = DbUtil.getConnection();
	}
		
	public void addUser(User user){
		System.out.println("UserDao: addUser: " + user.toString());
		try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into users(firstname,lastname,dob,email,password) values (?, ?, ?, ?, ? )");
            // Parameters start with 1
            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getLastName());
           preparedStatement.setDate(3, new java.sql.Date(user.getDob().getTime()));
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getPassword());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
	
	public void deleteUser(int userId){
		System.out.println("UserDao: deleteUser: " + userId);
		try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from users where userid=?");
            // Parameters start with 1
            preparedStatement.setInt(1, userId);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
	
	public void updateUser(User user){
		System.out.println("UserDao: updateUser: " + user.toString());
		try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update users set firstname=?, lastname=?, dob=?, email=?, password=?" +
                            "where userid=?");
            // Parameters start with 1
            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setDate(3, new java.sql.Date(user.getDob().getTime()));
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getPassword());
            preparedStatement.setInt(6, user.getUserid());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
	
	public List<User> getAllUsers(){
		List<User> users = new ArrayList<User>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from users");
			while (rs.next()) {
                User user = new User();
                user.setUserid(rs.getInt("userid"));
                user.setFirstName(rs.getString("firstname"));
                user.setLastName(rs.getString("lastname"));
                user.setDob(rs.getDate("dob"));
                user.setEmail(rs.getString("email"));
                user.setPassword("password");
                users.add(user);
            }
		} catch (SQLException e) {
			e.printStackTrace();
		}
				
		return users;
	}
	
	public User getUserById(int userId){
		User user = new User();
		
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("select * from users where userid=?" );
			preparedStatement.setInt(1,userId);
			ResultSet rs = preparedStatement.executeQuery();
			
			if (rs.next()) {
				user.setUserid(rs.getInt("userid"));
				user.setFirstName(rs.getString("firstname"));
				user.setLastName(rs.getString("lastname"));
				user.setDob(rs.getDate("dob"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
			}
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		return user;
	}
	
	public boolean authCreds(String uName, String uPassword){
		System.out.println("uName: " + uName);
		System.out.println("uPassword: " + uPassword);
		return true;
	}

}
