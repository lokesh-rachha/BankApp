package com.techlabs.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techlabs.dao.UserDAO;
import com.techlabs.model.User;

@Service
public class UserService extends BankService {

	@Autowired
	private UserDAO userDao;
/*
	private Random random;

	public UserService() {
		random = new Random();
	}*/

	/*public UserDAO getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}*/

	/*@Transactional(rollbackFor = { Exception.class })
	public User getUser(long userId, String pwd, String type) {
		User user = userDao.get(userId, User.class);
		// if(user.getPassword().equals(pwd)){
		user.authenticateUser(pwd);
		user.checkLockedStatus();
		if (user.getStatus().equalsIgnoreCase("Lock")) {
			throw new AccountLockedException();
		} else {
			return user;
		}
		return user;
	}
*/
	@SuppressWarnings("rawtypes")
	@Transactional(rollbackFor = { Exception.class })
	public User getUser(long userId, String pwd, Class user) {

		User userObj = userDao.get(userId, user);
		userObj.authenticateUser(pwd);
		userObj.checkLockedStatus();
		return userObj;

	}

	@Transactional(rollbackFor = { Exception.class })
	public void changePassword(long userId, String pwd, String newPwd) {
		User user = userDao.get(userId, User.class);
		/* User user = userDao.readUser(userId, type); */
		user.changePassword(pwd, newPwd);
	}

	@SuppressWarnings({ "rawtypes" })
	@Transactional(rollbackFor = { Exception.class })
	public Set<User> readUserList(String name, Class user) {
		List<User> userList = userDao.getList(name, user);
		Set<User> userSet = new HashSet<User>();
		userSet.addAll(userList);
		return userSet;
	}

	@SuppressWarnings("rawtypes")
	@Transactional(rollbackFor = { Exception.class })
	public User readUser(long userId, Class user) throws Exception {
		User userObj = userDao.get(userId, user);
		return userObj;
	}

	@Transactional(rollbackFor = { Exception.class })
	public void updateProfile(long userId, String name, String gender, String married, String email, String city,
			String address, String mobileNo, String pin, String pwd) {

		User user = userDao.get(userId, User.class);
		// User user = userDao.readUser(userId, type);
		user.updateProfile(name, gender, married, email, mobileNo, city, pin, address, pwd);
	}

	@Transactional(rollbackFor = { Exception.class })
	public void forgetPassword(long userId, String email, String mobile) {

		User user = userDao.get(userId, User.class);
		user.generatePassword(email, mobile, generateOTP());
	}

	/*private String generateOTP() {
		String pwd = String.valueOf(random.nextInt(10000000));
		System.out.println("Forget OTP : " + pwd);
		return pwd;
	}*/

	/*
	 * @Transactional(rollbackFor = { Exception.class }) public Set<User>
	 * readUserList(String name, String userType) throws Exception {
	 * 
	 * List<User> users = userDao.readUserList(name, userType); Set<User> user =
	 * new HashSet<User>(); user.addAll(users); return user; }
	 */
}
