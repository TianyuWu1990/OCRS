package com.yang.ocrs.web;

public class CheckResult {
	private boolean pass;
	private static CheckResult OK= new CheckResult(true);
	private static CheckResult NO = new CheckResult(false);
	public CheckResult(boolean pass) {
		super();
		this.pass = pass;
	}

	public boolean isPass() {
		return pass;
	}
	
	public static CheckResult pass (){
		return OK;
	}
	
	public static CheckResult notPass () {
		return NO;
	}
	
}
