<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="register" class="jspex.servlet.Register" scope="request"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<br><jsp:getProperty property="backNews" name="register"/>
<table>
<tr><td>注册的名称：</td>
<td><jsp:getProperty property="username" name="register"/></td>
</tr>
</table>
<p>
	<a href="Register.jsp">返回重新注册</a>
</p>
<p>
	<a href="login.html">返回登录</a>
</p>
</body>
</html>