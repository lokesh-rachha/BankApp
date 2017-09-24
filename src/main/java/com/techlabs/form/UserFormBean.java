package com.techlabs.form;

import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.techlabs.model.Account;
import com.techlabs.model.Customer;
import com.techlabs.model.User;

@Component
public class UserFormBean {

	private long userId;
	private String pwd;
	private String newPwd;
	private String confPwd;
	private String type;
	private String email;
	private String mobile;
	private String name;
	private String gender;
	private String married;
	private String dob;
	private String occupation;
	private String city;
	private String pin;
	private String address;
	private long acno;
	private long account;
	private long acId;
	private float balance;
	private long payee;
	private float amount;
	private String status;
	private String action;
	private Set<Long> custAccNo;
	private Set<Long> payeeAccNo;
	private Set<Long> accountList;
	private Set<User> userList;
	private Set<Account> accountDetails;

	public UserFormBean() {
		this.custAccNo = new HashSet<Long>();
		this.payeeAccNo = new HashSet<Long>();
		this.accountDetails = new HashSet<Account>();
	}

	public void reset() {

		this.userId = 0;
		this.name = "";
		this.married = "";
		this.dob = "";
		this.occupation = "";
		this.gender = "";
		this.city = "";
		this.pin = "";
		this.email = "";
		this.address = "";
		this.mobile = "";
		this.action = null;
		this.account = 0;
		this.amount = 0;
		this.balance = 0;
		this.acId = 0;
		this.payee = 0;
		this.pwd = null;
		this.type = null;
		this.status = null;
		this.accountList = new HashSet<Long>();
		this.userList = new HashSet<User>();
	}

	public void setFields(User user) {

		this.userId = user.getId();
		this.name = user.getName();
		this.gender = user.getGender();
		this.married = user.getIsMarried();
		this.email = user.getContact().getEmail();
		this.mobile = user.getContact().getMobile();
		this.city = user.getContact().getCity();
		this.pin = user.getContact().getPin();
		this.address = user.getContact().getAddress();
		this.pwd = null;
	}

	public void addAccounts(Customer customer) {

		Set<Account> setAccounts = customer.getAccountList();
		for (Account account : setAccounts) {
			accountList.add(account.getAcno());
		}
	}

	public void addUser(User user) {
		if (checkDuplicateValue(userList, user)) {
			userList.add(user);
		}
	}

	private boolean checkDuplicateValue(Set<User> set, User user) {
		for (User userObj : set) {
			if (userObj.getId() == user.getId()) {
				return false;
			}
		}
		return true;
	}

	public Set<Account> getAccountDetails() {
		return accountDetails;
	}

	public void setAccountDetails(Set<Account> accountDetails) {
		this.accountDetails = accountDetails;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Set<User> getUserList() {
		return userList;
	}

	public void setUserList(Set<User> userList) {
		this.userList = userList;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public Set<Long> getAccountList() {
		return accountList;
	}

	public void setAccountList(Set<Long> accountList) {
		this.accountList = accountList;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public void addCustAccounts(long acNo) {
		custAccNo.add(acNo);
	}

	public void addPayees(long accNo) {
		payeeAccNo.add(accNo);
	}

	public long getAccount() {
		return account;
	}

	public void setAccount(long account) {
		this.account = account;
	}

	public long getAcId() {
		return acId;
	}

	public void setAcId(long acId) {
		this.acId = acId;
	}

	public float getBalance() {
		return balance;
	}

	public void setBalance(float balance) {
		this.balance = balance;
	}

	public long getPayee() {
		return payee;
	}

	public void setPayee(long payee) {
		this.payee = payee;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public Set<Long> getCustAccNo() {
		return custAccNo;
	}

	public void setCustAccNo(Set<Long> custAccNo) {
		this.custAccNo = custAccNo;
	}

	public Set<Long> getPayeeAccNo() {
		return payeeAccNo;
	}

	public void setPayeeAccNo(Set<Long> payeeAccNo) {
		this.payeeAccNo = payeeAccNo;
	}

	public long getAcno() {
		return acno;
	}

	public void setAcno(long acno) {
		this.acno = acno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMarried() {
		return married;
	}

	public void setMarried(String married) {
		this.married = married;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public String getConfPwd() {
		return confPwd;
	}

	public void setConfPwd(String confPwd) {
		this.confPwd = confPwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
