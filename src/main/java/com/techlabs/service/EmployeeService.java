package com.techlabs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techlabs.dao.AccountDAO;
import com.techlabs.dao.UserDAO;
import com.techlabs.model.Account;
import com.techlabs.model.Customer;
import com.techlabs.model.Employee;
import com.techlabs.model.User;

@Service
public class EmployeeService extends BankService{

	@Autowired
	private UserDAO userDao;
	@Autowired
	private AccountDAO accountDao;
	
	@Transactional(rollbackFor={Exception.class})
	public void addCustomer(long userId, String pwd, String name, String dob, String gender, String married,
			String mobileNo, String occupation,String email, String city, String pin, String address){
		
		Employee employee=(Employee) userDao.get(userId, Employee.class);
		employee.authenticateUser(pwd);
		Customer customer=new Customer(name, dob, gender, married, occupation, email, mobileNo, city, pin, address,generateOTP());
		/*userDao.save(customer);
		Account account=new Account(500,generateAccountNo(), customer);
		accountDao.save(account);*/
		Account account=new Account(500,generateAccountNo(), customer);
		customer.addAccount(account);
		userDao.save(customer);
	}
	
	@Transactional(rollbackFor={Exception.class})
	public void manageCustomer(long userId,long custId, String pwd, long accountNo,String action, float amount){

		Employee employee=(Employee)(userDao.get(userId,Employee.class));
		Customer customer=(Customer)(userDao.get(custId,Customer.class));
		Account account = (Account)(accountDao.get(accountNo, Account.class));
		
		employee.manageCustomerAccount(customer,account,pwd,action,amount);
		
	}
	
	@Transactional(rollbackFor={Exception.class})
	public void updateStatus(long employeeId, long userId, String pwd,String status){
		
		Employee employee=(Employee) userDao.get(employeeId, Employee.class);
		employee.authenticateUser(pwd);
		User user=userDao.get(userId, User.class);
		user.changeUserStatus(status);
	}
	
}
