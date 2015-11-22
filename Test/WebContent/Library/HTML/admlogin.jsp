<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	String Username = request.getParameter("username");
	String Password = request.getParameter("password");
	session.setAttribute("AdmName", Username);

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String Drivername = "com.mysql.jdbc.Driver";
	String userName = "root";
	String userPassword = "563255387";
	String dbName = "databasetest";
	String tableName = "administrator";
	String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPassword; 
	Connection con = DriverManager.getConnection(url);
	Statement stmt = con.createStatement();
	String sql = "select*from administrator where username='"+Username+"'and password='"+Password+"'";   
	ResultSet rs = stmt.executeQuery(sql);
	int k = 0;
	if(rs.next()){
		k+=1;
	}
	if(k>0){
		response.sendRedirect("Administrator.jsp");//登录成功，进入管理员管理页面
	}
	else{
		response.sendRedirect("loginError.html");
	}
	con.close();
	stmt.close();
	rs.close();
%>
</body>
</html>