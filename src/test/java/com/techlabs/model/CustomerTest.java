package com.techlabs.model;

import org.junit.Test;

import com.techlabs.exception.BankException;

public class CustomerTest {

	@SuppressWarnings("unused")
	@Test(expected=Exception.class)
	public void registerPayeeShouldThrowExceptionOnRepeatingPayee() {
		Customer customer=new Customer();
		Payee payee=new Payee(12345, customer);
		customer.registerPayee(12345, null);
	}
	
	@SuppressWarnings("unused")
	@Test
	public void registerPayeeShouldExecuteOnNewPayee() {
		Customer customer=new Customer("Lokesh","13/12/1992", "Male","Single", "Developer", "loki.rachha@gmail.com", "8097709776","Mumbai", "400022", "Sion", "123456");
		Payee payee=new Payee(12345, customer);
		customer.registerPayee(1234567,customer);
	}
	
	@Test(expected=BankException.class)
	public void transferAmountShouldThrowExceptionOnIncorrectPassword() {
		Customer customer=new Customer();
		customer.password="123456";
		customer.transferAmount(null, null, 0, "12348793");
	}
	
	@Test
	public void transferAmountShouldExecuteOnCorrectPassword() {
		Customer customer=new Customer("Lokesh","13/12/1992", "Male","Single", "Developer", "loki.rachha@gmail.com", "8097709776","Mumbai", "400022", "Sion", "123456");
		Account custAccout=new Account(5000, 12345, customer);
		Account payeeAccount=new Account(4500, 1234567, customer);
		customer.transferAmount(custAccout,payeeAccount, 500, "123456");
	}
	
	@Test(expected=Exception.class)
	public void transferAmountShouldThrowExceptionOnLockedStatus() {
		Customer customer=new Customer();
		customer.password="123456";
		customer.status="Lock";
		customer.transferAmount(null, null, 0, "123456");
	}
	
}
