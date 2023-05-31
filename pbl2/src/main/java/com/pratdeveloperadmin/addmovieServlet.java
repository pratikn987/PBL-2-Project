package com.pratdeveloperadmin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/addData")
public class addmovieServlet extends HttpServlet {
	private final static String query = "insert into moviedetail(mName,mDate,mImgURL,mTrailerURL,mDescription,mbackImage,mMovieTime,mStatus) values(?,?,?,?,?,?,?,?)";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		get  PrintWritter
		PrintWriter pw =res.getWriter();
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
		     
		     Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12680");
			
		     
		     PreparedStatement ps=con.prepareStatement(query);
		     
//		     Set the values 
		     ps.setString(1, mName);
		     ps.setString(2, mDate);
		     ps.setString(3, mImgURL);
		     ps.setString(4,mTrailerURL);
		     ps.setString(5, mDescription);
		     ps.setString(6, mbackImage);
		     ps.setString(7, mMovieTime);
		     ps.setString(8, mStatus);

//		     Execute the query 
		     int count = ps.executeUpdate();
		     
		}catch(Exception e) {
			e.printStackTrace();
		}

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req,res);
	}
}
