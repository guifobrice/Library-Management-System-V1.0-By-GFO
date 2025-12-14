package com.lms.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@WebFilter("/*")
public class AuthFilter implements Filter {

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		
		HttpServletRequest httpServletRequest = (HttpServletRequest) arg0;
		
		String url = httpServletRequest.getRequestURI();
		HttpSession session = httpServletRequest.getSession();
		
		boolean loggedIn = (session != null && session.getAttribute("user") != null);
		boolean allowedMethod = url.equals(httpServletRequest.getContextPath() + "/") ||
				url.equals(httpServletRequest.getContextPath() + "/AuthenticationController");
		
		if(loggedIn || allowedMethod) {
			arg2.doFilter(arg0, arg1);
		}
		
		else {
			RequestDispatcher dispatcher = arg0.getRequestDispatcher("/jsp/login.jsp");
			dispatcher.forward(arg0, arg1);
		}
		
	}

}
