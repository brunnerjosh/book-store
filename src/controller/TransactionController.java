package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TransactionDao;
import model.Book;
import model.Transaction;
import dao.BookDao;

public class TransactionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String INSERT_OR_EDIT = "/transaction.jsp";
	public static String LIST_TRANSACTION = "/dashboard-transaction.jsp";	//check this
	public static String CONFIRM_PURCHASE = "/confirmPurchase.jsp";
	public static String TRANS_HIST = "/transactionHistory.jsp";
	private TransactionDao dao;
	private BookDao bookDao;

	public TransactionController(){
		super();
		dao = new TransactionDao();
		bookDao = new BookDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		String forward= "";
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("delete")) {
			int transactionId = Integer.parseInt(request.getParameter("transactionId"));
			dao.deleteTransaction(transactionId);
			forward = LIST_TRANSACTION;
			request.setAttribute("transactions", dao.getAllTransactions());
		}
		else if (action.equalsIgnoreCase("edit")){
			forward = INSERT_OR_EDIT;
			int transactionId = Integer.parseInt(request.getParameter("transactionId"));
			Transaction transaction = dao.getTransactionById(transactionId);
			request.setAttribute("transaction", transaction);
		}
		else if (action.equalsIgnoreCase("listTransaction")){
			forward = LIST_TRANSACTION;
			request.setAttribute("transactions", dao.getAllTransactions());
		}
		else if (action.equalsIgnoreCase("transHist")){
			forward = TRANS_HIST;
			int userId = Integer.parseInt(request.getParameter("userId"));
			System.out.println("This is a transaction history for User: " +userId);
//			User user = dao.getUserHistById(userId);
			request.setAttribute("transactions", dao.getAllTransByUserId(userId));
		}
		else {
			forward = INSERT_OR_EDIT;
		}

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] bookIDs = request.getParameterValues("bookId");
		String forward= "";
		String action = request.getParameter("action");
		if(bookIDs != null)
			for(int i = 0; i < bookIDs.length; i++){

				Transaction transaction = new Transaction();
				System.out.println(request.toString());	//TODO:
				System.out.println(response.toString());	//TODO:
				try{
					Date transDate = new SimpleDateFormat("MM/dd/yyyy").parse(request.getParameter("transactionDate"));
					transaction.setTransactionDate(transDate);

				} catch (ParseException e) {
					e.printStackTrace();
				}

				if(bookIDs[i] == null || bookIDs[i].isEmpty()){
					System.out.println("strBookId or strBookId was BAD");
					transaction.setBookId(0);
					dao.addTransaction(transaction);
				} else {
					int bookId = Integer.parseInt(bookIDs[i]);
					transaction.setBookId(bookId);
					if(!bookDao.decrementQuantity(bookId)){
						System.out.println("BookID " + bookId + " is OUT OF STOCK");
						continue; // Go back to top of For Loop
					};
				}

				String strUserId = request.getParameter("userId");
				if(strUserId == null || strUserId.isEmpty()){
					transaction.setUserId(0);
					dao.addTransaction(transaction);
				}
				else{
					int userId = Integer.parseInt(strUserId);
					transaction.setUserId(userId);
				}

				String transAmt = request.getParameter("transactionAmount");
				if (transAmt == null || transAmt.isEmpty()){
					transaction.setTransactionAmount(0.0);
				}
				else {
					Double transactionAmount = Double.parseDouble(transAmt);
					transaction.setTransactionAmount(transactionAmount);
				}

				String transactionid = request.getParameter("transactionId");
				if(transactionid == null || transactionid.isEmpty())
				{
					dao.addTransaction(transaction);
				}
				else {
					transaction.setTransactionId(Integer.parseInt(transactionid));
					dao.updateTransaction(transaction);
				}

			}

			if (action != null && action.equalsIgnoreCase("confirmedPurchase")) {
				System.out.println("Confirmed Purchase");
				forward = CONFIRM_PURCHASE;
				RequestDispatcher view = request.getRequestDispatcher(forward);
				view.forward(request, response);
			} else {
				RequestDispatcher view = request.getRequestDispatcher(LIST_TRANSACTION);
				request.setAttribute("transactions", dao.getAllTransactions());
				view.forward(request, response);
			}
	}
}
