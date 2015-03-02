package model;

public class MonthlySale {
	private String month;
	private Double sales;
	
	public MonthlySale(){}
	
	public void setMonth(String month){
		this.month = month;
	}
	
	public String getMonth(){
		return month;
	}
	
	public void setSales(Double sales){
		this.sales = sales;
	}
	
	public Double getSales(){
		return sales;
	}
}
