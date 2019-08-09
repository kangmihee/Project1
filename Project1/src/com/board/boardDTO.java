package com.board;

import java.sql.Timestamp;

public class boardDTO {
	private int bo_num;
	private String user_id;
	private String subject;
	private Timestamp reg_date;
	private int ref;
	private int re_step;
	private int re_level;
	private String bo_content;
	private String bo_pwd;
	private int sell_num;

	public boardDTO() {}

	public boardDTO(int bo_num,String user_id,String subject,Timestamp reg_date,int ref,
			int re_step,int re_level,String bo_content,String bo_pwd, int sell_num) {   
		this.bo_num = bo_num;
		this.user_id = user_id;
		this.subject = subject;
		this.reg_date = reg_date;
		this.ref = ref;
		this.re_step = re_step;
		this.re_level = re_level;
		this.bo_content = bo_content;
		this.bo_pwd = bo_pwd;   
		this.sell_num = sell_num;
	}

	public int getSell_num() {
		return sell_num;
	}

	public void setSell_num(int sell_num) {
		this.sell_num = sell_num;
	}

	public int getBo_num() {
		return bo_num;
	}

	public void setBo_num(int bo_num) {
		this.bo_num = bo_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRe_step() {
		return re_step;
	}

	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}

	public int getRe_level() {
		return re_level;
	}

	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}

	public String getBo_content() {
		return bo_content;
	}

	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}

	public String getBo_pwd() {
		return bo_pwd;
	}

	public void setBo_pwd(String bo_pwd) {
		this.bo_pwd = bo_pwd;
	}

}