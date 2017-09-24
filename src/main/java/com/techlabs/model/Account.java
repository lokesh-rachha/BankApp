package com.techlabs.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.stereotype.Service;

import com.techlabs.exception.BankException;

@Service
@Entity
@Table(name = "Account")
public class Account {

	@Id
	@GeneratedValue
	@Column(name = "Account_ID")
	@NotNull
	private long accId;
	@Column(name = "Balance")
	@NotNull
	private float balance;

	@Column(name="Account_No") @NotNull
	private long acno;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "Cust_ID")
	@NotNull
	private Customer customer;

	public Account() {

	}

	public Account(float balance, long acno, Customer customer) {

		this.balance = balance;
		this.acno = acno;
		this.customer = customer;
	}

	void debitAmount(float amount){

		if(this.balance-amount<500){
			throw new BankException("Sorry, You Have Low Balance.");
		}
		this.balance=this.balance-amount;
	}

	void creditAmount(float amount) {

		this.balance=this.balance + amount;
	}
	
	public long getAcno() {
		return acno;
	}
	
	public Customer getCustomer() {
		return customer;
	}
	
	public long getAccId() {
		return accId;
	}

	public float getBalance() {
		return balance;
	}
}
