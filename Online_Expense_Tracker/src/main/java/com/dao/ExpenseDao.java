package com.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Id;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.db.HibernateUtil;
import com.entity.Expense;
import com.entity.User;

public class ExpenseDao 
{
    private SessionFactory factory;

//	private SessionFactory factory = null;
	private Session session = null;
	private Transaction tx = null;
	
	public ExpenseDao(SessionFactory factory) 
	{
		super();
		this.factory = factory;
	}
	
	public boolean saveExpense(Expense ex)
	{
		boolean f=false;
		
		try 
		{
			session=factory.openSession();
			tx=session.beginTransaction();
			session.save(ex);
			tx.commit();
			f=true;
		} 
		catch (Exception e) 
		{
			
			if(tx != null)
			{
				f=false;
				e.printStackTrace();
			}	
		}
		
		
		return f;
	}
	
	public List<Expense> getAllExpensesByUser(User user)
	{
		List<Expense> list = new ArrayList<Expense>();
		try 
		{
			session=factory.openSession();
			Query q=session.createQuery("from Expense where user=:us");
			q.setParameter("us", user);
			list=q.list();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return list;
	}
	
	public Expense getExpenseById(int id)
	{
		Expense ex=null;
		
		try 
		{	
			session=factory.openSession();
			Query q=session.createQuery("from Expense where id=:id");
			
			q.setParameter("id", id);
			ex= (Expense) q.uniqueResult();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		
		return ex;	
	}
	
	public boolean updateExpense(Expense ex)
	{
		boolean f=false;
		
		try 
		{
			session=factory.openSession();
			tx=session.beginTransaction();
			session.saveOrUpdate(ex);
			tx.commit();
			f=true;
		} 
		catch (Exception e) 
		{
			
			if(tx != null)
			{
				f=false;
				e.printStackTrace();
			}	
		}
		
		return f;
	}
	
	 
	public boolean deleteExpense(int id)
	{
		boolean f=false;
		
		try 
		{
			session=factory.openSession();
			tx=session.beginTransaction();
			
			Expense ex= session.get(Expense.class, id);
			session.delete(ex);
			
			tx.commit();
			f=true;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();	
		}

		return f;
	}
	
	
	
	
	
	
	public double getTotalExpenseByUser(User user) {
        Session session = factory.openSession();
        Transaction tx = null;
        double total = 0.0;
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("select sum(price) from Expense where user=:user");
            query.setParameter("user", user);
            total = (Double) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return total;
    }


	
	
	public List<Expense> getExpensesByUserAndDateRange(User user, String startDate, String endDate) {
	    Session session = HibernateUtil.getSessionFactory().openSession();
	    Transaction tx = null;
	    List<Expense> expenses = null;

	    try {
	        tx = session.beginTransaction();
	        String hql = "FROM Expense E WHERE E.user = :user AND E.date BETWEEN :startDate AND :endDate";
	        Query query = session.createQuery(hql);
	        query.setParameter("user", user);
	        query.setParameter("startDate", startDate);
	        query.setParameter("endDate", endDate);
	        expenses = query.list();
	        tx.commit();
	    } catch (Exception e) {
	        if (tx != null) tx.rollback();
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }
	    return expenses;
	}

	
	
}
