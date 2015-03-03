package model;

public class WeeklySale {
	private String week;
	private String weekStart;
	private String weekEnd;
	private String month;
	private String day;
	private String year;
	private Double sales;
	
	public WeeklySale(){}
	
	public void setWeek(String week){
		this.week = week;
	}
	
	public String getWeek(){
		return week;
	}
	
	public void setWeekStart(String weekStart){
		this.weekStart = weekStart;
	}
	
	public String getWeekStart(){
		return weekStart;
	}
	
	public void setWeekEnd(String weekEnd){
		this.weekEnd = weekEnd;
	}
	
	public String getWeekEnd(){
		return weekEnd;
	}

	public void setDay(String day){
		this.day = day;
	}
	
	public String getDay(){
		return day;
	}
	
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
