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
					.prepareStatement("insert into books(title, author, inventoryAmount, price, category, publisher, publicationYear, reviewRating)"
							+ "values(?,?,?,?,?,?,?,?,?)");
			
			preparedStatement.setString(1, book.getTitle());
			preparedStatement.setString(2, book.getAuthor());
			preparedStatement.setInt(3, book.getInventory());
			preparedStatement.setDouble(4, book.getPrice());
			preparedStatement.setString(5, book.getCategory());
			preparedStatement.setString(6, book.getPublisher());
			preparedStatement.setString(7, book.getYearPublished());
			preparedStatement.setInt(8, book.getReviewRating());
			preparedStatement.setBlob(9, book.getPhoto());
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
	
	public int calculateRating(int bookID){
//		Get a list of all the users and sort them based upon 
//		their rating for a certain book(bookID). Every time 
//		you find a user that had a rating for a certain BookID, 
//		add their rating to the running sum of ratings and increment 
//		the count variable. Once you've iterated over all the users, 
//		calculate the average rating for a specific book and return 
//		that as the int.
		
		return 0;
	}
	
	public void updateBook(Book book){
		try{
			PreparedStatement preparedStatement = connection
					.prepareStatement("update books set title=?, author=?, inventoryAmount=?, price=?, category=?,"
							+ "publisher=?, publicationYear=?, reviewRating=?, photo=? where bookId=?");
					
			preparedStatement.setString(1, book.getTitle());
			preparedStatement.setString(2, book.getAuthor());
			preparedStatement.setInt(3, book.getInventory());
			preparedStatement.setDouble(4, book.getPrice());
			preparedStatement.setString(5, book.getCategory());
			preparedStatement.setString(6, book.getPublisher());
			preparedStatement.setString(7, book.getYearPublished());
			preparedStatement.setInt(8, book.getReviewRating());
			preparedStatement.setBlob(9, book.getPhoto());
			preparedStatement.setInt(10, book.getBookId());
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
				book.setInventory(rs.getInt("inventoryAmount"));
				book.setPrice(rs.getDouble("price"));
				book.setCategory(rs.getString("category"));
				book.setPublisher(rs.getString("publisher"));
				book.setYearPublished(rs.getString("publicationYear"));
				book.setReviewRating(rs.getInt("reviewRating"));
				book.setPhoto(rs.getBlob("photo"));
				books.add(book);
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
				book.setBookId(bookId);
				book.setTitle(rs.getString("title"));
				book.setAuthor(rs.getString("author"));
				book.setInventory(rs.getInt("inventoryAmount"));
				book.setPublisher(rs.getString("publisher"));
				book.setYearPublished(rs.getString("publicationYear"));
				book.setCategory(rs.getString("category"));
				book.setPrice(rs.getDouble("price"));
				book.setReviewRating(rs.getInt("reviewRating"));
				book.setPhoto(rs.getBlob("photo"));
			}
		} catch (SQLException e){
			e.printStackTrace();
		}
		return book;
	}
	
	
}
