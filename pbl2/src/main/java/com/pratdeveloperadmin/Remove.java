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

@WebServlet("/Remove")
public class Remove extends HttpServlet {
private static final long serialVersionUID = 1L;

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String mName = request.getParameter("u");
    
    out.println(mName);
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String user = "root";
        String pass = "#P123n123";
        String query = "delete from movieDetail where mName=?";
        Connection con = DriverManager.getConnection("jdbc:mysql://locahost:3306/pbl", user, pass);
        PreparedStatement ps = con.prepareStatement("delete from movieDetail where mName=?");
        ps.setString(1, mName);

        int i = ps.executeUpdate();

        if(i > 0) {
            out.println("User successfully removed...");
        }

    } catch (Exception e) {
        System.out.println(e);
    }
}

}