package jspex.jdbc;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.util.*;

public class showBook {
	public ResultSet showBooks() throws SQLException, NamingException{
		Connection con = DBConnectionPool.getConnection();
		Statement stm = con.createStatement();
		ResultSet rs = stm.executeQuery("select*from library");
		con.close();
		return rs;
	}
	
	public void InsertBook(String Name,String Describe) throws SQLException, NamingException{
		Connection con = DBConnectionPool.getConnection();
		Statement stm = con.createStatement();
		String sql = "insert into library(BookName,BookDescribe,BookState) values('"+Name+"'£¬'"+Describe+"','¿É½è')";
		stm.execute(sql);
		con.close();
	}
}
