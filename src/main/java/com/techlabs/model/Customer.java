package com.techlabs.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.stereotype.Service;

import com.techlabs.exception.BankException;

@Service
@Entity
@Table(name = "Customer")
@PrimaryKeyJoinColumn(name = "User_ID")
public class Customer extends User {

	@Column(name = "Occupation")
	@NotNull
	private String occupation;

	@OneToMany(mappedBy = "customer", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private Set<Payee> payeeList;

	@OneToMany(mappedBy = "customer", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private Set<Account> accountList;

	public Customer() {
		/*payeeList = new HashSet<Payee>();
		accountList = new HashSet<Account>();*/
	}

	public Customer(String name, String dob, String gender, String isMarried, String occupation, String email,
			String mobile, String city, String pin, String address, String password) {
		
		this.name = name;
		this.dob = dob;
		this.gender = gender;
		this.isMarried = isMarried;
		this.status = "Inactive";
		this.occupation = occupation;
		this.password = password;
		this.contact = new Contact(email, mobile, city, pin, address);
		payeeList = new HashSet<Payee>();
		accountList = new HashSet<Account>();
	}

	public void registerPayee(long acno, Customer customer) {
		for (Payee payee : payeeList) {
			if (payee.getAccNo() == acno) {
				throw new BankException("Payee Already Registered.");
			}
		}
		for (Account account : customer.getAccountList()) {
			if (account.getAcno() == acno) {
				throw new BankException("Oops its Your Account No Only.");
			}
		}
		Payee payee = new Payee(acno, customer);
		payeeList.add(payee);
	}

	public void manageAccount(Account account, String action, float amount) {

		if (action.equalsIgnoreCase("Deposite")) {
			account.creditAmount(amount);
		} else {
			account.debitAmount(amount);
		}
	}

	public void transferAmount(Account customerAccount, Account payeeAccount, float amount, String pwd) {

		authenticateUser(pwd);
		Customer customer = payeeAccount.getCustomer();
		if (customer.getStatus().equalsIgnoreCase("Lock")) {
			throw new BankException("Sorry Payee's Account is Locked.");
		}
		customerAccount.debitAmount(amount);
		payeeAccount.creditAmount(amount);
	}

	public void addAccount(Account account) {
		this.accountList.add(account);
	}

	public String getOccupation() {
		return occupation;
	}

	public Set<Account> getAccountList() {
		return accountList;
	}

	public Set<Payee> getPayeeList() {
		return payeeList;
	}
}
