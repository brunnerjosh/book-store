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

public class RatingDao {
	private Connection connection;
	
	public RatingDao(){
		connection = DbUtil.getConnection();
	}
	
	public void addRating(Rating rating){
		try{
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into rating(ratingId, userId, bookId, ratingDate, rating) "
							+ "values (?,?,?,?,?)");
			preparedStatement.setInt(1, rating.getRatingId());
			preparedStatement.setInt(2, rating.getUserId());
			preparedStatement.setInt(3, rating.getBookId());
			preparedStatement.setDate(4, new java.sql.Date(rating.getRatingDate().getTime()));
			preparedStatement.setInt(5, rating.getRating());
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
					.prepareStatement("update rating set bookId=?, userId=?, ratingDate=?, rating=?"
							+ "where ratingId=?");
			preparedStatement.setInt(1, rating.getBookId());
			preparedStatement.setInt(2, rating.getUserId());
			preparedStatement.setDate(3, new java.sql.Date(rating.getRatingDate().getTime()));
			preparedStatement.setInt(4, rating.getRating());
			preparedStatement.setInt(5, rating.getRatingId());
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
