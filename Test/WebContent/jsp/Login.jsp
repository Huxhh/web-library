<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	String Username = request.getParameter("Username");
	String Password = request.getParameter("Password");
	
	
    Class.forName("com.mysql.jdbc.Driver").newInstance();
	String Drivername = "com.mysql.jdbc.Driver";
	String userName = "root";
	String userPassword = "563255387";
	String dbName = "databasetest";
	String tableName = "Inf";
	String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPassword; 
	Connection con = DriverManager.getConnection(url);
	Statement stmt = con.createStatement();
	
	String insert_sql = "insert into Inf values('"+Username+"','"+Password+"')";
	stmt.execute(insert_sql);
	stmt.close(); 
	con.close(); 
%>

登录成功
</body>
</html>