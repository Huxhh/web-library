package jspex.servlet;
import java.sql.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class HandleRegister extends HttpServlet{
	public void init(ServletConfig config)throws ServletException{
		super.init(config);
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(Exception e){
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
		Register reg = new Register();
		request.setAttribute("register", reg);//��Bean����洢��request��
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String dbName = "databasetest";
		String userName = "root";
		String userPassword = "563255387";
		String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPassword; 
		String backNews = "";
		try{
			con = DriverManager.getConnection(url);
			String sql = "insert into student(username,password) values('"+username+"','"+password+"')";   
			stm = con.createStatement();
			int bl = stm.executeUpdate(sql);
			if(bl!=0){
				backNews = "ע��ɹ�";
				reg.setBackNews(backNews);
				reg.setUsername(username);
				reg.setPassword(password);
			}
			else{
				backNews = "ע��ʧ��";
				reg.setBackNews(backNews);
			}
			con.close();
		}
		catch(SQLException se){
			backNews = "�û�Ա���ѱ�ʹ�ã�������û���";
			reg.setBackNews(backNews);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("Show.jsp");
		dispatcher.forward(request, response);
		}
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		doPost(request, response);
	}
	
}
