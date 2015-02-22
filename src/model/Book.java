package model;

import java.sql.Blob;

import util.DbUtil;

public class Book {
	private int bookId;
	private String title;
	private String author;
	private int inventoryAmount;
	private double price;
	private String category;
	private String publisher;
	private String publicationYear;
	private int reviewRating;
	private Blob photo;
	
	public int getBookId(){
		return bookId;
	}
	
	public void setBookId(int bookId){
		this.bookId = bookId;
	}
	
	public String getTitle(){
		return title;
	}
	
	public void setTitle(String title){
		this.title = title;
	}
	
	public String getAuthor(){
		return author;
	}
	
	public void setAuthor(String author){
		this.author = author;
	}
	
	public int getInventory(){
		return inventoryAmount;
	}
	
	public void setInventory(int inventory){
		this.inventoryAmount = inventory;
	}
	
	public double getPrice(){
		return price;
	}
	
	public void setPrice(double price){
		this.price = price;
	}
	
	public String getCategory(){
		return category;
	}
	
	public void setCategory(String category){
		this.category = category;
	}
	
	public String getPublisher(){
		return publisher;
	}
	
	public void setPublisher(String publisher){
		this.publisher = publisher;
	}
	
	public String getYearPublished(){
		return publicationYear;
	}
	
	public void setYearPublished(String publicationYear){
		this.publicationYear = publicationYear;
	}
	
	public void setReviewRating(int reviewRating){
		this.reviewRating = reviewRating;
	}
	
	public int getReviewRating(){
		return reviewRating;
	}
	
	public void setPhoto(Blob photo){
		this.photo = photo;
	}
	public Blob getPhoto(){
		return photo;
	}
	
	@Override
	public String toString() {
		return "Book [ bookId="+ bookId +
					 " title=" + title +
					 " author=" + author +
					 " inventory=" + inventoryAmount +
					 " price=" + price +
					 " category=" + category +
					 " publisher=" + publisher +
					 " yearPublished=" + publicationYear +
					 " reviewRating=" + reviewRating +
					 "]";
	}
}
