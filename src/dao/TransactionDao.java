package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;

//import model.User;
//import dao.BookDao;
import model.Transaction;
import util.DbUtil;

public class TransactionDao {
	Connection connection;
	
	public TransactionDao(){
		connection = DbUtil.getConnection();
		System.out.println("CREATED A NEW TRANSACTION DAO OBJECT");
	}
	
	public void addTransaction(Transaction transaction){
		try{
			PreparedStatement preparedStatement = connection		
				.prepareStatement("insert into transactions( `transactionDate`, `bookId`, `userId`, `transactionAmount`) "
						+ "values (?,?,?,?)");
		//preparedStatement.setInt(1, transaction.getTransactionId());
		preparedStatement.setDate(1, new java.sql.Date(transaction.getTransactionDate().getTime()));
		preparedStatement.setInt(2, transaction.getBookId());
		preparedStatement.setInt(3, transaction.getUserId());
		preparedStatement.setDouble(4, transaction.getTransactionAmount());		
		preparedStatement.executeUpdate();
		System.out.println("Transaction Added! I should remove the item from the user's cart");
		
		} catch (SQLException e){
			e.printStackTrace();
		}
	}
	
	public void deleteTransaction(int transactionId){
		try{
			PreparedStatement preparedStatement = connection
					.prepareStatement("delete from transactions where transactionId=?");
			preparedStatement.setInt(1, transactionId);
			preparedStatement.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	public void updateTransaction(Transaction transaction){
		try{
			PreparedStatement preparedStatement = connection
					.prepareStatement("update transactions set transactionDate=?, bookId=?, userId=?, transactionAmount=?"
							+ " where transactionId=?");
			preparedStatement.setDate(1, new java.sql.Date(transaction.getTransactionDate().getTime()));
			preparedStatement.setInt(2, transaction.getBookId());
			preparedStatement.setInt(3, transaction.getUserId());
			preparedStatement.setDouble(4, transaction.getTransactionAmount());
			preparedStatement.setInt(5, transaction.getTransactionId());
			preparedStatement.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	public List<Transaction> getAllTransactions(){
		List<Transaction> transactions = new ArrayList<Transaction>();
		try{
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from transactions");
			while (rs.next()){
				Transaction transaction = new Transaction();
				transaction.setTransactionId(rs.getInt("transactionId"));
				transaction.setBookId(rs.getInt("bookId"));
				transaction.setUserId(rs.getInt("userId"));
				transaction.setTransactionDate(rs.getDate("transactionDate"));
				transaction.setTransactionAmount(rs.getDouble("transactionAmount"));
				transactions.add(transaction);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return transactions;
	}
	
	public Transaction getTransactionById(int transactionId){
		Transaction transaction = new Transaction();
		try{
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from transactions where transactionId=?");
			preparedStatement.setInt(1, transactionId);
			ResultSet rs = preparedStatement.executeQuery();
			
			if (rs.next()){
				transaction.setTransactionId(rs.getInt("transactionId"));
				transaction.setBookId(rs.getInt("bookId"));
				transaction.setUserId(rs.getInt("userId"));
				transaction.setTransactionDate(rs.getDate("transactionDate"));
				transaction.setTransactionAmount(rs.getDouble("transactionAmount"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return transaction;
	}
	
}
