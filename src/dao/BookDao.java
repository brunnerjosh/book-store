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
					.prepareStatement("insert into books(title, author, inventory, price, category, publisher, publicationYear, reviewRating)"
							+ "values(?,?,?,?,?,?,?,?)");
			
			preparedStatement.setString(1, book.getTitle());
			preparedStatement.setString(2, book.getAuthor());
			preparedStatement.setInt(3, book.getInventory());
			preparedStatement.setDouble(4, book.getPrice());
			preparedStatement.setString(5, book.getCategory());
			preparedStatement.setString(6, book.getPublisher());
			preparedStatement.setString(7, book.getYearPublished());
			preparedStatement.setInt(8, book.getReviewRating());
			preparedStatement.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		}
	}
	
	public void deleteBook(int bookId){
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("delete from books where bookId=?");
			preparedStatement.setInt(1, bookId);
			preparedStatement.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		}
	}
	
	public void updateBook(Book book){
		try{
			PreparedStatement preparedStatement = connection
					.prepareStatement("update books set title=?, author=?, inventory=?, price=?, category=?,"
							+ "publisher=?, publicationYear=?, reviewRating=? where bookId=?");
					
			preparedStatement.setString(1, book.getTitle());
			preparedStatement.setString(2, book.getAuthor());
			preparedStatement.setInt(3, book.getInventory());
			preparedStatement.setDouble(4, book.getPrice());
			preparedStatement.setString(5, book.getCategory());
			preparedStatement.setString(6, book.getPublisher());
			preparedStatement.setString(7, book.getYearPublished());
			preparedStatement.setInt(8, book.getReviewRating());
			preparedStatement.setInt(9, book.getBookId());
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
				
				book.setBookId(rs.getInt("bookId"));
				book.setTitle(rs.getString("title"));
				book.setAuthor(rs.getString("author"));
				book.setInventory(rs.getInt("inventory"));
				book.setPrice(rs.getDouble("price"));
				book.setCategory(rs.getString("category"));
				book.setYearPublished(rs.getString("publicationYear"));
				book.setReviewRating(rs.getInt("reviewRating"));
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
		
		
		return books;
	}
	public Book getBookById(int bookId){
		Book book = new Book();
		try{
			PreparedStatement preparedStatement = connection.prepareStatement("select * from books where bookId=?");
			preparedStatement.setInt(1, bookId);
			ResultSet rs = preparedStatement.executeQuery();
			
			if (rs.next()){
				book.setTitle(rs.getString("title"));
				book.setAuthor(rs.getString("author"));
				book.setInventory(rs.getInt("inventory"));
				book.setPublisher(rs.getString("publisher"));
				book.setYearPublished(rs.getString("publicationYear"));
				book.setCategory(rs.getString("category"));
				book.setPrice(rs.getDouble("price"));
				book.setReviewRating(rs.getInt("reviewRating"));
			}
		} catch (SQLException e){
			e.printStackTrace();
		}
		return book;
	}
	
	
}
