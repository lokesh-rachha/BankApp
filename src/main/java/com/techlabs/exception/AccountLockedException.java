package com.techlabs.exception;

public class AccountLockedException extends RuntimeException{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	public String getMessage() {
		return "Account is Locked";
	}
}
