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
 * Servlet implementation class editmovie
 */
@WebServlet("/editmovie")
public class editmovie extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		get  PrintWritter
		PrintWriter pw =res.getWriter();
		String u= req.getParameter("u");
		
		String query = "update moviedetail set mName=?,mDate=?,mImgURL=?,mTrailerURL=?,mDescription=?,mbackImage=?,mMovieTime=?,mStatus=? where mName="+u;
		// Set Content Type
		res.setContentType("text/html");
		// get the Values
		
		String mName = req.getParameter("mName");
		String mDate = req.getParameter("mDate");
		String mImgURL = req.getParameter("mImgURL");
		String mTrailerURL = req.getParameter("mTrailerURL");
		String mDescription = req.getParameter("mDescription");
		String mbackImage = req.getParameter("mbackImage");
		String mMovieTime = req.getParameter("mMovieTime");
		String mStatus = req.getParameter("mStatus");

		Connection con=null;
		try {
			String url="jdbc:mysql://localhost:3306/pbl";
		     String dbname ="root";
		     String dbpass = "#P123n123";
		     Class.forName("com.mysql.cj.jdbc.Driver");
		     con = DriverManager.getConnection(url,dbname,dbpass);
		     
		     PreparedStatement ps=con.prepareStatement(query);
		     
//		     Set the values 
		     ps.setString(1, mName);
		     ps.setString(2, mDate);
		     ps.setString(3, mImgURL);
		     ps.setString(4, mTrailerURL);
		     ps.setString(5, mDescription);
		     ps.setString(6, mbackImage);
		     ps.setString(7, mMovieTime);
		     ps.setString(8, mStatus);

//		     Execute the query 
		     int rowCount = ps.executeUpdate();
			    RequestDispatcher dispatcher = req.getRequestDispatcher("showmovie.jsp");
			    
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
