<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sell.searchSellDao"%>
<%@ page import="com.sell.inputSellDto"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>


<%
	String realFolder = "";
	String filename1 = "";
	String filename2 = "";
	MultipartRequest imageUp = null;

	String saveFolder = "/imageFile";
	String encType = "utf-8"; 
	int maxSize = 2 * 1024 * 1024; 
	
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);

	try {

		imageUp = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		Enumeration files = imageUp.getFileNames();

		while (files.hasMoreElements()) {
			String file1 = (String) files.nextElement();
			filename1 = imageUp.getFilesystemName(file1);
			String file2 = (String) files.nextElement();
			filename2 = imageUp.getFilesystemName(file2);
		}
	} catch (IOException ioe) {
		System.out.println(ioe);
	} catch (Exception e) {
		e.printStackTrace();
	}

	request.setCharacterEncoding("UTF-8");
	String book_price = imageUp.getParameter("book_price");
	String book_title = imageUp.getParameter("book_title");
	String book_comp = imageUp.getParameter("book_comp");
	String book_writer = imageUp.getParameter("book_writer");
	String book_date = imageUp.getParameter("book_date");
	String book_group = imageUp.getParameter("book_group");
	String book_content = imageUp.getParameter("book_content");
	String sell_price = imageUp.getParameter("sell_price");
	String grade = imageUp.getParameter("grade");
	String grade_memo = imageUp.getParameter("grade_memo");
	String campus = imageUp.getParameter("campus");
	String delivery = imageUp.getParameter("delivery");
	String direct = imageUp.getParameter("direct");
	String del_memo = imageUp.getParameter("del_memo");

	String user_id = (String) session.getAttribute("sessionID");
	String user_sch = (String) session.getAttribute("sessionSCH");

	inputSellDto dto = new inputSellDto();
	dto.setBook_price(book_price);
	dto.setBook_title(book_title);
	dto.setBook_comp(book_comp);
	dto.setBook_writer(book_writer);
	dto.setBook_date(book_date);
	dto.setBook_group(book_group);
	dto.setBook_content(book_content);
	dto.setBook_img(filename1);
	dto.setSell_price(sell_price);
	dto.setGrade(grade);
	dto.setGrade_memo(grade_memo);
	dto.setCampus(campus);
	dto.setDelivery(delivery);
	dto.setDirect(direct);
	dto.setDel_memo(del_memo);
	dto.setUser_id(user_id);
	dto.setUser_sch(user_sch);
	dto.setState_img(filename2);

	searchSellDao.getInstance().insert(dto);

	response.sendRedirect("MYPAGE_FORM.jsp");
%>