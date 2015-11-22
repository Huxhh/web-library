<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>BorrowBook</title>
</head>
<body>
<%
	String bookid = request.getParameter("ID");
	String bookstate = request.getParameter("State");

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String Drivername = "com.mysql.jdbc.Driver";
	String userName = "root";
	String userPassword = "563255387";
	String dbName = "databasetest";
	String tableName = "dblibrary";
	String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPassword; 
	Connection con = DriverManager.getConnection(url);
	Statement stmt = con.createStatement();
		
	if(bookstate.equals("不可借")){
		out.println("您所借阅的图书不可借");
	}
	else{
		String search_sql = "select*from library where BookID="+bookid;
		ResultSet rs = stmt.executeQuery(search_sql);
		while(rs.next()){
		int num = rs.getInt("BookNum");
		if(num==0)
		{
			out.println("您所借的图书已借完");
		}
		else if(num==1){
			String sql = "update library set BookNum='0' where BookID="+bookid;
			stmt.executeUpdate(sql);
			String brsql1 = "insert into borrowrecord(BookID,StuID,BorrowTime) values('"+bookid+"','"+session.getAttribute("StuID")+"',now())";
			stmt.execute(brsql1);
			out.println("图书借阅成功！");
			break;
		}
		else{
			String sql2 = "update library set BookNum='"+(num-1)+"'where BookID="+bookid;
			stmt.executeUpdate(sql2);
			String brsql = "insert into borrowrecord(BookID,StuID,BorrowTime) values('"+bookid+"','"+session.getAttribute("StuID")+"',now())";
			stmt.execute(brsql);
			out.println("图书借阅成功！");
			break;
		}
		}
	}
	
	con.close();
	stmt.close();
	
%>
<p>
		<a href="Student.jsp">Return</a>
</p>
</body>
</html>