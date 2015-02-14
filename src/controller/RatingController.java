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

import dao.RatingDao;
import model.Rating;
import model.User;
import model.Book;

//ratingId
//userId
//bookId
//ratingDate
//rating

public class RatingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String INSERT_OR_EDIT = "/rating.jsp";
	public static String LIST_RATING = "/listRating.jsp";	//check this
	private RatingDao dao;

	public RatingController(){
		super();
		dao = new RatingDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		String forward= "";
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("delete")) {
			int ratingId = Integer.parseInt(request.getParameter("ratingId"));
			dao.deleteRating(ratingId));
			forward = LIST_RATING;
			request.setAttribute("ratings", dao.getAllRatings());
		}
		else if (action.equalsIgnoreCase("edit")){
			forward = INSERT_OR_EDIT;
			int ratingId = Integer.parseInt(request.getParameter("ratingId"));
			Rating rating = dao.getRatingById(ratingId);
			request.setAttribute("rating", rating);
		}
		else if (action.equalsIgnoreCase("listRating")){
			forward = LIST_RATING;
			request.setAttribute("ratings", dao.getAllRatings());
		}
		else {
			forward = INSERT_OR_EDIT;
		}
		

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		Rating rating = new Rating();
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		rating.setBookId(bookId);
		int userId = Integer.parseInt(request.getParameter("userId"));
		rating.setUserId(userId);
		try {
			Date ratingDate = new SimpleDateFormat("MM/dd/yyyy").parse(request.getParameter("ratingDate"));
			rating.setRatingDate(ratingDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		int rating = Integer.parseInt(request.getParameter("rating"));
		rating.setRating(rating);
		String ratingId = request.getParameter("ratingId");
		if (ratingId == null || ratingId.isEmpty()){
			dao.addRating(rating);
		}
		else {
			rating.setRatingId(Integer.parseInt(ratingId));
			dao.updateRating(rating);
		}

		RequestDispatcher view = request.getRequestDispatcher(LIST_TRANSACTION);
        request.setAttribute("transactions", dao.getAllTransactions());
        view.forward(request, response);
	}


}