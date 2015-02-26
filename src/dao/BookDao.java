package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.UserDao;
import dao.RatingDao;
import model.Book;
import model.Rating;
import model.Transaction;
import model.User;
import util.DbUtil;

public class BookDao {

	private UserDao userDao;
	private RatingDao ratingDao;
	
	private Connection connection;
	public BookDao(){
		connection = DbUtil.getConnection();
		userDao = new UserDao();
		ratingDao = new RatingDao();
		System.out.println("Created a BOOKDAO");
	}
	public boolean decrementQuantity(int bookID){
		Book book = this.getBookById(bookID);
		int bookInventory = book.getInventory();
		int newBookInv = 0;
		if(bookInventory > 0) {
			newBookInv = --bookInventory;
		} else {
			return false;
		}
		
		System.out.println("bookInventory: " + bookInventory + " newBookInv: " + newBookInv);
		try{
			PreparedStatement preparedStatement = connection.prepareStatement("update books set inventoryAmount=? where bookId=?");
			preparedStatement.setInt(1, newBookInv);
			preparedStatement.setInt(2, bookID);
			preparedStatement.executeUpdate();
			return true;
		} catch(SQLException e){
			e.printStackTrace();
			return false;
		}
			
	}
	
	public String[] bookCategories = 
	{
		"All",
		"Fiction",
		"Children",
		"Poetry",
		"Biography",
		"Mystery",
		"Horror",
		"Romance"
	};
	
	public String[] getBookCategories(){
		return this.bookCategories;
	}
	
	public void addBook(Book book){
		System.out.println("BookDao: addBook: " + book.toString());
		try{
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into books(title, author, inventoryAmount, price, category, publisher, publicationYear, reviewRating, photo)"
							+ "values(?,?,?,?,?,?,?,?,?)");
			
			preparedStatement.setString(1, book.getTitle());
			preparedStatement.setString(2, book.getAuthor());
			preparedStatement.setInt(3, book.getInventory());
			preparedStatement.setDouble(4, book.getPrice());
			preparedStatement.setString(5, book.getCategory());
			preparedStatement.setString(6, book.getPublisher());
			preparedStatement.setString(7, book.getYearPublished());
			preparedStatement.setInt(8, book.getReviewRating());
			preparedStatement.setString(9, book.getPhoto());
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
	
	//	Returns a calculated total of all books in a user's bag
	public double getTotalFor(List<Integer> booksInBag){
		double totalAmt = 0.0;
		System.out.println("GET TOTAL FOR:");
		for (int i = 0; i < booksInBag.size(); i++){
			Book tempBook = this.getBookById(booksInBag.get(i)); // Save a temp copy of a book
			totalAmt += tempBook.getPrice();
			System.out.println("totalAmt: " + totalAmt);
		}
		return totalAmt;
	}
	
	public int calculateRating(int bookID){
//		Get a list of all the users and sort them based upon 
//		their rating for a certain book(bookID). Every time 
//		you find a user that had a rating for a certain BookID, 
//		add their rating to the running sum of ratings and increment 
//		the count variable. Once you've iterated over all the users, 
//		calculate the average rating for a specific book and return 
//		that as the int.
		System.out.println("Calculating rating for " + bookID);
		
		int count = 0;
		int ratingTotal = 0;
		List<User> myUserList = userDao.getAllUsers();
		List<Rating> myRatings = ratingDao.getAllRatings();
		for(int i = 0; i < myRatings.size(); i++){
			if(myRatings.get(i).getBookId() == bookID){
				ratingTotal += myRatings.get(i).getRating();
				count++;
			}
		}
		
		System.out.println("Trying to divide " + ratingTotal + " by " + count + " for bookID: " + bookID);
		
		if(count == 0){
			return 0;
		} else {
			return (ratingTotal/count);
		}
		
	}
	
	public void updateBook(Book book){
		System.out.println("BookDao: updateBook");
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
//			preparedStatement.setInt(8, book.getReviewRating());
			preparedStatement.setInt(8, calculateRating(book.getBookId()));
			preparedStatement.setString(9, book.getPhoto());
			preparedStatement.setInt(10, book.getBookId());
			preparedStatement.executeUpdate();
		} catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	public void updateBookPhoto(int bookId, String photoURL){
		//Book book = getBookById(bookId);
		System.out.println("In updateBookPhoto!!!!");
		System.out.println("bookID: " + bookId);
		System.out.println("photoUrl: " + photoURL);
		try{
			PreparedStatement preparedStatement = connection.prepareStatement("update books set photo=? where bookId=?");
			preparedStatement.setString(1, photoURL);
			preparedStatement.setInt(2, bookId);
			System.out.println("photo update: " + preparedStatement);
			preparedStatement.executeUpdate();
			
			
		}catch (SQLException e){
			e.printStackTrace();
		}
	}
	
	public List<Book> getAllBooks() {
		System.out.println("dao.BookDao: getAllBooks");
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
				book.setReviewRating(calculateRating(book.getBookId()));
//				book.setReviewRating(rs.getInt("reviewRating"));
				book.setPhoto(rs.getString("photo"));
				books.add(book);
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
	
		return books;
	}
	public List<Book> getAllBooksByCategory(String category) {
		System.out.println("dao.BookDao: getAllBooksByCategory");
		List<Book> books = new ArrayList<Book>();
		try{
			PreparedStatement preparedStatement = connection.prepareStatement("select * from books where category=?");
			preparedStatement.setString(1, category);
			ResultSet rs = preparedStatement.executeQuery();
			
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
				book.setReviewRating(calculateRating(book.getBookId()));
//				book.setReviewRating(rs.getInt("reviewRating"));
				book.setPhoto(rs.getString("photo"));
				books.add(book);
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
	
		return books;
	}
	public Book getBookById(int bookId){
		System.out.println("dao.BookDao: getBookById");
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
				book.setReviewRating(calculateRating(book.getBookId()));
//				book.setReviewRating(rs.getInt("reviewRating"));
				book.setPhoto(rs.getString("photo"));
			}
		} catch (SQLException e){
			e.printStackTrace();
		}
		return book;
	}
	
	
}
