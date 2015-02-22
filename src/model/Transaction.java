package model;

import java.util.Date;

public class Transaction {
	private int transactionId;
	private Date transactionDate;
	private int bookId;
	private int userId;
	private double transactionAmount;
	
	public Transaction(){
		System.out.println("CREATED A NEW TRANSACTION OBJECT");
	}
	
	public void setTransactionId(int transactionId){
		this.transactionId = transactionId;
	}
	
	public int getTransactionId(){
		return transactionId;
	}
	
	public void setTransactionDate(Date transactionDate){
		this.transactionDate = transactionDate;
	}
	
	public Date getTransactionDate(){
		return transactionDate;
	}
	
	public void setBookId(int bookId){
		this.bookId = bookId;
	}
	
	public int getBookId(){
		return bookId;
	}
	public void setUserId(int userId){
		this.userId = userId;
	}
	
	public int getUserId(){
		return userId;
	}
	
	public void setTransactionAmount(Double transactionAmount){
		this.transactionAmount = transactionAmount;
	}
	
	public Double getTransactionAmount(){
		return transactionAmount;
	}
	
	@Override
	public String toString(){
		return "Transaction [ "+
				" transactionId="+ transactionId + 
				" transactionDate="+ transactionDate +
				" bookId=" + bookId +
				" userId=" + userId +
				" transactionAmount="+ transactionAmount +
				" ]";
	}
}
