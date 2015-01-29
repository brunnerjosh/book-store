package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Book;
import util.DbUtil;

public class BookDao {

	private Connection connection;
	
	public BookDao(){
		connection = DbUtil.getConnection();
	}
	
	public void addBook(Book book){
		try{
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into books(title, author, inventory, price, category, publisher, yearPublished)"
							+ "values(?,?,?,?,?,?,?)");
			
			preparedStatement.setString(1, book.getTitle());
			preparedStatement.setString(2, book.getAuthor());
			preparedStatement.setInt(3, book.getInventory());
			preparedStatement.setDouble(4, book.getPrice());
			preparedStatement.setString(5, book.getCategory());
			preparedStatement.setString(6, book.getPublisher());
			preparedStatement.setInt(7, book.getYearPublished());
			preparedStatement.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		}
	}
	
	public void deleteBook(int productId){
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("delete from books where productid=?");
			preparedStatement.setInt(1, productId);
			preparedStatement.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		}
	}
	
	public void updateBook(Book book){
		try{
			PreparedStatement preparedStatement = connection
					.prepareStatement("update books set title=?, author=?, inventory=?, price=?, category=?,"
							+ "publisher=?, yearPublished=?");
					
			preparedStatement.setString(1, book.getTitle());
			preparedStatement.setString(2, book.getAuthor());
			preparedStatement.setInt(3, book.getInventory());
			preparedStatement.setDouble(4, book.getPrice());
			preparedStatement.setString(5, book.getCategory());
			preparedStatement.setString(6, book.getPublisher());
			preparedStatement.setInt(7, book.getYearPublished());
			preparedStatement.executeUpdate();
		} catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	public List<Book> getAllBooks() {
		List<Book> books = new ArrayList<Book>();
		try{
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from books");
			while(rs.next()){
				Book book = new Book();
				book.setProductid(rs.getInt("productid"));
				book.setTitle(rs.getString("title"));
				book.setAuthor(rs.getString("author"));
				book.setInventory(rs.getInt("inventory"));
				book.setPrice(rs.getDouble("price"));
				book.setCategory(rs.getString("category"));
				//TODO: finish him
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
		
		
		return books;
	}
//	getBookById
	
	
}
