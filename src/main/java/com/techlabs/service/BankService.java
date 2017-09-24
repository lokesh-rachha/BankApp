package com.techlabs.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;

import com.techlabs.dao.AccountDAO;

public abstract class BankService {

	private Random random;
	@Autowired
	private AccountDAO accountDao;
	
	private Map<String,Object> map;
	
	public BankService() {
		random = new Random();
		map=new HashMap<String,Object>();
	}

	protected String generateOTP() {
		String pwd = String.valueOf(random.nextInt(10000000));
		System.out.println("OTP : " + pwd);
		return pwd;
	}

	protected long generateAccountNo() {
		long acno = 0;
		while (true) {
			acno = random.nextInt(100000000);
			map.put("acno", acno);
			
			if(accountDao.checkDuplicateAccount(map)){
				System.out.println("Account No : " + acno);
				break;
			}
			
			/*if (accountDao.checkDuplicateAccount(acno)) {
				System.out.println("Account No : " + acno);
				break;
			}*/
		}
		return acno;
	}
}
