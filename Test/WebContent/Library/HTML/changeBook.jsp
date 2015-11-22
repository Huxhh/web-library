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
	String bookid = request.getParameter("ID");
	session.setAttribute("cBookID", bookid);
%>
<form action="changeBook2.jsp" method="post">
  <fieldset>
	<legend>修改图书信息</legend>
	修改描述：<input type="text" name="BookDescribe"/>（不超过50字。）
	<br/>
	修改数量：<input type="text" name="BookNum"/>
</fieldset>
<button type="submit">提交</button>
</form>
<p>
	<a href="Administrator.jsp">取消</a>
</p>
</body>
</html>