<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="login" class="jspex.servlet.Login" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<br><jsp:getProperty property="backNews" name="login"/>
<%
if(login.getSuccess()==true){
%>
<br>登录用户名称:<jsp:getProperty property="username" name="login"/>
<%
}
else{
%>
<br>登录用户名称：<jsp:getProperty property="username" name="login"/>
<br>登录用户密码：<jsp:getProperty property="password" name="login"/>
<%
}
%>
<p>
	<a href="Student.jsp">进入系统</a>
</p>
</body>
</html>