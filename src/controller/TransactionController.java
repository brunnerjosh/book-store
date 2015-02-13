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
import model.Transaction;
import model.User;
import model.Book;

//transactionId
//transactionDate
//bookId
//userId
//transactionAmount

public class TransactionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String INSERT_OR_EDIT = "/transaction.jsp";
	public static String LIST_TRANSACTION = "/listTransaction.jsp";	//check this
	private TransactionDao dao;

	public TransactionController(){
		super();
		dao = new TransactionDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		String forward= "";
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("delete")) {
			int userId = Integer.parseInt(request.getParameter("transactionId"));
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
		else {
			forward = INSERT_OR_EDIT;
		}
		

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		Transaction transaction = new Transaction();
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		transaction.setBookId(bookId);
		int userId = Integer.parseInt(request.getParameter("userId"));
		transaction.setUserId(userId);
		try{
			Date transDate = new SimpleDateFormat("MM/dd/yyyy").parse(request.getParameter("transactionDate"));
			transaction.setTransactionDate(transDate);

		} catch (ParseException e) {
			e.printStackTrace();
		}
		transaction.setTransactionAmount(request.getParameter("transactionAmount"));
		String transactionid = request.getParameter("transactionid");
		if(transactionid == null || transactionid.isEmpty())
		{
			dao.addTransaction(transaction);	
		}
		else {
			transaction.setTransactionId(Integer.parseInt(transactionid));
			dao.updateTransaction(transaction);
		}

		RequestDispatcher view = request.getRequestDispatcher(LIST_TRANSACTION);
        request.setAttribute("transactions", dao.getAllTransactions());
        view.forward(request, response);
	}


}
