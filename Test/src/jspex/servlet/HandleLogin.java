package jspex.servlet;
import java.sql.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class HandleLogin extends HttpServlet{
	public void init(ServletConfig config)throws ServletException{
		super.init(config);
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public String handleString(String s){
		try{
			byte bb[] = s.getBytes("utf-8");
			s = new String(bb);
		}
		catch(Exception exception){
		}
		return s;
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		Connection con;
		Statement stm;
		Login loginBean = null;
		String backNews = "";
		HttpSession session = request.getSession(true);
		try{
			loginBean = (Login)session.getAttribute("login");
			if(loginBean == null){
				loginBean = new Login();
				session.setAttribute("login", loginBean);
			}
		}
		catch(Exception ee){
			loginBean = new Login();
			session.setAttribute("login", loginBean);
		}
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		boolean ok = loginBean.getSuccess();
		username = handleString(username);
		password = handleString(password);
		if(ok == true&&username.equals(loginBean.getUsername())){
			backNews = username + "已经登录了";
			loginBean.setBackNews(backNews);
		}
		else{
			String dbName = "databasetest";
			String userName = "root";
			String userPassword = "563255387";
			String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPassword; 
			try{
				con = DriverManager.getConnection(url);
				stm = con.createStatement();
				String sql = "select*from student where username='"+username+"'and password='"+password+"'";   
				ResultSet rs = stm.executeQuery(sql);
				if(rs.next()){
					backNews = "登录成功";
					loginBean.setBackNews(backNews);
					loginBean.setSuccess(true);
					loginBean.setUsername(username);
					session.setAttribute("StuName", username);
					session.setAttribute("StuID", rs.getInt("StuID"));
				}
				else{
					backNews = "您输入的用户名不存在，或密码不匹配";
					loginBean.setBackNews(backNews);
					loginBean.setSuccess(false);
					loginBean.setUsername(username);
					loginBean.setPassword(password);
				}
				con.close();
			}
			catch(SQLException exp){
				backNews = ""+exp;
				loginBean.setBackNews(backNews);
				loginBean.setSuccess(false);
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("showSuccess.jsp");
		dispatcher.forward(request, response);
	}
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		doPost(request, response);
	}
}
