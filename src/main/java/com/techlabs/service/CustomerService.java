package com.techlabs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techlabs.dao.AccountDAO;
import com.techlabs.dao.UserDAO;
import com.techlabs.model.Account;
import com.techlabs.model.Customer;

@Service
public class CustomerService {
	
	@Autowired
	private UserDAO userDao;
	@Autowired
	private AccountDAO accountDao;
	
	
	@Transactional(rollbackFor={Exception.class})
	public Customer readCustomer(long userId){

		Customer customer=(Customer) userDao.get(userId, Customer.class);
		return customer;
	}
	

	@SuppressWarnings("unused")
	@Transactional(rollbackFor={Exception.class})
	public void addPayee(long userId, long acno, String pwd){

		Customer customer=(Customer) userDao.get(userId, Customer.class);
		customer.authenticateUser(pwd);
		Account account = accountDao.get(acno, Account.class);
		customer.registerPayee(acno,customer);
	}

	@Transactional(rollbackFor={Exception.class})
	public void transferMoney(long userId, long userAccNo,long payeeAccNo, float amount, String pwd){

		Customer customer=(Customer) userDao.get(userId, Customer.class);
		Account userAccount = accountDao.get(userAccNo, Account.class);
		Account payeeAccount = accountDao.get(payeeAccNo,Account.class);
		customer.transferAmount(userAccount,payeeAccount, amount,pwd);
	}
	
	@Transactional(rollbackFor={Exception.class})
	public Account getAccountDetails(long accountNo) throws Exception {

		Account account=accountDao.get(accountNo, Account.class);
		return account;
	}
	
}
