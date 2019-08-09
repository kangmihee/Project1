package com.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	private Connection conn;
	public DBConnect() throws SQLException {
		try {
			// 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 접속 정보
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			// 접속 포인트 형성
			conn = DriverManager.getConnection(url, "hr","owo0224662603");
		}catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public Connection getConn() {
		return conn;
	}
	@Override
	protected void finalize() throws Throwable {
		conn.close();
	}
}

