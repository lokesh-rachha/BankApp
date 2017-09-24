package com.techlabs.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.stereotype.Service;

import com.techlabs.exception.BankException;

@Service
@Entity
@Table(name = "Employee")
@PrimaryKeyJoinColumn(name = "User_ID")
public class Employee extends User {
	@Column(name = "Qualification")
	@NotNull
	private String qualification;
	@Column(name = "Department")
	@NotNull
	private String department;

	public Employee() {

	}

	public Employee(String name, String dob, String gender, String isMarried, String qualification, String department,
			String email, String mobile, String city, String pin, String address, String password) {

		this.name = name;
		this.dob = dob;
		this.gender = gender;
		this.isMarried = isMarried;
		this.qualification = qualification;
		this.department = department;
		this.password = password;
		this.contact = new Contact(email, mobile, city, pin, address);
	}

	public String getQualification() {
		return qualification;
	}

	public String getDepartment() {
		return department;
	}

	public void manageCustomerAccount(Customer customer, Account account, String pwd, String action, float amount){

		authenticateUser(pwd);
		if(customer.getStatus().equalsIgnoreCase("Lock")){
			throw new BankException("Sorry, Customer's Account is Locked.");
		}
		customer.manageAccount(account, action, amount);
	}

}
