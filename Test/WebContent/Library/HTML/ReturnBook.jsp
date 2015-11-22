<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*,java.io.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Return Book</title>
</head>
<body>
<%
	String bookid = request.getParameter("ID");

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String Drivername = "com.mysql.jdbc.Driver";
	String userName = "root";
	String userPassword = "563255387";
	String dbName = "databasetest";
	String tableName = "library";
	String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPassword; 
	Connection con = DriverManager.getConnection(url);
	Statement stmt = con.createStatement();
	
	String sql = "select*from library where BookID="+bookid;
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		int num = rs.getInt("BookNum");
		if(num==0){
			String returnsql = "update library set BookNum='1' where BookID="+bookid;
			stmt.execute(returnsql);
			String deletesql = "delete from borrowrecord where BookID="+bookid;  
			stmt.execute(deletesql);
			out.println("图书归还成功");
			break;
		}
		else{
			String returnsql = "update library set BookNum='"+(num+1)+"' where BookID="+bookid;
			stmt.execute(returnsql);
			String deletesql = "delete from borrowrecord where BookID="+bookid;  
			stmt.execute(deletesql);
			out.println("图书归还成功");
			break;
		}
	}
	rs.close();
	stmt.close();
	con.close();
%>
<p>
	<a href="BorrowRecord.jsp">Return</a>
</p>
</body>
</html>