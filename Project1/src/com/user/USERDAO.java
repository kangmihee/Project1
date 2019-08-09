package com.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.user.DBConnect;
import com.user.USERDTO;

public class USERDAO {
	private static USERDAO dao;  
	private USERDAO() {} 
	public static USERDAO getInstance() {
		if(dao==null) {
			dao= new USERDAO();
		}
		return dao;
	}
	
	// 학교이름
	public USERDTO SELECT_IDSCH(String user_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		USERDTO dto = null;
		try {
			conn = new DBConnect().getConn();
			String sql = "SELECT * FROM ub_user WHERE user_id=?";
			pstmt = conn.prepareStatement(sql); 			
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String user_pw = rs.getString("user_pw");
				String user_sch = rs.getString("user_sch");
				String email = rs.getString("email");	            
				dto = new USERDTO(user_id, user_pw, user_sch, email);
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

	// 로그인시 id & pwd 확인
	public static boolean LOGIN_CHECK(String user_id, String user_pw) { 
		String pass_id;
		String pass_pw;
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean isSuccess = false; 		
		try { 
			conn = new DBConnect().getConn();
			String sql = "SELECT * FROM ub_user WHERE user_id = ?"; 

			pstmt = conn.prepareStatement(sql); 			
			pstmt.setString(1, user_id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			pass_id = rs.getString("user_id");
			pass_pw = rs.getString("user_pw");

			if(pass_pw.equals(user_pw)&& pass_id.equals(user_id)) {
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

	// id중복 체크
	public static boolean ID_CHECK(String user_id) { 
		String pass;
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean isSuccess = false; 		
		try { 
			conn = new DBConnect().getConn();
			String sql = "SELECT user_id FROM ub_user where user_id = ?"; 			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();	
			pass = rs.getString("user_id");
			if(pass.equals(user_id)) {
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

	// 회원가입
	public boolean JOIN_INSERT(USERDTO dto) { 
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean isSuccess = false; 

		try { 
			conn = new DBConnect().getConn();
			String sql = "INSERT INTO ub_user (user_id,user_pw,user_sch,email)" + "VALUES(?,?,?,?)"; 

			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getUser_pw());
			pstmt.setString(3, dto.getUser_sch());
			pstmt.setString(4, dto.getEmail());

			int flag = pstmt.executeUpdate();
			if(flag>0) {
				isSuccess = true;
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
}