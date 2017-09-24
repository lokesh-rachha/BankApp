package com.techlabs.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.techlabs.exception.BankException;
import com.techlabs.model.User;

@Repository
public class UserDAO {

	@Autowired
	private SessionFactory factory;

	/*public User readUser(long userId, String type) throws Exception {

		User user = null;
		if (type.equals("Customer")) {
			user = (Customer) factory.getCurrentSession().get(Customer.class, userId);
		}
		if (type.equals("Employee")) {
			user = (Employee) factory.getCurrentSession().get(Employee.class, userId);
		}
		if (user == null) {
			throw new InvalidUserException();
		}
		return user;
	}

	public Customer readCustomer(long userId) throws InvalidUserException {

		Customer customer = (Customer) factory.getCurrentSession().get(Customer.class, userId);
		if (customer == null) {
			throw new InvalidUserException();
		}
		return customer;
	}

	public Employee readEmployee(long userId) throws InvalidUserException {

		Employee employee = (Employee) factory.getCurrentSession().get(Employee.class, userId);
		if (employee == null) {
			throw new InvalidUserException();
		}
		return employee;
	}
*/
	/*@SuppressWarnings("unchecked")
	public void addPayee(Payee payee) throws PayeeRedundancyException {

		Criteria criteria = factory.getCurrentSession().createCriteria(Payee.class)
				.add(Restrictions.eq("accNo", payee.getAccNo()));
		List<Payee> list = criteria.list();

		if (list.size() == 0) {
			factory.getCurrentSession().save(payee);
		} else {
			throw new PayeeRedundancyException();
		}
	}*/

	/*public void addCustomer(Customer customer) {

		factory.getCurrentSession().save(customer);
	}*/
	

	/*@SuppressWarnings("unchecked")
	public List<User> readUserList(String name, String userType) throws NoSuchUserNameException {

		List<User> users=null;
		Criteria criteria=null;
		if(userType.equalsIgnoreCase("Customer")){
			criteria=factory.getCurrentSession().createCriteria(Customer.class).add(Restrictions.ilike("name", "%"+name+"%"));
		}
		else{
			criteria=factory.getCurrentSession().createCriteria(Employee.class).add(Restrictions.ilike("name", "%"+name+"%"));
		}
		users=criteria.list();
		if(users.size()==0){
			throw new NoSuchUserNameException(userType);
		}
		return users;
	}*/

	public void save(User user) {
		factory.getCurrentSession().save(user);
	}
	
	@SuppressWarnings("rawtypes")
	public User get(long userId, Class user){

		User obj = (User) factory.getCurrentSession().get(user, userId);
		if(obj==null){
			System.out.println("-=-=-=-=-=-=-=-=-=-==");
			throw new BankException("Invalid User ID");
		}
		return obj;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<User> getList(String name, Class user){
		Criteria criteria=factory.getCurrentSession().createCriteria(user).add(Restrictions.ilike("name", "%"+name+"%"));
		List<User> userList=criteria.list();
		if(userList.size()==0){
			throw new BankException("No Results Found.");
		}
		return userList;
	}
	
}
