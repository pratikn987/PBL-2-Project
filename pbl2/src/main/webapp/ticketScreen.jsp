<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException" %>


<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />
<link rel="stylesheet" href="css/login.css">
<title>Netflix - Watch TV Shows Online, Watch Movies Online</title>



</head>
<body>

    <header class="showcase">
		  <div class="logo">
               <h2 style="padding:30px">BookMyCinema</h2>
            </div>
 <%
        String p=request.getParameter("p");
        Connection con=null;
        Statement st=null;
        ResultSet rs= null;
        Statement st1=null;
        ResultSet rs1= null;
        Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12680");
		
       	st=con.createStatement();
       	st1=con.createStatement();
       	rs=st.executeQuery("select * from bookingDetails where uName='"+p+"'");
       
%>
            <div class="showcase-content">
                <div class="formm">
                 <%while(rs.next()) {%>  
                   <div class="cardWrap">
				  		<div class="card cardLeft">
				    		<h1><%out.print(rs.getString("uTheatre"));%> </h1>
				    		<div class="title">
				      			<h2><%out.print(rs.getString("mName"));%></h2>
				      			<span>movie</span>
				    		</div>
				    	<div class="name">
				      		<h2><%out.print(rs.getString("uName"));%> </h2>
				     		<span>name</span>
				    	</div>
				    	<div class="seat">
				      		<h2><%out.print(rs.getString("uNoSeats"));%> </h2>
				      		
				      		<span>seat</span>
				    	</div>
				  		</div>
				  			
						</div>
						<br>
						<hr>
						<br>
						<%} %>
                	</div>
                
            </div>
    </header>
</body>
</html>


