<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Administrator Operation</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String bookname = request.getParameter("BookName");
	String bookdescribe = request.getParameter("BookDescribe");
	String booknum = request.getParameter("BookNum");
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String Drivername = "com.mysql.jdbc.Driver";
	String userName = "root";
	String userPassword = "563255387";
	String dbName = "databasetest";
	String tableName = "library";
	String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPassword; 
	Connection con = DriverManager.getConnection(url);
	Statement stmt = con.createStatement();
	String sql = "insert into library(BookName,BookDescribe,BookState,BookNum) values('"+bookname+"','"+bookdescribe+"','可借','"+booknum+"')";
	stmt.execute(sql);
	out.println("添加图书成功。");
%>
<p>
		<a href="Administrator.jsp">返回查看所有图书</a>
		<a href="AddBook.html">返回继续添加图书</a>
</p>
</body>
</html>