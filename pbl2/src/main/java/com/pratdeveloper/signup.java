package com.pratdeveloper;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class signup
 */
@WebServlet("/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
//		PrintWriter out = response.getWriter();
//		out.print("Working");
	
		
		private final static String query = "insert into users (uName,userName,uEmail,Umobile,password) values(?,?,?,?,?)";
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//			get  PrintWritter
			PrintWriter pw =res.getWriter();
			// Set Content Type
			res.setContentType("text/html");
			// get the Values
			String uName= req.getParameter("uName");
			String userName = req.getParameter("userName");
			String uEmail = req.getParameter("uEmail");
			String Umobile = req.getParameter("Umobile");
			String password = req.getParameter("password");
			RequestDispatcher dispatcher = null;

			Connection con=null;
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12680");
				

			     
			     PreparedStatement ps=con.prepareStatement(query);
			     
//			     Set the values 
			     ps.setString(1, uName);
			     ps.setString(2, userName);
			     ps.setString(3, uEmail);
			     ps.setString(4, Umobile);
			     ps.setString(5, password);
			    

//			     Execute the query 
			    
			     int rowCount = ps.executeUpdate();
				    dispatcher = req.getRequestDispatcher("signin.jsp");
				    
				    if(rowCount>0) {
				    	req.setAttribute("status","success");
				    }else {
				    	req.setAttribute("status","failed");
				    }
				    dispatcher.forward(req, res);
			     
			}catch(Exception e) {
				e.printStackTrace();
			}

		}
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			doGet(req,res);
	}

}
