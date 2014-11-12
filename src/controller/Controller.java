package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import database.Account;
import beans.User;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource ds;
	private Map<String, String> actionMap = new HashMap<>();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	public Controller() {
		// Build a Map of action parameters to pages

		actionMap.put("image", "/image.jsp");
		actionMap.put("rate", "/image.jsp");
		actionMap.put("home", "/home.jsp");
	}
   

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		try {
			InitialContext initContext = new InitialContext();

			Context env = (Context) initContext.lookup("java:comp/env");

			ds = (DataSource) env.lookup("jdbc/webshop");

		} catch (NamingException e) {
			throw new ServletException();
		}
	}
	private void doForward(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// Get the action parameter
		String action = request.getParameter("action");

		// If the action parameter is null or the map doesn't contain
		// a page for this action, set the action to the home page
		if (action == null || !actionMap.containsKey(action))
			action = "home";

		// Forward to the requested page.
		request.getRequestDispatcher(actionMap.get(action)).forward(request,
				response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession	session = request.getSession();
	session.setAttribute("isLogged","false");
		String action = request.getParameter("action");
		
		
		if(action == null){
			request.setAttribute("message", "");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			
		}
		else if(action.equals("login")){
			request.setAttribute("message", "");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			
			
		}else if(action.equals("register")){
			request.setAttribute("message", "");
			request.getRequestDispatcher("/createAcc.jsp").forward(request, response);
		}else if (action.equals("news")){
			request.getRequestDispatcher("/news.jsp").forward(request, response);
		}	
		else {
			doForward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		HttpSession	session = request.getSession();
		PrintWriter out = response.getWriter();
		if(action == null){
			out.println("unrecognised action");
		}
		
		Connection conn = null;
		try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			throw new ServletException();
		}
		
		if(action.equals("dologin")){
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			request.setAttribute("message","");
			
			User user = new User(email,password);
			
			request.setAttribute("email", email);
			request.setAttribute("password","");
			
					
			Account account = new Account(conn);
			
			try {
				if(account.login(email, password)){
					session.setAttribute("isLogged","true");
					request.setAttribute("email", email);
					request.getRequestDispatcher("/home.jsp").forward(request, response);
				}else {
					request.setAttribute("message","email or password not valid !");
					request.getRequestDispatcher("/index.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				// throw exception  for the SQL  forward to error.jsp 
				e.printStackTrace();
			}
		}else if (action.equals("createaccount")){
			Account account = new Account(conn);
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String repeatPassword = request.getParameter("repeatpassword");
			
			request.setAttribute("email", email);
			request.setAttribute("password", "");
			request.setAttribute("repeatpassword", "");
			request.setAttribute("message", "");
			if(!password.equals(repeatPassword)) {
				// Passwords don't match.
				request.setAttribute("message", "Passwords do not match.");
				request.getRequestDispatcher("/createAcc.jsp").forward(request, response);
			}
			else {
				User user = new User(email, password);
				
				
				if(!user.validate()) {
					// Password or email address has wrong format.
					request.setAttribute("message", user.getMessage());
					request.getRequestDispatcher("/createAcc.jsp").forward(request, response);
					}
				else{
					try {
						if(account.exists(email)){
							request.setAttribute("message", "An accoount is already in use");
							request.getRequestDispatcher("/createAcc.jsp").forward(request, response);
						}
						else {
							account.create(email, password);
							session.setAttribute("isLogged", "true");
							request.setAttribute("email", request.getParameter("email"));
							request.getRequestDispatcher("/createSucc.jsp").forward(request, response);
						}
					} catch (SQLException e) {
						request.getRequestDispatcher("/error.jsp").forward(request, response);
					}
				}
				
			}
		}else {
			
			doForward(request, response);
		}
		
	} 
}