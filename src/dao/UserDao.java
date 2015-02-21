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
		System.out.println("CREATED A USER DAO");
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
                    .prepareStatement("update users set firstname=?, lastname=?, dob=?, email=?, password=? " +
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
                user.setPassword(rs.getString("password"));
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
	
	// When a user clicks "Add to Cart" button, this function is 
	//	called to add the item to the user's cart.	
	public boolean addToCart(User customer, int bookID){
//		User customer = this.getUserById(userID); // Retrieve User object
		System.out.println("customer: " + customer.getFirstName() + " " + customer.getLastName());
		
		// If the bookID was successfully added to the user's 
		// shopping bag, return true		
		if(customer.addBookToBag(bookID)){
			System.out.println("Book added to shopping bag: SUCCESS: " + customer.getBooksInBag().size());
			return true;
		}
		System.out.println("Book added to shopping bag: FAILED");
		return false; // Transaction failed
	}
	
	// Checks against the DB to verify that a user exists	
	public User authCreds(String uEmail, String uPassword){
		
		// Get the list of users in the DB
		List<User> users = getAllUsers();
		if(users != null){
			// Loop over list of users		
			for(int i = 0; i < users.size(); i++){
				
				// Check credentials supplied against the DB
				if(users.get(i).getEmail().equals(uEmail) && users.get(i).getPassword().equals(uPassword)){
					System.out.println("User Found: " + users.get(i).getFirstName());
					// User WAS FOUND, return that User
					return users.get(i); 
				}
			}
		}
		System.out.println("User NOT FOUND: [u: " + uEmail + "] [p: " + uPassword + "]");
		// User WAS NOT FOUND, return NULL
		return null; 
	}

}
