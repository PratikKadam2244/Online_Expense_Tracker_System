package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Expense;
import com.entity.User;


public class UserDao 
{
	private SessionFactory factory = null;
	private Session session = null;
	private Transaction tx = null;
	
	public UserDao(SessionFactory factory) 
	{
		super();
		this.factory = factory;
	}
	
	public boolean saveuser(User user)
	{
		boolean f= false;
		
		try 
		{
			session=factory.openSession();
			tx=session.beginTransaction();
			
			session.save(user);
			tx.commit();
			f=true;
		} 
		catch (Exception e) 
		{
			if(tx!=null)
			{
				f=false;
				e.printStackTrace();
			}
		}
		
		return f;
	}
	
	public User login(String email, String pass)
	{
		User u=null;
		
		session=factory.openSession();
		Query q=session.createQuery("from User where email=:em and pass=:ps");
		
		q.setParameter("em", email);
		q.setParameter("ps", pass);
		
		u= (User) q.uniqueResult();
	
		
		return u;
	}
	
	
	public List<User> userinformation(int id)
	{
		List<User> list = new ArrayList<User>();
		try 
		{
			session=factory.openSession();
			Query q=session.createQuery("from User where id=:id");
			q.setParameter("id", id);
			list=q.list();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return list;
	}
	
	public void deleteUser(int userId) {
	    try {
	        session = factory.openSession();
	        tx = session.beginTransaction();

	        // Delete related expenses first
	        Query expenseQuery = session.createQuery("delete from Expense where user.id = :userId");
	        expenseQuery.setParameter("userId", userId);
	        expenseQuery.executeUpdate();

	        // Retrieve the user object by its ID
	        User user = session.get(User.class, userId);
	        
	        // Delete the user object
	        if (user != null) {
	            session.delete(user);
	        }

	        // Commit the transaction
	        tx.commit();
	    } catch (Exception e) {
	        // Rollback the transaction if an exception occurs
	        if (tx != null) {
	            tx.rollback();
	        }
	        // Handle exceptions
	        e.printStackTrace();
	    } finally {
	        // Close the session
	        if (session != null) {
	            session.close();
	        }
	    }
	}

	

	
}
