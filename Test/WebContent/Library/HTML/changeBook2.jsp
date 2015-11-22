<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*,java.io.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Change Book</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String newBookDescribe = request.getParameter("BookDescribe");
	String newBookNum = request.getParameter("BookNum");
	String bookid = session.getAttribute("cBookID").toString();
	int BookID = Integer.parseInt(bookid);
	
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String Drivername = "com.mysql.jdbc.Driver";
	String userName = "root";
	String userPassword = "563255387";
	String dbName = "databasetest";
	String tableName = "library";
	String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPassword; 
	Connection con = DriverManager.getConnection(url);
	Statement stmt = con.createStatement();
	
	String sql = "update library set BookDescribe='"+newBookDescribe+"',BookNum='"+newBookNum+"'where BookID = "+BookID;
	stmt.execute(sql);
	out.println("修改图书信息成功");
	%>
	
<p>
	<a href="Administrator.jsp">完成</a>
</p>
</body>
</html>