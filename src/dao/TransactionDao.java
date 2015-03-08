package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;

import model.Book;
import model.Transaction;
import model.MonthlySale;
import model.WeeklySale;
import model.UserPurchase;
import util.DbUtil;

public class TransactionDao {
	Connection connection;

	public TransactionDao(){
		connection = DbUtil.getConnection();
		// System.out.println("CREATED A NEW TRANSACTION DAO OBJECT");
	}

	public void addTransaction(Transaction transaction){
		try{
			PreparedStatement preparedStatement = connection
				.prepareStatement("insert into transactions( `sharedTransID`,`transactionDate`, `bookId`, `userId`, `transactionAmount`) "
						+ "values (?,?,?,?,?)");
		//preparedStatement.setInt(1, transaction.getTransactionId());
			preparedStatement.setInt(1, transaction.getSharedTransID());
		preparedStatement.setDate(2, new java.sql.Date(transaction.getTransactionDate().getTime()));
		preparedStatement.setInt(3, transaction.getBookId());
		preparedStatement.setInt(4, transaction.getUserId());
		preparedStatement.setDouble(5, transaction.getTransactionAmount());
		preparedStatement.executeUpdate();
		// System.out.println("Transaction Added! I should remove the item from the user's cart");

		} catch (SQLException e){
			e.printStackTrace();
		}
	}
	public int getLastId(){
		int last = 0;
		try{
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT sharedTransID FROM transactions ORDER BY sharedTransID DESC LIMIT 1");
			while(rs.next()){
				last = rs.getInt("sharedTransID");
			}
		} catch (SQLException e){
			e.printStackTrace();
		}
		return last;
	}
	public void deleteTransaction(int transactionId){
		try{
			PreparedStatement preparedStatement = connection
					.prepareStatement("delete from transactions where transactionId=?");
			preparedStatement.setInt(1, transactionId);
			preparedStatement.executeUpdate();

		}catch(SQLException e){
			e.printStackTrace();
		}
	}

	public void updateTransaction(Transaction transaction){
		try{
			PreparedStatement preparedStatement = connection
					.prepareStatement("update transactions set sharedTransID=?, transactionDate=?, bookId=?, userId=?, transactionAmount=?"
							+ " where transactionId=?");
			preparedStatement.setInt(1, transaction.getSharedTransID());
			preparedStatement.setDate(2, new java.sql.Date(transaction.getTransactionDate().getTime()));
			preparedStatement.setInt(3, transaction.getBookId());
			preparedStatement.setInt(4, transaction.getUserId());
			preparedStatement.setDouble(5, transaction.getTransactionAmount());
			preparedStatement.setInt(6, transaction.getTransactionId());
			preparedStatement.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

	public List<Transaction> getAllTransactions(){
		List<Transaction> transactions = new ArrayList<Transaction>();
		try{
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from transactions");
			while (rs.next()){
				Transaction transaction = new Transaction();
				transaction.setTransactionId(rs.getInt("transactionId"));
				transaction.setSharedTransID(rs.getInt("sharedTransID"));
				transaction.setBookId(rs.getInt("bookId"));
				transaction.setUserId(rs.getInt("userId"));
				transaction.setTransactionDate(rs.getDate("transactionDate"));
				transaction.setTransactionAmount(rs.getDouble("transactionAmount"));
				transactions.add(transaction);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return transactions;
	}
	public List<Transaction> getAllTransByBookId(int book){
		// System.out.println("dao.TransactionDao: getAllTransByBookId for " + book);
		List<Transaction> transactions = new ArrayList<Transaction>();
		try{
			PreparedStatement preparedStatement = connection.prepareStatement("select * from transactions where bookId=?");
			preparedStatement.setInt(1, book);
			ResultSet rs = preparedStatement.executeQuery();

			while(rs.next()){
				Transaction transaction = new Transaction();
				transaction.setTransactionId(rs.getInt("transactionId"));
				transaction.setSharedTransID(rs.getInt("sharedTransID"));
				transaction.setBookId(rs.getInt("bookId"));
				transaction.setUserId(rs.getInt("userId"));
				transaction.setTransactionDate(rs.getDate("transactionDate"));
				transaction.setTransactionAmount(rs.getDouble("transactionAmount"));
				transactions.add(transaction);
			}
		} catch(SQLException e){
		e.printStackTrace();
		}

	return transactions;

	}

	public List<UserPurchase> getUserPurchaseData(){
		// System.out.println("dao.TransactionDao: getUserPurchaseData");

		List<UserPurchase> list = new ArrayList<UserPurchase>();
		try{
			PreparedStatement preparedStatement = connection.prepareStatement("Select u.firstName, u.lastName, t.transactionId,"
					+ "b.title, b.category, count(b.category) as count from users as u join transactions as t "
					+ "on u.userId = t.userId join books as b on b.bookId = t.bookId group by t.userId , b.category");
			ResultSet rs = preparedStatement.executeQuery();

			while(rs.next()){
				UserPurchase userPurchase = new UserPurchase();
				userPurchase.setFirstName(rs.getString("firstName"));
				userPurchase.setLastName(rs.getString("lastName"));
				userPurchase.setTransactionId(rs.getInt("transactionId"));
				userPurchase.setCategory(rs.getString("category"));
				userPurchase.setCount(rs.getInt("count"));
				list.add(userPurchase);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return list;
	}
	public List<Transaction> getAllTransByUserId(int user){
		// System.out.println("dao.TransactionDao: getAllTransByUserId for " + user);
		List<Transaction> transactions = new ArrayList<Transaction>();
		try{
			PreparedStatement preparedStatement = connection.prepareStatement("select * from transactions where userId=?");
			preparedStatement.setInt(1, user);
			ResultSet rs = preparedStatement.executeQuery();

			while(rs.next()){
				Transaction transaction = new Transaction();
				transaction.setTransactionId(rs.getInt("transactionId"));
				transaction.setSharedTransID(rs.getInt("sharedTransID"));
				transaction.setBookId(rs.getInt("bookId"));
				transaction.setUserId(rs.getInt("userId"));
				transaction.setTransactionDate(rs.getDate("transactionDate"));
				transaction.setTransactionAmount(rs.getDouble("transactionAmount"));
				transactions.add(transaction);
			}
		} catch(SQLException e){
		e.printStackTrace();
		}

	return transactions;

	}
	public List<Transaction> getTopTransactionsByCategory(int topAmount, String category){
		// System.out.println("dao.TransactionDao: getTopTransactions for top " + topAmount);
		List<Transaction> transactions = new ArrayList<Transaction>();
		try{
			//// System.out.println("In Dao, category = " + category + ", topAmount = " + topAmount);

			String ps = " ";

			if (category.equalsIgnoreCase("all")) {
				// System.out.println("Looking for ALL categories");
				ps = "select *, COUNT(t.bookId) from transactions t INNER JOIN  books b on t.bookId = b.bookId and (b.category in ('Fiction','Children','Poetry','Biography','Mystery','Horror','Romance')) where t.transactionDate > current_date()-7 group by t.bookId order by COUNT(t.bookId) DESC limit ?";
			} else {
				ps = "select *, COUNT(t.bookId) from transactions t INNER JOIN  books b on t.bookId = b.bookId and b.category =? group by t.bookId order by COUNT(t.bookId) DESC limit ?";
			}

			PreparedStatement preparedStatement = connection.prepareStatement(ps);

			if (category.equalsIgnoreCase("all")) {
				preparedStatement.setInt(1, topAmount);
			} else {
				preparedStatement.setString(1, category);
				preparedStatement.setInt(2, topAmount);
			}

			// System.out.println("preparedStatement = " + preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while(rs.next()){
				Transaction transaction = new Transaction();
				transaction.setTransactionId(rs.getInt("transactionId"));
				transaction.setBookId(rs.getInt("bookId"));
				transaction.setUserId(rs.getInt("userId"));
				transaction.setTransactionDate(rs.getDate("transactionDate"));
				transaction.setTransactionAmount(rs.getDouble("transactionAmount"));
				transactions.add(transaction);
			}
		} catch(SQLException e){
		e.printStackTrace();
		}

	return transactions;

	}

	public double getTotalSales(){
		double totalSales = 0.00;

		try{
			String ps = " ";
			ps = "     SELECT Sum(  transactionAmount ) as total FROM transactions ";
			PreparedStatement preparedStatement = connection.prepareStatement(ps);
			ResultSet rs = preparedStatement.executeQuery();

			while(rs.next()){

				totalSales = rs.getDouble("total");
				// System.out.println("Total Sales : " + totalSales);
			}
		} catch (SQLException e){
			e.printStackTrace();
		}

		return totalSales;
	}
	public List<MonthlySale> getMonthlySales(){
		List<MonthlySale> list = new ArrayList<MonthlySale>();
		try{
			String ps = " ";
			ps = "select MONTHNAME(transactionDate) AS month, YEAR(transactionDate) as year, SUM(transactionAmount) AS sum FROM transactions GROUP BY YEAR(transactionDate), MONTH(transactionDate)";
			PreparedStatement preparedStatement = connection.prepareStatement(ps);
			ResultSet rs = preparedStatement.executeQuery();

			while(rs.next()){
				MonthlySale mSale = new MonthlySale();
				mSale.setMonth(rs.getString("month"));
				//System.out.print("Month: " + mSale.getMonth() + " ");
				mSale.setYear(rs.getString("year"));
				//System.out.print("Year: " + mSale.getYear() + " ");
				Double sales = Double.parseDouble(rs.getString("sum"));
				// System.out.println("Sum: " + mSale.getSales());
				mSale.setSales(sales);
				list.add(mSale);
			}
		} catch (SQLException e){
			e.printStackTrace();
		}
		return list;
	}
	public List<WeeklySale> getWeeklySales(){
		List<WeeklySale> list = new ArrayList<WeeklySale>();
		try{
			String ps = " ";
			ps = "Select WEEK(transactionDate) AS week, "
					+ "YEAR(transactionDate) AS year, "
					+ "MONTH(transactionDate) AS month, "
					+ "DAY(transactionDate) AS day, "
					+ "SUM(transactionAmount) AS sum, "
					+ "DATE_FORMAT(DATE_SUB(DATE_ADD(MAKEDATE(YEAR(transactionDate), 1), "
					+ "INTERVAL WEEK(transactionDate) WEEK), INTERVAL WEEKDAY( DATE_ADD(MAKEDATE(YEAR(transactionDate), 1), "
					+ "INTERVAL WEEK(transactionDate) WEEK)) -1 DAY),'%m/%d') AS weekStart_date, "
					+ "DATE_FORMAT(DATE_SUB( DATE_ADD(MAKEDATE(YEAR(transactionDate), 1), "
					+ "INTERVAL WEEK(transactionDate) WEEK), INTERVAL WEEKDAY( DATE_ADD(MAKEDATE(YEAR(transactionDate), 1), "
					+ "INTERVAL WEEK(transactionDate) WEEK)) -7 DAY),'%m/%d') AS weekEnd_date "
					+ "FROM transactions GROUP BY YEARWEEK(transactionDate)";

			PreparedStatement preparedStatement = connection.prepareStatement(ps);
			ResultSet rs = preparedStatement.executeQuery();

			while(rs.next()){
				WeeklySale wSale = new WeeklySale();
				wSale.setWeek(rs.getString("week"));
				// System.out.print("Week: " + wSale.getWeek());
				wSale.setYear(rs.getString("year"));
				// System.out.print("Year: " + wSale.getYear() + " ");
				wSale.setMonth(rs.getString("month"));
				// System.out.print("Month: " + wSale.getMonth() + " ");
				wSale.setWeekStart(rs.getString("weekStart_date"));
				// System.out.print("weekStart_date: " + wSale.getWeekStart() + " ");
				wSale.setWeekEnd(rs.getString("weekEnd_date"));
				// System.out.print("weekEnd_date: " + wSale.getWeekEnd() + " ");
				wSale.setDay(rs.getString("day"));
				// System.out.print("Day: " + wSale.getDay() + " ");
				Double sales = Double.parseDouble(rs.getString("sum"));
				wSale.setSales(sales);
				// System.out.println(" Sales: " + wSale.getSales());
				list.add(wSale);
			}
		} catch (SQLException e){
			e.printStackTrace();
		}
		return list;
	}
	public Transaction getTransactionById(int transactionId){
		Transaction transaction = new Transaction();
		try{
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from transactions where transactionId=?");
			preparedStatement.setInt(1, transactionId);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()){
				transaction.setTransactionId(rs.getInt("transactionId"));
				transaction.setSharedTransID(rs.getInt("sharedTransID"));
				transaction.setBookId(rs.getInt("bookId"));
				transaction.setUserId(rs.getInt("userId"));
				transaction.setTransactionDate(rs.getDate("transactionDate"));
				transaction.setTransactionAmount(rs.getDouble("transactionAmount"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return transaction;
	}

	public List<Transaction> getTransactionsBy(String sortByType){
		List<Transaction> transactions = new ArrayList<Transaction>();
		// System.out.println("TransactionDao: Getting transactions by " + sortByType);
		return transactions;
	}

	public List<Transaction> sortTransBy(String thresholdParam, double priceLimit){
		List<Transaction> transactions = new ArrayList<Transaction>();
		String arrowDirection = "";
		if(thresholdParam.equalsIgnoreCase("above")){
			arrowDirection = ">";
		} else {
			arrowDirection = "<";
		}
		// System.out.println("TransactionDao: Getting transactions " + thresholdParam + "("+arrowDirection+") $" + priceLimit);
		try{
			PreparedStatement preparedStatement = connection.prepareStatement("select * from transactions where transactionAmount" + arrowDirection + priceLimit + " ORDER BY sharedTransID DESC");
			// System.out.println("prepared statement: " + preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();

			while(rs.next()){
				Transaction transaction = new Transaction();
				transaction.setTransactionId(rs.getInt("transactionId"));
				transaction.setSharedTransID(rs.getInt("sharedTransID"));
				transaction.setBookId(rs.getInt("bookId"));
				transaction.setUserId(rs.getInt("userId"));
				transaction.setTransactionDate(rs.getDate("transactionDate"));
				transaction.setTransactionAmount(rs.getDouble("transactionAmount"));
				transactions.add(transaction);
			}
		} catch(SQLException e){
		e.printStackTrace();
		}
		return transactions;
	}

}
