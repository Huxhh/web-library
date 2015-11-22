package jspex.jdbc;
import java.sql.*;

public class PageService{
	private Connection con;
	private int pageSize = 4;
	private PageBean pb;
	
	public PageService()throws Exception{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String Drivername = "com.mysql.jdbc.Driver";
		String userName = "root";
		String userPassword = "563255387";
		String dbName = "databasetest";
		String tableName = "library";
		String url = "jdbc:mysql://localhost/" + dbName + "?user="+userName+"&password="+userPassword; 
		con = DriverManager.getConnection(url);
		
		int totalRows = getTotalRows();
		pb = new PageBean(totalRows,pageSize);
	}
	
	public ResultSet getBooks()throws Exception{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String Drivername = "com.mysql.jdbc.Driver";
		String userName = "root";
		String userPassword = "563255387";
		String dbName = "databasetest";
		String tableName = "library";
		String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPassword; 
		con = DriverManager.getConnection(url);
		Statement stm = con.createStatement();
		ResultSet rs = stm.executeQuery("select*from library");
		//stm.close();
		//con.close();
		return rs;
	}

	
	public int getTotalRows()throws Exception{
		int totalRows = 0;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String Drivername = "com.mysql.jdbc.Driver";
		String userName = "root";
		String userPassword = "563255387";
		String dbName = "databasetest";
		String tableName = "library";
		String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPassword; 
		con = DriverManager.getConnection(url);
		Statement stm = con.createStatement();
		ResultSet rs = stm.executeQuery("select * from library");
		if(rs.last()){
			totalRows = rs.getRow();
		}
		rs.close();
		stm.close();
		con.close();
		return totalRows;
	}
	
	public PageBean getPB(String currentPage,String pageMethod){
		if(currentPage!=null){
			pb.refresh(Integer.parseInt(currentPage));
		}
		
		if(pageMethod!=null){
			if(pageMethod.equals("first")){
				pb.first();
			}
			else if(pageMethod.equals("previous")){
				pb.previous();
			}
			else if(pageMethod.equals("next")){
				pb.next();
			}
			else if(pageMethod.equals("last")){
				pb.last();
			}
		}
		return pb;
	}
	
}



