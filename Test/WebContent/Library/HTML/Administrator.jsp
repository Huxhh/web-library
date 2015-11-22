<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*,java.io.*,jspex.jdbc.PageBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="pageService" class="jspex.jdbc.PageService" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Administrator</title>
</head>
<body bgcolor=#eee>
<%
	out.println("欢迎您，管理员："+session.getAttribute("AdmName"));
	/*Class.forName("com.mysql.jdbc.Driver").newInstance();
	String Drivername = "com.mysql.jdbc.Driver";
	String userName = "root";
	String userPassword = "563255387";
	String dbName = "databasetest";
	String tableName = "library";
	String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPassword; 
	Connection con = DriverManager.getConnection(url);
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select*from library");
	int pageSize = 4;
	int showPage = 1;
	int rowCount = 0;
	int pageCount = 0;
	rs.last();
	rowCount = rs.getRow();
	pageCount = ((rowCount%pageSize)==0?(rowCount/pageSize):(rowCount/pageSize)+1);
	String toPage = request.getParameter("page");
	if(toPage!=null&&toPage!=""){
		showPage = Integer.parseInt(toPage);
		if(showPage>pageCount){
			showPage = pageCount;
		}
		else if(showPage<=0){
			showPage = 1;
		}
	}
	else{
		showPage = 1;
	}
	//关键语句，在rs中定位当前页的第一笔记录位置
	rs.absolute((showPage-1)*pageSize+1);*/
	
	String toPage = request.getParameter("page");
	String method = request.getParameter("method");
	
	ResultSet rs = pageService.getBooks();
	PageBean pb = pageService.getPB(toPage, method);
	
	rs.absolute(pb.getStartRow()+1);
	
%>
<table align="center" border="0" width="800">
<tr><td align="center"><font size="6" face="隶书">所有图书</font></td></tr>
<tr><td width="600" height="10">
共：<font color="blue"><%=pb.getTotalRows() %></font>条&nbsp;
共：<font color="blue"><%=pb.getTotalPages() %></font>页&nbsp;
当前页为第<font color="red"><%=pb.getCurrentPage() %></font>页
<%
	int p,m,n;
	if(pb.getTotalPages()>1){
		if(pb.getCurrentPage()-3>0){
			//m为当前页前三页页码，如果当前页属于最前三页，m=1
			m=pb.getCurrentPage()-3;
		}
		else{
			m=1;
		}
		//n为最后三页页码，如果当前页属于最后三页，n=总页数即最后一页
		if(pb.getCurrentPage()+3<pb.getTotalPages()){
			n = pb.getCurrentPage()+3;
		}
		else{
			n = pb.getTotalPages();
		}
		%>
		转到页码：【
		<%
		for(p=m;p<=n;p++){
			if(pb.getCurrentPage() == p){
				%>
				<font color="red"><b><%=p %></b></font>
				<%
			}
			else{
				%>
				<a href="Administrator.jsp?page=<%=p %>"><%=p %></a>
				<%
			}
		}
		%>
		】
		<% 
	}
%>
</td></tr>
</table>
<table align = center border = 5>
<tr align = center>
<th>图书编号</th><th>图书名称</th><th>基本描述</th><th>借阅状态</th><th>图书数量</th><th>修改</th><th>删除</th>
</tr>
<%
	for(int i=1;i<=pb.getPageSize();i++){
		out.println("<tr align = center>");
		out.println("<td>"+rs.getInt("BookID")+"</td>");
		out.println("<td>"+rs.getString("BookName")+"</td>");
		out.println("<td>"+rs.getString("BookDescribe")+"</td>");
		int num = rs.getInt("BookNum");
		String BookState;
		if(num==0){
			BookState = "不可借";
		}
		else{
			BookState = "可借";
		}
		out.println("<td>"+BookState+"</td>");
		out.println("<td>"+num+"</td>");
		out.println("<td>"+"<a href='changeBook.jsp?ID="+rs.getInt("BookID")+"'>修改</a>"+"</td>");
		out.println("<td>"+"<a href='admOperation.jsp?ID="+rs.getInt("BookID")+"'>删除</a>"+"</td>");
		out.println("</tr>");
		if(!rs.next()) break;
	}
	//con.close();
	//stmt.close();
	rs.close();
	%>
</table>
<table align="center" border="0" width="700">
<tr valign="baseline">
<td align="right">
<%
if(pb.getCurrentPage()!=1){
	%>
	<a href="Administrator.jsp?method=first">第一页</a>
	<a href="Administrator.jsp?method=previous">上一页</a>
	<%
}
if(pb.getCurrentPage()!=pb.getTotalPages()){
	%>
	<a href="Administrator.jsp?method=next">下一页</a>&nbsp;
	<a href="Administrator.jsp?method=last">最后页</a>&nbsp;
	<%
}
%>
</td>
</tr>
</table>
<p>
	<a href="AddBook.html">添加图书</a>
</p>
<p>
	<a href="admBorrowRecord.jsp">查看借阅记录</a>
</p>
<p>
	<a href="login.html">退出登录</a>
</p>
</body>
</html>