package com.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.board.DBConnect;
import com.board.boardDTO;

import javafx.beans.binding.SetBinding;
import java.sql.Timestamp;

public class boardDAO {	
	private static boardDAO dao;
	private boardDAO() {}
	public static boardDAO getInstance() {
		if (dao == null) {
			dao = new boardDAO();
		}
		return dao;
	}

	//board테이블에 글을 추가
	public static boolean insertArticle(boardDTO dto) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;   
		boolean isSuccess = false;
		int bo_num = dto.getBo_num();
		int ref = dto.getRef();
		int re_step = dto.getRe_step();
		int re_level = dto.getRe_level();
		int sell_num = dto.getSell_num();
		int number = 0; 
		try {
			conn = new DBConnect().getConn();       
			pstmt = conn.prepareStatement("SELECT max(bo_num) FROM board");
			rs = pstmt.executeQuery();  
			if (rs.next()) {
				number=rs.getInt(1)+1;
			} else {
				number=1; 
			}
			if (bo_num!=0) {  
				String  sql1="UPDATE board SET re_step = re_step + 1 WHERE ref = ? and re_step > ?";
				pstmt = conn.prepareStatement(sql1);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				re_step = re_step + 1;
				re_level = re_level + 1;

			}else{
				ref=number;
				re_step=0;
				re_level=0;
			}                   
			String  sql2 = "INSERT INTO board(bo_num,user_id,subject,reg_date,ref,re_step,re_level,bo_content,bo_pwd,sell_num)"
					+ "VALUES(comment_seq.NEXTVAL,?,?,?,?,?,?,?,?,?)";                
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getSubject());
			pstmt.setTimestamp(3, dto.getReg_date());
			pstmt.setInt(4, ref);
			pstmt.setInt(5, re_step);
			pstmt.setInt(6, re_level);
			pstmt.setString(7, dto.getBo_content());
			pstmt.setString(8, dto.getBo_pwd());    
			pstmt.setInt(9, dto.getSell_num());   
			int flag = pstmt.executeUpdate(); // DB에서 변화되어진 행수

			if(flag>0) {
				isSuccess = true;
			}

		} catch(Exception ex) {
			ex.printStackTrace();
		} finally { 
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch (Exception e) {}
		}
		return isSuccess;
	}

	//board테이블에 저장된 전체글의 수를 얻어냄
	public int getArticleCount(int sell_num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			conn = new DBConnect().getConn();
			String sql = "select count(*) from board where sell_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sell_num);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				count = rs.getInt(1);       
			}
		}  
		catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return count;
	}

	//글의 목록(복수개의 글)을 가져옴
	public List<boardDTO> getArticles(int sell_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<boardDTO> board_list=null;
		try {
			conn = new DBConnect().getConn();               
			pstmt = conn.prepareStatement(
					"select * from board where sell_num = ? order by ref desc, re_step asc");
			pstmt.setInt(1, sell_num);
			rs = pstmt.executeQuery();                         

			if (rs.next()) {
				board_list = new ArrayList<boardDTO>();
				do{
					boardDTO dto = new boardDTO();
					dto.setBo_num(rs.getInt("bo_num"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setSubject(rs.getString("subject"));                     
					dto.setReg_date(rs.getTimestamp("reg_date"));
					dto.setRef(rs.getInt("ref"));
					dto.setRe_step(rs.getInt("re_step"));
					dto.setRe_level(rs.getInt("re_level"));
					dto.setBo_content(rs.getString("bo_content"));
					dto.setBo_pwd(rs.getString("bo_pwd")); 
					dto.setSell_num(rs.getInt("sell_num"));                                    
					board_list.add(dto);

				}while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return board_list;
	}

	//글의 내용을 보기(1개의 글)
	public boardDTO getArticle(int bo_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boardDTO dto = null;
		try {
			conn = new DBConnect().getConn(); 	
			pstmt = conn.prepareStatement("select * from board where bo_num = ?");
			pstmt.setInt(1, bo_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new boardDTO();
				dto.setBo_num(rs.getInt("bo_num"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setSubject(rs.getString("subject"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setRef(rs.getInt("ref"));
				dto.setRe_step(rs.getInt("re_step"));
				dto.setRe_level(rs.getInt("re_level"));	
				dto.setBo_content(rs.getString("bo_content")); 
				dto.setBo_pwd(rs.getString("bo_pwd")); 
				dto.setSell_num(rs.getInt("sell_num")); 	            	
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return dto;
	}

	//댓글의 댓글 보기 권한
	public List<boardDTO> getArticleREF(int ref_f) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<boardDTO> list = new ArrayList<boardDTO>();
		try {
			conn = new DBConnect().getConn();    
			pstmt = conn.prepareStatement("select * from board where ref = ?");
			pstmt.setInt(1, ref_f);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int bo_num = rs.getInt("bo_num");
				String user_id = rs.getString("user_id");
				String subject = rs.getString("subject");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				int ref = rs.getInt("ref");
				int re_step = rs.getInt("re_step");
				int re_level = rs.getInt("re_level");
				String bo_content = rs.getString("bo_content");
				String bo_pwd = rs.getString("bo_pwd");
				int sell_num = rs.getInt("sell_num");
				boardDTO dto = new boardDTO(bo_num, user_id, subject, reg_date, ref, re_step, re_level, bo_content, bo_pwd, sell_num);
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

	//글삭제처리시 사용(delete문)
	public static boolean deleteArticle(int bo_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		boolean isSuccess = false;
		String dbpasswd="";
		try {
			conn = new DBConnect().getConn(); 	
			pstmt = conn.prepareStatement("delete from board where bo_num=?");
			pstmt.setInt(1, bo_num);
			rs = pstmt.executeQuery();

			if(rs.next()){
				if(dbpasswd.equals(bo_num)){
					isSuccess = true; //글삭제 성공
				}
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return isSuccess;
	}

	//글보기 권한(content_pwd 같은지 확인)
	public static boolean content_pwd(int bo_num, String bo_pwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		boolean isSuccess = false;
		String dbpasswd="";
		try {
			conn = new DBConnect().getConn(); 	
			pstmt = conn.prepareStatement("select bo_pwd from board where bo_num = ?");
			pstmt.setInt(1, bo_num);
			rs = pstmt.executeQuery();

			if(rs.next()){
				dbpasswd= rs.getString("bo_pwd"); 
				if(dbpasswd.equals(bo_pwd)){
					isSuccess = true; //글보기성공
				}else
					isSuccess =false; //비밀번호 틀림
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return isSuccess;
	}

	//글 수정폼에서 사용할 글의 내용(1개의 글)
	public boardDTO updateGetArticle(int bo_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boardDTO dto = null;
		try {
			conn = new DBConnect().getConn(); 	
			pstmt = conn.prepareStatement("select * from board where bo_num = ?");
			pstmt.setInt(1, bo_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new boardDTO();	                
				dto = new boardDTO();
				dto.setBo_num(rs.getInt("bo_num"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setSubject(rs.getString("subject"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setRef(rs.getInt("ref"));
				dto.setRe_step(rs.getInt("re_step"));
				dto.setRe_level(rs.getInt("re_level"));	
				dto.setBo_content(rs.getString("bo_content")); 
				dto.setBo_pwd(rs.getString("bo_pwd")); 
				dto.setSell_num(rs.getInt("sell_num"));   
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return dto;
	}

	//글 수정처리에서 사용(update문)
	public static boolean updateArticle(boardDTO dto)
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		boolean isSuccess = false;

		try {
			conn = new DBConnect().getConn(); 
			String sql = "update board set subject=?,bo_content=?,bo_pwd=? where bo_num=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getSubject());		        
			pstmt.setString(2, dto.getBo_content());
			pstmt.setString(3, dto.getBo_pwd());
			pstmt.setInt(4, dto.getBo_num());
			int flag = pstmt.executeUpdate(); // DB에서 변화되어진 행수
			if(flag>0) {
				isSuccess = true;
			}

		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return isSuccess;
	}

}
