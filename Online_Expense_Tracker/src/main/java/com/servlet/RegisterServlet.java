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

@WebServlet("/userRegister")
public class RegisterServlet extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String pass=req.getParameter("pass");
		String number=req.getParameter("number");
		
		User u= new User(name, email, pass, number);
//		System.out.println(u);
		
		UserDao dao = new UserDao(HibernateUtil.getSessionFactory());
		boolean f=dao.saveuser(u);
		
		HttpSession session = req.getSession();
		
		if(f)
		{
			session.setAttribute("msg", "Register Sucessfully");
//			System.out.println("Register Sucessfully");
			resp.sendRedirect("Register.jsp");
		}
		else
		{
			session.setAttribute("msg", "Somthing Wroung on Server!");
//			System.out.println("Somthing Wroung on Server..");
			resp.sendRedirect("Register.jsp");
		}
		
	}
	
}
