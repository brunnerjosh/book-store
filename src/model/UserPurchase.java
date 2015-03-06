package model;

public class UserPurchase {
	private String firstName;
	private String lastName;
	private int transactionId;
	private String category;
	private int count;
	
	public UserPurchase(){
		
	}
	
	public void setFirstName(String firstName){
		this.firstName = firstName;
	}
	public String getFirstName(){
		return firstName;
	}
	public void setLastName(String lastName){
		this.lastName = lastName;
	}
	public String getLastName(){
		return lastName;
	}
	public void setTransactionId(int transactionId){
		this.transactionId = transactionId;
	}
	public int getTransacitonId(){
		return transactionId;
	}
	public void setCategory(String category){
		this.category = category;
	}
	public String getCategory(){
		return category;
	}
	public void setCount(int count){
		this.count = count;
	}
	public int getCount(){
		return count;
	}
}
