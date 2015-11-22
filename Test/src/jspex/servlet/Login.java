package jspex.servlet;

public class Login {
	String username;
	String password;
	String backNews = "";
	boolean success = false;
	public void setUsername(String name){
		username = name;
	}
	
	public String getUsername(){
		return username;
	}
	
	public void setPassword(String pw){
		password = pw;
	}
	
	public String getPassword(){
		return password;
	}
	
	public void setBackNews(String s){
		backNews = s;
	}
	
	public String getBackNews(){
		return backNews;
	}
	
	public void setSuccess(boolean b){
		success = b;
	}
	
	public boolean getSuccess(){
		return success;
	}
}







