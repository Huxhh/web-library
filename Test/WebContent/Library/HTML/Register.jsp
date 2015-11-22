<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Register</title>
</head>
<body bgcolor=#eee><font size=2></font>
<center>
<form action="./helpRegister" name=form method="post">
<table>
<caption>用户注册</caption>
	<tr><td>用户名称：</td><td><input type="text" name="username"></td></tr>
	<tr><td>设置密码：</td><td><input type="password" name="password"></td></tr>
	<tr><td><button type="submit">提交</button></td></tr>
</table>
</form>
</center>
</body>
</html>