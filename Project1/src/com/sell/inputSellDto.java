package com.sell;

public class inputSellDto {   
	private String book_price;
	private String book_title;
	private String book_comp;
	private String book_writer;
	private String book_date;
	private String book_group;
	private String book_content;
	private String book_img;
	private String sell_price;
	private String grade;
	private String grade_memo;
	private String direct;
	private String delivery;
	private String campus;
	private String del_memo;
	private String user_id;
	private String user_sch;
	private int sell_num;
	private String state_img;

	public inputSellDto() {}
	public inputSellDto(String book_price, String book_title, String book_comp, String book_writer, String book_date,
			String book_group, String book_content, String book_img,
			String sell_price, String grade, String grade_memo, 
			String direct, String delivery, String campus, String del_memo, String user_id, String user_sch, int sell_num, String state_img) {
		this.book_title = book_title;
		this.book_comp = book_comp;
		this.book_writer = book_writer;
		this.book_date = book_date;
		this.book_price = book_price;
		this.book_group = book_group;
		this.book_content = book_content;
		this.book_img = book_img;
		this.sell_price = sell_price;
		this.grade = grade;
		this.grade_memo = grade_memo;
		this.direct = direct;
		this.delivery = delivery;
		this.campus = campus;
		this.del_memo = del_memo;
		this.user_id = user_id;
		this.user_sch = user_sch;
		this.sell_num = sell_num;
		this.state_img = state_img;


	}
	public String getState_img() {
		return state_img;
	}
	public void setState_img(String state_img) {
		this.state_img = state_img;
	}
	public int getSell_num() {
		return sell_num;
	}
	public void setSell_num(int sell_num) {
		this.sell_num = sell_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_sch() {
		return user_sch;
	}
	public void setUser_sch(String user_sch) {
		this.user_sch = user_sch;
	}
	public String getBook_price() {
		return book_price;
	}
	public void setBook_price(String book_price) {
		this.book_price = book_price;
	}
	public String getBook_title() {
		return book_title;
	}
	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}
	public String getBook_comp() {
		return book_comp;
	}
	public void setBook_comp(String book_comp) {
		this.book_comp = book_comp;
	}
	public String getBook_writer() {
		return book_writer;
	}
	public void setBook_writer(String book_writer) {
		this.book_writer = book_writer;
	}
	public String getBook_date() {
		return book_date;
	}
	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}
	public String getBook_group() {
		return book_group;
	}
	public void setBook_group(String book_group) {
		this.book_group = book_group;
	}
	public String getBook_content() {
		return book_content;
	}
	public void setBook_content(String book_content) {
		this.book_content = book_content;
	}
	public String getBook_img() {
		return book_img;
	}
	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}
	public String getSell_price() {
		return sell_price;
	}
	public void setSell_price(String sell_price) {
		this.sell_price = sell_price;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getGrade_memo() {
		return grade_memo;
	}
	public void setGrade_memo(String grade_memo) {
		this.grade_memo = grade_memo;
	}
	public String getDirect() {
		return direct;
	}
	public void setDirect(String direct) {
		this.direct = direct;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getCampus() {
		return campus;
	}
	public void setCampus(String campus) {
		this.campus = campus;
	}
	public String getDel_memo() {
		return del_memo;
	}
	public void setDel_memo(String del_memo) {
		this.del_memo = del_memo;
	}
}