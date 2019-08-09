package com.sell;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.user.DBConnect;

public class searchSellDao {
	private static searchSellDao dao;
	private searchSellDao() {}
	public static searchSellDao getInstance() {
		if (dao == null) {
			dao = new searchSellDao();
		}
		return dao;
	}
	// 책 이름 검색해서 있으면 true, 없으면 false
	public static boolean searchData(String book_title) { 
		String pass;
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean isSuccess = false;       
		try { 
			conn = new DBConnect().getConn();
			String sql = "SELECT * FROM book WHERE book_title = ?"; 

			pstmt = conn.prepareStatement(sql);          
			pstmt.setString(1, book_title);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			pass = rs.getString("book_title");
			if(pass.equals(book_title)) {
				return isSuccess = true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally { 
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch (Exception e) {}
		}
		return isSuccess;
	}
	// Modal에 팔 책의 내용 default값 책 제목으로 검색하기
	public searchSellDto getSearch(String title) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		searchSellDto dto = null;
		ResultSet rs = null;
		try {
			conn = new DBConnect().getConn();
			String sql = "SELECT * FROM book WHERE book_title = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String book_price = rs.getString("book_price");
				String book_title = rs.getString("book_title");
				String book_comp = rs.getString("book_comp");
				String book_writer = rs.getString("book_writer");
				String book_date = rs.getString("book_date");
				String book_group = rs.getString("book_group");
				String book_content = rs.getString("book_content");
				String book_img = rs.getString("book_img");
				dto = new searchSellDto(book_price, book_title, book_comp, book_writer, book_date, book_group, book_content, book_img);
			}else {
				String book_price = "";
				String book_title = "";
				String book_comp = "";
				String book_writer = "";
				String book_date = "";
				String book_group = "";
				String book_content = "";
				String book_img = "";
				dto = new searchSellDto(book_price, book_title, book_comp, book_writer, book_date, book_group, book_content, book_img);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs!=null) rs.close();
				if (pstmt!=null) pstmt.close();
				if (conn!=null) conn.close();
			} catch (Exception e) {}
		}
		return dto;
	}
	// 판매할 책 값 입력하기
	public boolean insert(inputSellDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean isSuccess = false;
		try {
			conn = new DBConnect().getConn();
			String sql = "INSERT INTO sell_book (book_title,book_comp,book_writer,book_date,book_group,book_price,"
					+ "book_content,book_img,sell_price,grade,grade_memo,direct,delivery,campus,del_memo,user_id,user_sch,sell_num,state_img)"
					+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,board_seq.NEXTVAL,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBook_title());
			pstmt.setString(2, dto.getBook_comp());
			pstmt.setString(3, dto.getBook_writer());
			pstmt.setString(4, dto.getBook_date());
			pstmt.setString(5, dto.getBook_group());
			pstmt.setString(6, dto.getBook_price());
			pstmt.setString(7, dto.getBook_content());
			pstmt.setString(8, dto.getBook_img());
			pstmt.setString(9, dto.getSell_price());
			pstmt.setString(10, dto.getGrade());
			pstmt.setString(11, dto.getGrade_memo());
			pstmt.setString(12, dto.getDirect());
			pstmt.setString(13, dto.getDelivery());
			pstmt.setString(14, dto.getCampus());
			pstmt.setString(15, dto.getDel_memo());
			pstmt.setString(16, dto.getUser_id());
			pstmt.setString(17, dto.getUser_sch());
			pstmt.setString(18, dto.getState_img());

			int flag = pstmt.executeUpdate();
			if (flag>0) {
				isSuccess = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt!=null) pstmt.close();
				if (conn!=null) conn.close();
			} catch (Exception e) {}
		}
		return isSuccess;
	}
	// 책 리스트 불러오기
	public List<inputSellDto> getList(){
		Connection conn = null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		List<inputSellDto> list = new ArrayList<inputSellDto>();
		try {
			conn = new DBConnect().getConn(); 
			String sql = "select * from sell_book order by sell_num asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String book_title = rs.getString("book_title");
				String book_comp = rs.getString("book_comp");
				String book_writer = rs.getString("book_writer");
				String book_date = rs.getString("book_date");
				String book_group = rs.getString("book_group");
				String book_price = rs.getString("book_price");
				String book_content = rs.getString("book_content");
				String book_img = rs.getString("book_img");
				String sell_price = rs.getString("sell_price");
				String grade = rs.getString("grade");
				String grade_memo = rs.getString("grade_memo");
				String direct = rs.getString("direct");
				String delivery = rs.getString("delivery");
				String campus = rs.getString("campus");
				String del_memo = rs.getString("del_memo");
				String user_id = rs.getString("user_id");
				String user_sch = rs.getString("user_sch");
				int sell_num = rs.getInt("sell_num");
				String state_img = rs.getString("state_img");

				inputSellDto dto = new inputSellDto(book_price,book_title,book_comp,book_writer,book_date,book_group,book_content,book_img,sell_price,grade,
						grade_memo,direct,delivery,campus,del_memo,user_id,user_sch,sell_num,state_img);
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return list;
	}

	// 책 modal 상세보기
	public inputSellDto BOOK_INFO(int sell_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		inputSellDto dto = null;
		try {
			conn = new DBConnect().getConn();
			String sql = "SELECT * FROM sell_book WHERE sell_num=?";
			pstmt = conn.prepareStatement(sql);          
			pstmt.setInt(1, sell_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String book_title = rs.getString("book_title");
				String book_comp = rs.getString("book_comp");
				String book_writer = rs.getString("book_writer");
				String book_date = rs.getString("book_date");
				String book_group = rs.getString("book_group");
				String book_price = rs.getString("book_price");
				String book_content = rs.getString("book_content");
				String book_img = rs.getString("book_img");
				String sell_price = rs.getString("sell_price");
				String grade = rs.getString("grade");
				String grade_memo = rs.getString("grade_memo");
				String direct = rs.getString("direct");
				String delivery = rs.getString("delivery");
				String campus = rs.getString("campus");
				String del_memo = rs.getString("del_memo");
				String user_id = rs.getString("user_id");
				String user_sch = rs.getString("user_sch");    
				String state_img = rs.getString("state_img");

				dto = new inputSellDto(book_price,book_title,book_comp,book_writer,book_date,book_group,book_content,book_img,sell_price,grade,
						grade_memo,direct,delivery,campus,del_memo,user_id,user_sch,sell_num,state_img);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {}
		}
		return dto;
	}

	//Main 에서 책 제목 검색하여 보여주기
	public List<inputSellDto> searchTitle(String title) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<inputSellDto> list = new ArrayList<inputSellDto>();
		try {
			conn = new DBConnect().getConn();
			String sql = "SELECT * FROM sell_book WHERE book_title = ? order by sell_num desc";
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, title);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String book_title = rs.getString("book_title");
				String book_comp = rs.getString("book_comp");
				String book_writer = rs.getString("book_writer");
				String book_date = rs.getString("book_date");
				String book_group = rs.getString("book_group");
				String book_price = rs.getString("book_price");
				String book_content = rs.getString("book_content");
				String book_img = rs.getString("book_img");
				String sell_price = rs.getString("sell_price");
				String grade = rs.getString("grade");
				String grade_memo = rs.getString("grade_memo");
				String direct = rs.getString("direct");
				String delivery = rs.getString("delivery");
				String campus = rs.getString("campus");
				String del_memo = rs.getString("del_memo");
				String user_id = rs.getString("user_id");
				String user_sch = rs.getString("user_sch"); 
				int sell_num = rs.getInt("sell_num");
				String state_img = rs.getString("state_img");

				inputSellDto dto = new inputSellDto(book_price, book_title, book_comp, book_writer, book_date, book_group, book_content, book_img, 
						sell_price, grade, grade_memo, direct, delivery, campus, del_memo, user_id, user_sch, sell_num,state_img);
				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return list;
	}
	// 책 이름 검색해서 있으면 true, 없으면 false
	public static boolean searchAB(String Atitle) { 
		String pass;
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean isSuccess = false;       
		try { 
			conn = new DBConnect().getConn();
			String sql = "SELECT * FROM sell_book WHERE book_title = ?"; 

			pstmt = conn.prepareStatement(sql);          
			pstmt.setString(1, Atitle);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			pass = rs.getString("book_title");
			if(pass.equals(Atitle)) {
				return isSuccess = true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally { 
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch (Exception e) {}
		}
		return isSuccess;
	}
	//Mypage에 user_id로 자기 자신이 올린 책만 보기
	public List<inputSellDto> showMypage(String user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<inputSellDto> list = new ArrayList<inputSellDto>();
		try {
			conn = new DBConnect().getConn();
			String sql = "SELECT * FROM sell_book WHERE user_id = ? order by sell_num desc";
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, user);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String book_title = rs.getString("book_title");
				String book_comp = rs.getString("book_comp");
				String book_writer = rs.getString("book_writer");
				String book_date = rs.getString("book_date");
				String book_group = rs.getString("book_group");
				String book_price = rs.getString("book_price");
				String book_content = rs.getString("book_content");
				String book_img = rs.getString("book_img");
				String sell_price = rs.getString("sell_price");
				String grade = rs.getString("grade");
				String grade_memo = rs.getString("grade_memo");
				String direct = rs.getString("direct");
				String delivery = rs.getString("delivery");
				String campus = rs.getString("campus");
				String del_memo = rs.getString("del_memo");
				String user_id = rs.getString("user_id");
				String user_sch = rs.getString("user_sch"); 
				int sell_num = rs.getInt("sell_num");
				String state_img = rs.getString("state_img");

				inputSellDto dto = new inputSellDto(book_price, book_title, book_comp, book_writer, book_date, book_group, book_content, book_img, 
						sell_price, grade, grade_memo, direct, delivery, campus, del_memo, user_id, user_sch, sell_num,state_img);
				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return list;
	}
}

