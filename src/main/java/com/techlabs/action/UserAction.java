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
import com.techlabs.exception.AccountLockedException;
import com.techlabs.form.UserFormBean;
import com.techlabs.model.Customer;
import com.techlabs.model.Employee;
import com.techlabs.model.User;
import com.techlabs.service.UserService;

public class UserAction extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private UserFormBean userForm;
	@Autowired
	private UserService userService;

	private HttpServletRequest request;
	private SessionMap<String, Object> sessionMap;

	public UserAction() {
		request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	}

	public String login() {
		String result = Action.SUCCESS;
		User user = null;
		try {
			if (userForm.getType().equalsIgnoreCase("Customer")) {
				user = userService.getUser(userForm.getUserId(), userForm.getPwd(), Customer.class);
			} else {
				user = userService.getUser(userForm.getUserId(), userForm.getPwd(), Employee.class);
			}
		} catch (AccountLockedException exception) {
			result = "locked";
		} catch (Exception exception) {
			addActionError(exception.getMessage());
			result = Action.LOGIN;
		}
		if (result.equals(Action.SUCCESS)) {

			sessionMap.put("userId", user.getId());
			sessionMap.put("type", userForm.getType());

			if (user.getStatus().equalsIgnoreCase("Inactive")) {
				result = "changePassword";
			} else if (user instanceof Customer) {
				result = "customer";
			} else {
				result = "employee";
			}
		}
		return result;
	}

	public String loadForgetPasswordForm() {

		userForm = null;
		return Action.SUCCESS;
	}

	public String forgetPassword() {

		try {
			userService.forgetPassword(userForm.getUserId(), userForm.getEmail(),
					userForm.getMobile());
		} catch (AccountLockedException e) {
			userForm = null;
			return "locked";
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.INPUT;
		}
		addActionMessage("OTP is sent to Your Mobile No. and Email-ID.");
		userForm = null;
		return Action.SUCCESS;
	}

	public String logout() {

		sessionMap.invalidate();
		return Action.SUCCESS;
	}

	public String loadChangePasswordForm() {

		userForm = null;
		return Action.SUCCESS;
	}

	public String changePassword() {

		try {
			userService.changePassword((Long) sessionMap.get("userId"), userForm.getPwd(),
					userForm.getNewPwd());
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.INPUT;
		}
		addActionMessage("Password Successfully Changed.");
		return Action.SUCCESS;
	}

	public String loadUpdateProfileForm() {
		User user = null;

		try {
			user = userService.readUser((Long) sessionMap.get("userId"), User.class);
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		userForm.setFields(user);
		return Action.SUCCESS;
	}

	public String updateProfile() {

		try {
			userService.updateProfile(userForm.getUserId(), userForm.getName(), userForm.getGender(),
					userForm.getMarried(), userForm.getEmail(), userForm.getCity(),
					userForm.getAddress(), userForm.getMobile(), userForm.getPin(),
					userForm.getPwd());
		} catch (Exception e) {
			addActionError(e.getMessage());
			return Action.INPUT;
		}
		addActionMessage("Profile Successfully Updated.");
		return Action.SUCCESS;
	}

	public String matchedUserList() {

		long userId = 0;
		if (request.getParameter("userId") != "") {
			userId = Long.parseLong(request.getParameter("userId"));
		}
		String name = getRequest().getParameter("name");
		String userType = getRequest().getParameter("userType");

		System.out.println("IDDDDDDD : " + userId);
		userForm.reset();

		if (!name.equals("")) {
			try {
				if (userType.equalsIgnoreCase("Customer")) {
					userForm.setUserList(userService.readUserList(name, Customer.class));
				} else {
					userForm.setUserList(userService.readUserList(name, Employee.class));
				}
			} catch (Exception e) {
				addActionError(e.getMessage());
			}
		}

		if (userId > 0) {
			try {
				if (userType.equalsIgnoreCase("Customer")) {
					userForm.addUser(userService.readUser(userId, Customer.class));
				} else {
					userForm.addUser(userService.readUser(userId, Employee.class));
				}
			} catch (Exception e) {
				addActionError(e.getMessage());
			}
		}

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
