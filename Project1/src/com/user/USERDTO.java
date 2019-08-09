package com.user;

public class USERDTO {
	private String user_id;
	private String user_pw;
	private String user_sch;
	private String email;

	public USERDTO() {}

	public USERDTO(String user_id, String user_pw,String user_sch,String email) {
		this.user_id=user_id;
		this.user_pw=user_pw;
		this.user_sch=user_sch;
		this.email=email;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_sch() {
		return user_sch;
	}

	public void setUser_sch(String user_sch) {
		this.user_sch = user_sch;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


}
