package com.lms.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;
import com.lms.serviceImpl.UserServiceImpl;
import java.io.IOException;
import jakarta.servlet.http.HttpServlet;
import com.lms.pojo.User;
import com.lms.service.UserService;
/**
 * Servlet implementation class AuthenticationController
 */
@WebServlet("/AuthenticationController")
public class AuthenticationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthenticationController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if("checkLogin".equalsIgnoreCase(action)) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			UserService userService = new UserServiceImpl();
			User user = userService.checkLogin(username, password);
			
			if(user !=null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				response.sendRedirect("DashboardController?action=viewDasboard");
			}
			else {
				request.setAttribute("errorMessage", "Invalid username or password");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/login.jsp");
				dispatcher.forward(request, response);

			}
			
		}
		else if("showLogin".equalsIgnoreCase(action)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
		else if("signOut".equalsIgnoreCase(action)) {
			HttpSession session = request.getSession();
			if (session != null) {
				session.invalidate();
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/login.jsp");
			dispatcher.forward(request, response);
			
		}
		else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/error.jsp");
			dispatcher.forward(request, response);

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
