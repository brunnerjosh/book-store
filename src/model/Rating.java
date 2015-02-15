package model;

import java.util.Date;

public class Rating {
	private int ratingId;
	private int userId;
	private int bookId;
	private Date ratingDate;
	private int rating;
	
	public void setRatingId(int ratingId){
		this.ratingId = ratingId;
	}
	
	public int getRatingId(){
		return ratingId;
	}
	
	public void setUserId(int userId){
		this.userId = userId;
	}
	
	public int getUserId(){
		return userId;
	}
	
	public void setBookId(int bookId){
		this.bookId = bookId;
	}
	
	public int getBookId(){
		return bookId;
	}
	
	public void setRatingDate(Date ratingDate){
		this.ratingDate = ratingDate;
	}
	
	public Date getRatingDate(){
		return ratingDate;
	}
	
	public void setRating(int rating){
		this.rating = rating;
	}
	
	public int getRating(){
		return rating;
	}
	
	@Override
	public String toString(){
		return "Rating: [" +
				" ratingId=" + ratingId +
				" userId=" + userId +
				" bookId=" + bookId +
				" ratingDate=" + ratingDate +
				" rating=" + rating +
				 " ]";
				
	}
}
