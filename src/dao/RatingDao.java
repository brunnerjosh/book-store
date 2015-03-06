package dao;

import java.util.ArrayList;
import java.util.List;

import util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Rating;
import model.Transaction;

public class RatingDao {
	private Connection connection;
	
	public RatingDao(){
		connection = DbUtil.getConnection();
	}
	
	public void addRating(Rating rating){
		try{
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into rating( userId, bookId, ratingDate, rating) "
							+ "values (?,?,?,?)");
			//preparedStatement.setInt(1, rating.getRatingId());
			preparedStatement.setInt(1, rating.getUserId());
			preparedStatement.setInt(2, rating.getBookId());
			preparedStatement.setDate(3, new java.sql.Date(rating.getRatingDate().getTime()));
			preparedStatement.setInt(4, rating.getRating());
			preparedStatement.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		}
	}
	
	public void deleteRating(int ratingId){
		try{
			PreparedStatement preparedStatement = connection
					.prepareStatement("delete from rating where ratingId=?");
			preparedStatement.setInt(1, ratingId);
			preparedStatement.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		}
	}
	
	public void updateRating(Rating rating){
		try{
			PreparedStatement preparedStatement = connection
					.prepareStatement("update bookstore.rating set bookId=?, userId=?, ratingDate=?, rating=?"
							+ " where rating.ratingId=?");
			
			preparedStatement.setInt(1, rating.getBookId());
			preparedStatement.setInt(2, rating.getUserId());
			preparedStatement.setDate(3, new java.sql.Date(rating.getRatingDate().getTime()));
			preparedStatement.setInt(4, rating.getRating());
			preparedStatement.setInt(5, rating.getRatingId());
			// System.out.println(preparedStatement.toString());
			preparedStatement.executeUpdate();
			
		} catch (SQLException e){
			e.printStackTrace();
		}
	}
	
	public List<Rating> getAllRatings(){
		List<Rating> ratings = new ArrayList<Rating>();
		try{
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from rating");
			while(rs.next()){
				Rating rating = new Rating();
				rating.setRatingId(rs.getInt("ratingId"));
				rating.setBookId(rs.getInt("bookId"));
				rating.setUserId(rs.getInt("userId"));
				rating.setRatingDate(rs.getDate("ratingDate"));
				rating.setRating(rs.getInt("rating"));
				ratings.add(rating);
			}
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		return ratings;
	}
	
	public List<Rating> getTopRatings(int topAmount){
		// System.out.println("dao.RatingDao: getTopRatings for top " + topAmount);
		List<Rating> ratings = new ArrayList<Rating>();
		try{
			PreparedStatement preparedStatement = connection.prepareStatement("select *, avg(r.rating) from rating r INNER JOIN books b on r.bookId = b.bookId where r.ratingDate > current_date()-14  group by r.bookId order by avg(r.rating) DESC limit ?");
			preparedStatement.setInt(1, topAmount);
			// System.out.println("preparedStatement = " + preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
				
			while(rs.next()){
				Rating rating = new Rating();
				rating.setRatingId(rs.getInt("ratingId"));
				rating.setBookId(rs.getInt("bookId"));
				rating.setUserId(rs.getInt("userId"));
				rating.setRatingDate(rs.getDate("ratingDate"));
				rating.setRating(rs.getInt("rating"));
				ratings.add(rating);
			}
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		return ratings;
	}
	
	
	public List<Rating> getAllRatingsByUserId(int user){
		// System.out.println("dao.RatingDao: getAllRatingsByUserId for " + user);
		List<Rating> ratings = new ArrayList<Rating>();
		try{
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from rating where userId="+user);
			while(rs.next()){
				Rating rating = new Rating();
				rating.setRatingId(rs.getInt("ratingId"));
				rating.setBookId(rs.getInt("bookId"));
				rating.setUserId(rs.getInt("userId"));
				rating.setRatingDate(rs.getDate("ratingDate"));
				rating.setRating(rs.getInt("rating"));
				ratings.add(rating);
			}
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		return ratings;

	}
	
	public List<Rating> getAllRatingsByBookId(int book){
		// System.out.println("dao.RatingDao: getAllRatingsByUserId for " + book);
		List<Rating> ratings = new ArrayList<Rating>();
		try{
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from rating where bookId="+book);
			while(rs.next()){
				Rating rating = new Rating();
				rating.setRatingId(rs.getInt("ratingId"));
				rating.setBookId(rs.getInt("bookId"));
				rating.setUserId(rs.getInt("userId"));
				rating.setRatingDate(rs.getDate("ratingDate"));
				rating.setRating(rs.getInt("rating"));
				ratings.add(rating);
			}
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		return ratings;

	}
	
	public Rating getRatingById(int ratingId){
		Rating rating = new Rating();
		try{
			PreparedStatement preparedStatement = connection.prepareStatement("select * from rating where ratingId=?");
			preparedStatement.setInt(1, ratingId);
			ResultSet rs = preparedStatement.executeQuery();
			
			if (rs.next()){
				rating.setRatingId(rs.getInt("ratingId"));
				rating.setBookId(rs.getInt("bookId"));
				rating.setUserId(rs.getInt("userId"));
				rating.setRatingDate(rs.getDate("ratingDate"));
				rating.setRating(rs.getInt("rating"));
			}
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		return rating;
	}
}
