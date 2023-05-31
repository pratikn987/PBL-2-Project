<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.io.IOException" %>


<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="css/admin.css">
     
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Admin Dashboard Panel</title> 
</head>
<body>
    <nav>
        <div class="logo-name">
            <span class="logo_name">BookMyCinema</span>
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
           
    <%
       Connection con=null;
       Statement st=null;
       ResultSet rs= null;
       Statement st1=null;
       ResultSet rs1= null;
       Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12680");
		
              st=con.createStatement();
       st1=con.createStatement();

       rs1=st.executeQuery("select * from users");
       String Countrow="";
      
       
    %>
        
        <%int i=0; %>
         <table class="tbooking">
				  <tr>
                    <th>No.</th>
				    <th>Name</th>
				    <th>Username</th>
				    <th>Email</th>
				    <th>Mobile</th>
				    
				    
                  </tr>
		 <%  while(rs1.next()){%>
		 <%i++; %>
				  <tr>
				  <td><%out.println(i); %></td>
				    <td><%out.println(rs1.getString("uName")); %></td>
				    <td><%out.println(rs1.getString("userName")); %></td>
				    <td><%out.println(rs1.getString("uEmail")); %></td>
				    <td><%out.println(rs1.getString("Umobile")); %></td>
				    
				  </tr>
		<%} %>		  
			</table>
		</div>
    </section>

    <script src="js/admin.js"></script>
</body>
</html>