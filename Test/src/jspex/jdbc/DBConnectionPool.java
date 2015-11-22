package jspex.jdbc;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;

public class DBConnectionPool {
	public static Connection getConnection()throws SQLException,NamingException{
		Connection con = null;
		try{
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/databasetest");
			con = ds.getConnection();
		}
		catch(Exception e){
			System.out.println("Connection to pool failed");
			System.out.println(e);
		}
		return con;
	}
}
