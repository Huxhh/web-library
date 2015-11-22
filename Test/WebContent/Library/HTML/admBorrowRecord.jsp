<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*,java.io.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Borrow Record</title>
</head>
<body bgcolor=#eee>
<%

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String Drivername = "com.mysql.jdbc.Driver";
	String userName = "root";
	String userPassword = "563255387";
	String dbName = "databasetest";
	String tableName = "library";
	String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPassword; 
	Connection con = DriverManager.getConnection(url);
	Statement stmt = con.createStatement();
	Statement stmt2 = con.createStatement();
	Statement stmt3 = con.createStatement();
	String sql = "select*from borrowrecord order by BorrowTime desc";
	ResultSet rs = stmt.executeQuery(sql);
	
%>
<table align = center border = "5">
<caption>借阅记录</caption>
<tr align = center>
<th>图书编号</th><th>图书名称</th><th>基本描述</th><th>借阅者编号</th><th>借阅者名称</th><th>借阅时间</th>
</tr>
<%
	while(rs.next()){
		out.println("<tr align = center>");
		int bookid = rs.getInt("BookID");
		ResultSet brs = stmt2.executeQuery("select * from library where BookID =" + bookid);
		ResultSet srs = stmt3.executeQuery("select * from student where StuID =" + rs.getInt("StuID"));
		out.println("<td>"+bookid+"</td>");
		if(brs.next()){
		out.println("<td>"+brs.getString("BookName")+"</td>");
		out.println("<td>"+brs.getString("BookDescribe")+"</td>");
		}
		out.println("<td>"+rs.getInt("StuID")+"</td>");
		if(srs.next()){
		out.println("<td>"+srs.getString("username")+"</td>");
		}
		out.println("<td>"+rs.getTimestamp("BorrowTime")+"</td>");
		}
%>
</table>
<p>
	<a href="Administrator.jsp">Return</a>
</p>
</body>
</html>