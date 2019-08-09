package com.sell;

public class searchSellDto {
	private String book_price;
	private String book_title;
	private String book_comp;
	private String book_writer;
	private String book_date;
	private String book_group;
	private String book_content;
	private String book_img;
	public searchSellDto() {}
	public searchSellDto(String book_price, String book_title, String book_comp, String book_writer, String book_date,
			String book_group, String book_content, String book_img) {
		this.book_title = book_title;
		this.book_comp = book_comp;
		this.book_writer = book_writer;
		this.book_date = book_date;
		this.book_price = book_price;
		this.book_group = book_group;
		this.book_content = book_content;
		this.book_img = book_img;
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
}
