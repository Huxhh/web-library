package jspex.servlet;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Hello extends HttpServlet{
	public void init(ServletConfig config) throws ServletException{
		super.init(config);
	}
	
	public void service(HttpServletRequest request,HttpServletResponse response)throws IOException{
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<h2>ÄúºÃ£¬»¶Ó­Ñ§Ï°servlet¡£</h2>");
		out.println("</body></html>");
	}
}
