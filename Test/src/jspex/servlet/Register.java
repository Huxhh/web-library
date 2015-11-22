package jspex.servlet;

public class Register {
	String username;
	String password;
	String backNews;
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
	
	public void setBackNews(String news){
		backNews = news;
	}
	
	public String getBackNews(){
		return backNews;
	}
}
