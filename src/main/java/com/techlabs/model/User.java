package com.techlabs.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.stereotype.Service;

import com.techlabs.exception.AccountLockedException;
import com.techlabs.exception.BankException;

@Service
@Entity
@SequenceGenerator(name = "seq", initialValue = 10001)
@Table(name = "User")
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq")
	@Column(name = "ID")
	protected long id;
	@Column(name = "Name")
	@NotNull
	protected String name;
	@Column(name = "DOB")
	@NotNull
	protected String dob;
	@Column(name = "Gender")
	@NotNull
	protected String gender;
	@Column(name = "IsMarried")
	@NotNull
	protected String isMarried;
	@Column(name = "Password")
	@NotNull
	protected String password;
	@Column(name = "Status")
	@NotNull
	protected String status;

	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@NotNull
	@JoinColumn(name = "Contact_ID")
	protected Contact contact;

	public User() {

	}

	public Contact getContact() {
		return contact;
	}

	public long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getDob() {
		return dob;
	}

	public String getGender() {
		return gender;
	}

	public String getIsMarried() {
		return isMarried;
	}

	public String getPassword() {
		return password;
	}

	public String getStatus() {
		return status;
	}

	public void authenticateUser(String pwd) {
		validateUser(pwd);
	}

	public boolean validateUser(String pwd) {
		if (this.password.equals(pwd)) {
			return true;
		} else {
			System.out.println(password + "==========" + pwd);
			throw new BankException("Incorrect Password");
		}
	}

	public void changePassword(String pwd, String newPwd) {

		if (validateUser(pwd)) {
			this.password = newPwd;
			if (this.status.equalsIgnoreCase("Inactive")) {
				changeUserStatus("Active");
			}
		}
	}

	public void changeUserStatus(String newStatus) {
		this.status = newStatus;
	}

	public void updateProfile(String name, String gender, String married, String email, String mobileNo, String city,
			String pin, String address, String pwd) {

		if (validateUser(pwd)) {
			this.name = name;
			this.gender = gender;
			this.isMarried = married;
			contact.updateContact(email, mobileNo, city, pin, address);
		}
	}

	public void checkLockedStatus() {

		if (this.status.equalsIgnoreCase("Lock")) {
			throw new AccountLockedException();
		}
	}

	public void generatePassword(String email, String mobile, String pwd) {

		checkLockedStatus();
		verifyContact(email, mobile);
		this.password = pwd;
		changeUserStatus("Inactive");
	}

	private void verifyContact(String email, String mobile) {

		if (!(this.contact.getEmail().equals(email) && this.contact.getMobile().equals(mobile))) {
			throw new BankException("Incorrect Contact Details.");
		}
	}

}
