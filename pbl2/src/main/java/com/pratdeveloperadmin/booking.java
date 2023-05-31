package com.pratdeveloperadmin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class booking
 */
@WebServlet("/booking")
public class booking extends HttpServlet {
	 
	
//	PrintWriter out = response.getWriter();
//	out.print("Working");

	
	private final static String query = "insert into bookingDetails (mName,uName,uEmail,uMobile,uBookDate,uTheatre,uNoSeats,uCategory) values(?,?,?,?,?,?,?,?)";
	private final static String query2 = "insert into payments (uName,uNoSeats,uCategory,accNo) values(?,?,?,?)";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		get  PrintWritter
		PrintWriter pw =res.getWriter();
		// Set Content Type
		res.setContentType("text/html");
		// get the Values
		String mName= req.getParameter("mName");
		String uName = req.getParameter("uName");
		String uEmail = req.getParameter("uEmail");
		String uMobile = req.getParameter("uMobile");
		String uBookDate = req.getParameter("uBookDate");
		String uTheatre = req.getParameter("uTheatre");
		String uNoSeats = req.getParameter("uNoSeats");
		String uCategory = req.getParameter("uCategory");
		String accNo =req.getParameter("accNo");
		RequestDispatcher dispatcher = null;

		Connection con=null;
		try {
			 Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12680");
		     
		     PreparedStatement ps=con.prepareStatement(query);
		     PreparedStatement ps2=con.prepareStatement(query2);
		     
//		     Set the values 
		     ps.setString(1, mName);
		     ps.setString(2, uName);
		     ps.setString(3, uEmail);
		     ps.setString(4, uMobile);
		     ps.setString(5, uBookDate);
		     ps.setString(6, uTheatre);
		     ps.setString(7, uNoSeats);
		     ps.setString(8, uCategory);
		    
		     ps2.setString(1, uName);
		     ps2.setString(2, uNoSeats);
		     ps2.setString(3, uCategory);
		     ps2.setString(4, accNo);
		    
		     int rowCount = ps.executeUpdate();

		     int rowCount2 = ps2.executeUpdate();
			    dispatcher = req.getRequestDispatcher("index.jsp");
			    
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
