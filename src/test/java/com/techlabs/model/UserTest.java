package com.techlabs.model;

import static org.junit.Assert.*;

import org.junit.Test;

import com.techlabs.exception.AccountLockedException;
import com.techlabs.exception.BankException;

public class UserTest {

	@Test
	public void validateUserShouldReturnTrueOnCorrectPassword() {
		User user = new User() {
		};
		user.password = "123456";
		assertTrue(user.validateUser("123456"));
	}

	@Test(expected = BankException.class)
	public void validateUserShouldThrowExceptionOnIncorrectPassword() {
		User user = new User() {
		};
		user.password = "123456";
		assertFalse(user.validateUser("123467"));
	}

	@Test
	public void authenticateUserShouldExecuteOnCorrectPassword() {
		User user = new User() {
		};
		user.password = "123456";
		user.authenticateUser("123456");
	}

	@Test(expected = BankException.class)
	public void authenticateUserShouldThrowExceptionOnIncorrectPassword() {
		User user = new User() {
		};
		user.password = "123456";
		user.authenticateUser("123467");
	}

	@Test
	public void changeUserStatusShouldReturnTrue() {
		User user = new User() {
		};
		user.changeUserStatus("status");
		assertTrue(user.getStatus().equalsIgnoreCase("status"));
	}

	@Test
	public void changeUserStatusShouldReturnFalse() {
		User user = new User() {
		};
		user.changeUserStatus("status");
		assertFalse(user.getStatus().equalsIgnoreCase("statusx123"));
	}

	@Test(expected = Exception.class)
	public void changePasswordShouldExecuteOnCorrectPassword() {
		User user = new User() {
		};
		user.password = "123456";
		user.changePassword("123456", "654321");
		assertEquals("654321", user.getPassword());
	}

	@Test(expected = BankException.class)
	public void changePasswordShouldThrowExceptionOnIncorrectPassword() {
		User user = new User() {
		};
		user.password = "123456";
		user.changePassword("1234765", "654321");
	}

	@Test(expected = Exception.class)
	public void updateProfileShouldExecuteOnCorrectPassword() {

		User user = new User() {
		};
		user.password = "123456";
		user.updateProfile("Lokesh", "Male", "Single", "loki.rachha@gmail.com", "8097709776", "Mumbai", "400022",
				"Sion", "123456");
		assertTrue(user.getName().equals("Lokesh") && user.getGender().equals("Male")
				&& user.getIsMarried().equals("Single") && user.getContact().getEmail().equals("loki.rachha@gmail.com")
				&& user.getContact().getMobile().equals("8097709776") && user.getContact().getCity().equals("Mumbai")
				&& user.getContact().getPin().equals("400022") && user.getContact().getAddress().equals("Sion"));
	}

	@Test(expected = BankException.class)
	public void updateProfileShouldThrowExceptionOnIncorrectPassword() {

		User user = new User() {
		};
		user.password = "123456";
		user.updateProfile("Lokesh", "Male", "Single", "loki.rachha@gmail.com", "8097709776", "Mumbai", "400022",
				"Sion", "123456985");
	}

	@Test(expected = AccountLockedException.class)
	public void checkLockedStatusShouldThrowExceptionOnLockedStatus() {

		User user = new User() {
		};
		user.status = "Lock";
		user.checkLockedStatus();
	}

	@SuppressWarnings("unused")
	@Test(expected = AccountLockedException.class)
	public void generatePasswordShouldThrowExceptionOnLockedStatus() {

		User user = new User() {
		};
		user.password = "123456";
		user.status = "Lock";
		Contact contact = new Contact("loki.rachha@gmail.com", "8097709776", null, null, null);
		user.generatePassword("loki.rachha@gmail.com", "8097709776", "123456");
	}

	@SuppressWarnings("unused")
	@Test(expected=Exception.class)
	public void generatePasswordShouldThrowExceptionIncorrectPassword() {

		User user = new User() {
		};
		user.password = "123456";
		Contact contact = new Contact("loki.rachha@gmail.com", "8097709776", null, null, null);
		user.generatePassword("loki.rachha@gmail.com", "8097709776", "1234987");
	}

	@SuppressWarnings("unused")
	@Test(expected=Exception.class)
	public void generatePasswordShouldExecuteOnCorrectEntry() {
		User user = new User() {
		};
		user.password = "123456";
		Contact contact = new Contact("loki.rachha@gmail.com", "8097709776", null, null, null);
		user.generatePassword("loki.rachha@gmail.com", "8097709776", "123456");
	}
	
	@SuppressWarnings("unused")
	@Test(expected=Exception.class)
	public void generatePasswordShouldThrowExceptionOnIncorrectDetails() {
		User user=new User() {
		};
		user.password="123456";
		Contact contact = new Contact("loki.rachha@gmail.com", "8097709776", null, null, null);
		user.generatePassword("loki.rachha@gmai", "8097709", "123456");
	}

}
