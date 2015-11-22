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
	String stuname = session.getAttribute("StuName").toString();
	String id = session.getAttribute("StuID").toString();
	int stuid = Integer.parseInt(id);

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

	String sql = "select * from borrowrecord where StuID="+stuid;
	ResultSet rs = stmt.executeQuery(sql);
%>
<table align = center border = "5">
<caption>借阅记录</caption>
<tr align = center>
<th>图书编号</th><th>图书名称</th><th>基本描述</th><th>借阅者编号</th><th>借阅者名称</th><th>借阅时间</th><th>还书</th>
</tr>
<%
	while(rs.next()){
		int bookid = rs.getInt("BookID");
		ResultSet brs = stmt2.executeQuery("select * from library where BookID="+bookid);
		ResultSet srs = stmt3.executeQuery("select * from student where StuID="+stuid);
		out.println("<tr align = center>");	
		out.println("<td>"+bookid+"</td>");
		if(brs.next()){
			out.println("<td>"+brs.getString("BooKName")+"</td>");
			out.println("<td>"+brs.getString("BookDescribe")+"</td>");
		}
		out.println("<td>"+stuid+"</td>");
		if(srs.next()){
			out.println("<td>"+srs.getString("username")+"</td>");
		}
		out.println("<td>"+rs.getTimestamp("BorrowTime")+"</td>");
		out.println("<td>"+"<a href='ReturnBook.jsp?ID="+bookid+"'>还书</a>"+"</td>");
		}
%>
</table>
<p>
	<a href="Student.jsp">Return</a>
</p>
</body>
</html>