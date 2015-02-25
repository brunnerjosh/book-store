package model;

import java.math.BigDecimal;
import java.math.RoundingMode;
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
		this.transactionAmount = this.round(transactionAmount, 2);
	}
	
	public Double getTransactionAmount(){
		return transactionAmount;
	}
	
	// Taken from SO: http://stackoverflow.com/questions/2808535/round-a-double-to-2-decimal-places	
	public double round(double value, int places) {
    if (places < 0) throw new IllegalArgumentException();

    BigDecimal bd = new BigDecimal(value);
    bd = bd.setScale(places, RoundingMode.HALF_UP);
    return bd.doubleValue();
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
