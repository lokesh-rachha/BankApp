package com.techlabs.exception;

public class BankException extends RuntimeException{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String message;
	
	public BankException(String message) {
		this.message=message;
	}
	
	@Override
	public String getMessage() {

		return message;
	}
}
