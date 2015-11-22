<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Student Operation</title>
</head>
<body>
<%
	String searchBook = request.getParameter("Search");

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String Drivername = "com.mysql.jdbc.Driver";
	String userName = "root";
	String userPassword = "563255387";
	String dbName = "databasetest";
	String tableName = "dblibrary";
	String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPassword; 
	Connection con = DriverManager.getConnection(url);
	Statement stmt = con.createStatement();
	String sql = "select*from dblibrary where Name="+searchBook;   
	ResultSet rs = stmt.executeQuery(sql);
	int k = 0;
	while(rs.next()){
		k+=1;
	}
	if(k>0){
		out.println("您查找的图书存在.");
	}
	else{
		out.println("您查找的图书不存在，请重新输入。");
	}
%>
<p>
		<a href="student.html">Return</a>
</p>
</body>
</html>