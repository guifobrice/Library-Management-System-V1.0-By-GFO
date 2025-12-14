package com.lms.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import com.lms.pojo.User;
import com.lms.service.UserService;
import com.lms.serviceImpl.UserServiceImpl;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println("action: "+action);
		
		if("showAddUser".equalsIgnoreCase(action)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/addUser.jsp");
			dispatcher.forward(request, response);
			
		}
		else if("addUser".equalsIgnoreCase(action)) {
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String phoneNo = request.getParameter("phone");
			String address = request.getParameter("address");
			
			User user = new User();
			user.setFirstName(firstName);;
			user.setLastName(lastName);;
			user.setEmail(email);
			user.setPhoneNo(phoneNo);
			user.setAddress(address);
			user.setRole("USER");
			
			String randomPass = UUID.randomUUID().toString().replace("-", "").substring(0, 8);
			user.setPassword(randomPass);
			
			user.setCreatedAt(new Date());
						
			UserService userService = new UserServiceImpl();
			boolean addflag = userService.addUser(user);
			List<User> userlist = null;
			
			if(addflag) {
				System.out.println("User added");
				userlist = new ArrayList<>();
				userlist = userService.getAllUserList();
				if (userlist != null && userlist.size() > 0)
				{
					request.setAttribute("userlist", userlist);
					request.setAttribute("successMessage", "User added successfully!!");
					RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/userList.jsp");
					dispatcher.forward(request, response);
				}
				else
				{
					request.setAttribute("errorMessage", "Something went wrong");
					RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/addUser.jsp");
					dispatcher.forward(request, response);
				}
			}
			else {
				request.setAttribute("errorMessage", "Something went wrong");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/addUser.jsp");
				dispatcher.forward(request, response);
			}

		}
		else if ("allUserList".equalsIgnoreCase(action)) {
			UserService userService = new UserServiceImpl();
			List<User> userlist = new ArrayList<>();
			userlist = userService.getAllUserList();
			if (userlist != null && userlist.size() > 0)
			{
				request.setAttribute("userlist", userlist);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/userList.jsp");
				dispatcher.forward(request, response);
			}
			else
			{
				request.setAttribute("errorMessage", "Something went wrong");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/addUser.jsp");
				dispatcher.forward(request, response);
			}
			
		}
		else if ("viewUser".equalsIgnoreCase(action))
		{
			long bookId = Integer.parseInt(request.getParameter("userId"));
			
			UserService userService = new UserServiceImpl();
			User user = userService.getUserById(bookId);
			
			if (user != null)
			{
				request.setAttribute("user", user);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/editUser.jsp");
				dispatcher.forward(request, response);
			}
			else {
				List<User> userlist = new ArrayList<>();
				userlist = userService.getAllUserList();
				if (userlist != null && userlist.size() > 0)
				{
					request.setAttribute("errorMessage", "User data not found !");
					request.setAttribute("userlist", userlist);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/userList.jsp");
					dispatcher.forward(request, response);
				}
			}
		}
		else if ("updateUser".equalsIgnoreCase(action))
		{
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			long userId = Integer.parseInt(request.getParameter("userId"));
			
			User user = new User();
			user.setFirstName(firstName);
			user.setLastName(lastName);
			user.setEmail(email);
			user.setPhoneNo(phone);
			user.setAddress(address);
			user.setUserId(userId);
			
			
			UserService userService = new UserServiceImpl();
			boolean updatedFlag = userService.updateUser(user);
			
			if(updatedFlag) {
				request.setAttribute("user", user);
				request.setAttribute("successMessage", "user updated successfully !!!");
				RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/editUser.jsp");
				dispatcher.forward(request, response);
			}
			else {
				request.setAttribute("errorMessage", "Something went wrong");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/editUser.jsp");
				dispatcher.forward(request, response);
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
