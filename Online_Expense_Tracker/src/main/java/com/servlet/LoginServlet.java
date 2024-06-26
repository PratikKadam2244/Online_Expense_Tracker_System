package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.User;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String pass = req.getParameter("Password");

		UserDao dao = new UserDao(HibernateUtil.getSessionFactory());
		User u = dao.login(email, pass);
//		System.out.println(u);
		
		HttpSession session=req.getSession();
		
		if(u==null)
		{
			session.setAttribute("msg", "Invalid Email And Password");
			resp.sendRedirect("Login.jsp");
		}
		else
		{
			session.setAttribute("loginuser", u);
			resp.sendRedirect("user/home.jsp");
		}
		
		
		
	}

}
