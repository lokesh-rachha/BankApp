package com.techlabs.action;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.techlabs.form.UserFormBean;
import com.techlabs.model.Account;
import com.techlabs.model.Customer;
import com.techlabs.model.Payee;
import com.techlabs.service.CustomerService;

public class CustomerAction extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = 1L;

	@Autowired
	private UserFormBean userForm;

	private SessionMap<String, Object> sessionMap;

	private HttpServletRequest request;

	@Autowired
	private CustomerService customerService;

	public CustomerAction() {

		request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	}

	public String customerHome() {
		try {
			Customer customer = customerService.readCustomer((Long) sessionMap.get("userId"));
			Set<Account> accountDetails = customer.getAccountList();
			userForm.setAccountDetails(accountDetails);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.SUCCESS;
	}

	public String loadRegisterPayeeForm() {

		userForm = null;
		return Action.SUCCESS;
	}

	public String registerPayee() {

		try {
			customerService.addPayee((Long) sessionMap.get("userId"), userForm.getAcno(), userForm.getPwd());
		} catch (Exception e) {
			System.out.println("error in register payee");
			addActionError(e.getMessage());
			return Action.INPUT;
		}

		addActionMessage("Payee Successfully Registered.");
		userForm = null;
		return Action.SUCCESS;
	}

	public String loadTransferMoneyForm() {

		userForm.reset();
		Customer customer = null;
		try {
			customer = customerService.readCustomer((Long) sessionMap.get("userId"));
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		Set<Account> accountSet = customer.getAccountList();
		Set<Payee> payeeSet = customer.getPayeeList();
		for (Payee payee : payeeSet) {
			userForm.addPayees(payee.getAccNo());
		}
		for (Account account : accountSet) {
			userForm.addCustAccounts(account.getAcno());
		}
		return Action.SUCCESS;
	}

	public String transferMoney() {

		try {
			customerService.transferMoney((Long) sessionMap.get("userId"), userForm.getAccount(), userForm.getPayee(),
					userForm.getAmount(), userForm.getPwd());
		} catch (Exception e) {
			System.out.println("error in transfer money");
			addActionError(e.getMessage());
			userForm.reset();
			return Action.INPUT;
		}

		addActionMessage("Money Successfully Transfered");
		userForm.reset();
		return Action.SUCCESS;
	}

	public String loadAccountDetails() {

		long accountNo = Long.parseLong(request.getParameter("accNo"));
		Account account = null;
		try {
			account = customerService.getAccountDetails(accountNo);
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.INPUT;
		}
		userForm.setAcId(account.getAccId());
		userForm.setBalance(account.getBalance());
		return Action.SUCCESS;

	}

	public UserFormBean getUserForm() {
		return userForm;
	}

	public void setUserForm(UserFormBean userForm) {
		this.userForm = userForm;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public SessionMap<String, Object> getSessionMap() {
		return sessionMap;
	}

	public void setSession(Map<String, Object> session) {

		this.sessionMap = (SessionMap<String, Object>) session;
	}

}
