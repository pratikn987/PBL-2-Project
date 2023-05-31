package com.pratdeveloper;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/signin")
public class signin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String password= request.getParameter("password");
		HttpSession session= request.getSession();
		RequestDispatcher dispatcher = null;

		
		try {
			 Class.forName("oracle.jdbc.driver.OracleDriver");
			 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12680");
			
		    PreparedStatement pst = con.prepareStatement("select * from users where userName=? and password=?");
		    pst.setString(1, userName);
		    pst.setString(2, password);
		    
		    ResultSet rs= pst.executeQuery();
		    if(rs.next()) {
		    	session.setAttribute("userName",rs.getString("userName"));
		    	dispatcher = request.getRequestDispatcher("index.jsp");
		    }else {
		    	request.setAttribute("status", "failed");
		    	dispatcher= request.getRequestDispatcher("signin.jsp");
		    }
		    dispatcher.forward(request, response);
		    
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
