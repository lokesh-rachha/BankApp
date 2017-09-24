package com.techlabs.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.stereotype.Service;

@Service
@Entity
@SequenceGenerator(name="seq", initialValue=101)
@Table(name="Contact")
public class Contact {
	
	@Id
	@Column(name = "Contact_ID")
	@GeneratedValue(strategy=GenerationType.AUTO, generator="seq")
	private long id;

	@Column(name="Email") @NotNull
	private String email;
	@Column(name="Mobile") @NotNull
	private String mobile;
	@Column(name="City") @NotNull
	private String city;
	@Column(name="Pin") @NotNull
	private String pin;
	@Column(name="Address") @NotNull
	private String address;

	
	public Contact() {
	
	}

	public Contact(String email, String mobile, String city,
			String pin, String address) {

		this.email = email;
		this.mobile = mobile;
		this.city = city;
		this.pin = pin;
		this.address = address;
	}

	public void updateContact(String email, String mobileNo, String city, String pin, String address) {

		this.address=address;
		this.email=email;
		this.city=city;
		this.mobile=mobileNo;
		this.pin=pin;
	}

	public long getId() {
		return id;
	}

	public String getEmail() {
		return email;
	}

	public String getMobile() {
		return mobile;
	}

	public String getCity() {
		return city;
	}

	public String getPin() {
		return pin;
	}

	public String getAddress() {
		return address;
	}
}
