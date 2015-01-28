package model;

public class Book {
	private int productid;
	private String title;
	private String author;
	private int inventory;
	private double price;
	private String category;
	private String publisher;
	private int yearPublished;
	
	public int getProductid(){
		return productid;
	}
	
	public void setProductid(int productid){
		this.productid = productid;
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
		return inventory;
	}
	
	public void setInventory(int inventory){
		this.inventory = inventory;
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
	
	public int getYearPublished(){
		return yearPublished;
	}
	
	public void setYearPublished(int yearPublished){
		this.yearPublished = yearPublished;
	}
	@Override
	public String toString() {
		return "Book [productid="+ productid +
					 "title=" + title +
					 "author=" + author +
					 "inventory=" + inventory +
					 "price=" + price +
					 "category=" + category +
					 "publisher=" + publisher +
					 "yearPublished=" + yearPublished +
					 "]";
	}
}
