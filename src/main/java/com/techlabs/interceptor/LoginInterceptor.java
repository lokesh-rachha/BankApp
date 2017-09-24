package com.techlabs.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class LoginInterceptor implements Interceptor{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public void destroy() {
		System.out.println("Destroy Interceptor");
	}

	public void init() {
		System.out.println("Initialise Interceptor");
	}

	public String intercept(ActionInvocation invocation) throws Exception {

		System.out.println("Within Intercept method");
		
		HttpServletRequest request=(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		HttpSession session=request.getSession(false);
		
		if(session==null)
			return Action.LOGIN;
		
		if(session.getAttribute("userId")==null){
			return Action.LOGIN;
		}
		System.out.println("CustomInterceptor, after invocation.invoke()...");
		return invocation.invoke();
	}

}
