package model;

public class MonthlySale {
	private String month;
	private String year;
	private Double sales;
	
	public MonthlySale(){}
	
	public void setMonth(String month){
		this.month = month;
	}
	
	public String getMonth(){
		return month;
	}
	
	public void setYear(String year){
		this.year = year;
	}
	
	public String getYear(){
		return year;
	}
	
	public void setSales(Double sales){
		this.sales = sales;
	}
	
	public Double getSales(){
		return sales;
	}
}
