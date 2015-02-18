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

import dao.UserDao;
import model.User;

public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String INSERT_OR_EDIT = "/user.jsp"; // user.jsp
	public static String LIST_USER = "/dashboard-user.jsp"; // listUser.jsp
	public static String TRANS_HIST = "/transaction-history.jsp"; 
	private UserDao dao;
	
	public UserController() {
		super();
		dao = new UserDao();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward="";
		String action = request.getParameter("action");
		System.out.println("UserController: doGet");
		if (action.equalsIgnoreCase("delete")) {
			System.out.println("UserController: DELETE");
			int userId = Integer.parseInt(request.getParameter("userId"));
			dao.deleteUser(userId);
			forward = LIST_USER;
			request.setAttribute("users", dao.getAllUsers());
		}
		else if (action.equalsIgnoreCase("edit")){
			System.out.println("UserController: EDIT");
			forward = INSERT_OR_EDIT;
			int userId = Integer.parseInt(request.getParameter("userId"));
			User user = dao.getUserById(userId);
			request.setAttribute("user", user);
		}
		else if (action.equalsIgnoreCase("listUser")){
			System.out.println("UserController: LIST USER");
			forward = LIST_USER;
			request.setAttribute("users", dao.getAllUsers());
		}
		else if (action.equalsIgnoreCase("transHist")){
			forward = TRANS_HIST;
			int userId = Integer.parseInt(request.getParameter("userId"));
			System.out.println("This is a transaction history for User: " +userId);
//			User user = dao.getUserHistById(userId);
//			request.setAttribute("user", user);
		}
		else {
			System.out.println("UserController: ELSE");
			forward = INSERT_OR_EDIT;
		}
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        user.setFirstName(request.getParameter("firstName"));
        user.setLastName(request.getParameter("lastName"));
        user.setPassword(request.getParameter("password"));
		System.out.println("UserController: doPost");
        try {
            Date dob = new SimpleDateFormat("MM/dd/yyyy").parse(request.getParameter("dob"));
            user.setDob(dob);
            System.out.println("UserController: doPost: setDob: " + user.toString());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        user.setEmail(request.getParameter("email"));
        String userid = request.getParameter("userid");
        if(userid == null || userid.isEmpty())
        {
            dao.addUser(user);
        }
        else
        {
            user.setUserid(Integer.parseInt(userid));
            dao.updateUser(user);
        }
        RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
        request.setAttribute("users", dao.getAllUsers());
        view.forward(request, response);
    }
}
