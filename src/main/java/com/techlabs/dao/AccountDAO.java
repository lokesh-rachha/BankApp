package com.techlabs.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.techlabs.exception.BankException;
import com.techlabs.model.Account;

@Repository
public class AccountDAO {

	@Autowired
	private SessionFactory factory;
	
	
	@SuppressWarnings("unchecked")
	public boolean checkDuplicateAccount(Map<String, Object> map) {
		Criteria criteria=null;
		List<Account> list=new ArrayList<Account>();
		for (Map.Entry<String,Object> entry : map.entrySet()) {
			criteria = factory.getCurrentSession()
					.createCriteria(Account.class)
					.add(Restrictions.eq(entry.getKey(),entry.getValue()));
			list.addAll(criteria.list());
		}
		if (list.size() == 0) {
			return true;
		} else {
			return false;
		}
	}
	
	/*@SuppressWarnings("unchecked")
	public boolean checkDuplicateAccount(long acno) {
		
		Criteria criteria = factory.getCurrentSession()
				.createCriteria(Account.class)
				.add(Restrictions.eq("acno",acno));
		List<Account> list = criteria.list();
		if (list.size() == 0) {
			return true;
		} else {
			return false;
		}
	}*/

	/*public void save(Account account) {
		
		factory.getCurrentSession().save(account);
	}
*/
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Account get(long accountNo, Class account){
		
		Criteria criteria = factory.getCurrentSession()
				.createCriteria(account).add(Restrictions.eq("acno", accountNo));
		List<Account> list = criteria.list();
		
		if(list.size()==1){
			for (Account accountObj : list) {
				return accountObj;
			}
		}
		
		throw new BankException("Invalid Account No.");
		
	}

}
