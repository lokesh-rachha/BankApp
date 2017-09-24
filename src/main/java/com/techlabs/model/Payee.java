package com.techlabs.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.springframework.stereotype.Service;

@Service
@Entity
@Table(name="Payee")
public class Payee {

	@Id
	@SequenceGenerator(name="seq", initialValue=301)
    @GeneratedValue(strategy=GenerationType.AUTO, generator="seq")
	@Column(name="Payee_ID")
	private long id;
	
	@Column(name="Account_No") @NotNull
	private long accNo;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "Cust_ID") @NotNull
	@Valid
	private Customer customer;
	
	public Payee() {

	}
	
	public Payee(long accNo, Customer customer) {

		this.accNo = accNo;
		this.customer = customer;
	}

	public Customer getCustomer() {
		return customer;
	}
	
	public long getId() {
		return id;
	}
	
	public long getAccNo() {
		return accNo;
	}
}
