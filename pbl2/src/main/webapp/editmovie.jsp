<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="css/addmovie.css">
     
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Admin Dashboard Panel</title> 
</head>
<body>
    <nav>
        <div class="logo-name">
            <div class="logo-image">
                <img src="images/logo.png" alt="">
            </div>

            <span class="logo_name">CodingLab</span>
        </div>

         <div class="menu-items">
            <ul class="nav-links">
                <li><a href="admin.jsp">
                    <span class="link-name">Dahsboard</span>
                </a></li>
                <li><a href="addmovie.jsp">
                    <span class="link-name">Add Movie</span>
                </a></li>
                
                <li><a href="showmovie.jsp">
                    <span class="link-name">Movie Details</span>
                </a></li>
                <li><a href="booking.jsp">
                    <span class="link-name">Booking Details</span>
                </a></li>
                
                <li><a href="addtheatre.jsp">
                    <span class="link-name">Add Theatre</span>
                </a></li>
                <li><a href="showreviews.jsp">
                    <span class="link-name">Show Reviews</span>
                </a></li>
                <li><a href="showUsers.jsp">
                    <span class="link-name">Show Users</span>
                </a></li>
                <li><a href="payment.jsp">
                    <span class="link-name">Payment</span>
                </a></li>
            </ul>
        </div>
         
             </nav>


    <section class="dashboard">
        <div class="top">
            <i class="uil uil-bars sidebar-toggle"></i>

            <div class="search-box">
                <i class="uil uil-search"></i>
                <input type="text" placeholder="Search here...">
            </div>
            
           
        </div>

        <div class="dash-content">
            <form action="editmovie" method="post">
            
              
                        
        <% Connection con=null;
        	Statement st=null;
        	ResultSet rs= null;
        	String uname="pratik";
        	
        	try{
                String u= request.getParameter("u");
                Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12680");
				
   		     st=con.createStatement();
   		     rs=st.executeQuery("select * from movieDetail where mName= '"+u+"'");
   		     
   		     while(rs.next()){
   		 %> 
               <label for="Movie name">Enter Movie Name</label><br>
                <input type="text" name="mName" id="" value="<%out.print(rs.getString("mName")); %>"> <br><br>

                <label for="Movie name">Enter Release Date</label><br>
                <input type="date" name="mDate" id="" value="<%out.print(rs.getString("mDate")); %>"> <br><br>

                <label for="Movie name">Poster Image URL</label><br>
                <input type="text" name="mImgURL" id="" value="<%out.print(rs.getString("mImgURL")); %>"> <br><br>

                <label for="Movie name">Trailer Link</label><br>
                <input type="text" name="mTrailerURL" id="" value="<%out.print(rs.getString("mTrailerURL")); %>"> <br><br>

                <label for="Movie name">Movie Description</label><br>
                <textarea  name="mDescription" rows="4" cols="50" value="<%out.print(rs.getString("mDescription")); %>"></textarea><br><br>

                <label for="Movie name">Movie Background Image</label><br>
                <input type="text" name="mbackImage" id="" value="<%out.print(rs.getString("mbackImage")); %>"> <br><br>

                <label for="Movie name">Time</label><br>
                <input type="text" name="mMovieTime" id="" value="<%out.print(rs.getString("mMovieTime")); %>"> <br><br>

                <label for="Movie name">status</label><br>
                <input type="text" name="mStatus" id="" value="<%out.print(rs.getString("mStatus")); %>"> <br><br>

        <% }
   		     
        	}catch(Exception e) {
    			e.printStackTrace();
    		}
        	%>
        	  
                <input type="Submit" value="Update Movie">
            </form>
        </div>
    </section>

    <script src="js/admin.js"></script>
</body>
</html>