package com.techlabs.action;

import java.util.Map;

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
import com.techlabs.service.CustomerService;
import com.techlabs.service.EmployeeService;

public class EmployeeAction extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = 1L;

	@Autowired
	private UserFormBean userForm;

	private SessionMap<String, Object> sessionMap;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private EmployeeService employeeService;

	private HttpServletRequest request;

	public EmployeeAction() {

		request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	}

	public UserFormBean getUserForm() {
		return userForm;
	}

	public void setUserForm(UserFormBean userForm) {
		this.userForm = userForm;
	}

	public String loadAddCustomerForm() {

		userForm.reset();
		return Action.SUCCESS;
	}

	public String addCustomer() {

		try {
			employeeService.addCustomer((Long) sessionMap.get("userId"), userForm.getPwd(), userForm.getName(),
					userForm.getDob(), userForm.getGender(), userForm.getMarried(), userForm.getMobile(),
					userForm.getOccupation(), userForm.getEmail(), userForm.getCity(), userForm.getPin(),
					userForm.getAddress());
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.INPUT;
		}

		addActionMessage("Customer Successfully Added.");
		userForm.reset();
		return Action.SUCCESS;
	}

	public String loadManageCustomerAccountForm() {

		userForm.reset();
		return Action.SUCCESS;
	}

	public String accountsList() {

		userForm.reset();
		long id = Long.parseLong(request.getParameter("userId"));
		Customer customer = null;

		try {
			customer = customerService.readCustomer(id);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		userForm.setUserId(customer.getId());
		userForm.addAccounts(customer);
		return Action.SUCCESS;
	}

	public String accountsDetails() {
		long accNo = Long.parseLong(request.getParameter("accNo"));
		Account account = null;
		try {
			account = customerService.getAccountDetails(accNo);
		} catch (Exception e) {
			addActionError(e.getMessage());
			userForm.reset();
		}
		userForm.setAcId(account.getAccId());
		userForm.setBalance(account.getBalance());
		return Action.SUCCESS;
	}

	public String manageCustomerAccount() {

		try {
			employeeService.manageCustomer((Long) sessionMap.get("userId"), userForm.getUserId(), userForm.getPwd(),
					userForm.getAccount(), userForm.getAction(), userForm.getAmount());
		} catch (Exception e) {
			addActionError(e.getMessage());
			userForm.reset();
			return Action.INPUT;
		}

		addActionMessage("Customer Account Successfully Updated.");
		userForm.reset();
		return Action.SUCCESS;
	}

	public String loadChangeStatusForm() {

		userForm.reset();
		return Action.SUCCESS;
	}

	public String changeStatus() {

		try {
			employeeService.updateStatus((Long) sessionMap.get("userId"), userForm.getUserId(),
					userForm.getPwd(), userForm.getStatus());
		} catch (Exception e) {
			addActionError(e.getMessage());
			userForm.reset();
			return Action.INPUT;
		}
		addActionMessage("Status Changed Successfully.");
		userForm.reset();
		return Action.SUCCESS;
	}

	public void setSession(Map<String, Object> session) {

		this.sessionMap = (SessionMap<String, Object>) session;
	}

	public SessionMap<String, Object> getSessionMap() {
		return sessionMap;
	}

}
