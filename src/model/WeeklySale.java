package model;

public class WeeklySale {
	private String week;
	private Double sales;
	
	public WeeklySale(){}
	
	public void setWeek(String week){
		this.week = week;
	}
	
	public String getWeek(){
		return week;
	}
	
	public void setSales(Double sales){
		this.sales = sales;
	}
	
	public Double getSales(){
		return sales;
	}
}
