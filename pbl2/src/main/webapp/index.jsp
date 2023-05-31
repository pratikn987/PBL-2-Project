<%
	if(session.getAttribute("userName")==null)
	{
		response.sendRedirect("signin.jsp");
	}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException" %>


<%@ page import="java.sql.Connection" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Concert+One&display=swap" rel="stylesheet">
    
    <style type="text/css">
			    *{
			    margin: 0px;
			    padding: 0px;
			    box-sizing: border-box;
			}
			body{
			    /* height: 100vh; */
			    background-color: #0F141F;
			}
			nav .navbar{
			    margin: 15px 30px;
			    /* margin-bottom: 40px; */
			    display: flex;
			    align-items: center;
			    justify-content: space-between;
			
			}
			.navbar a{
			    text-decoration: none;
			    font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
			    color: white;
			    font-size: 30px;
			}
			nav{
			    /* background-color: #22223b; */
			    height: 50px;
			    color: white;
			    font-size: 20px;
			    font-family: 'Courier New', Courier, monospace;
			}
			.navbar ul{
			    display: flex;
			    justify-content: space-between;
			
			}
			.ulli li{
			    list-style: none;
			    padding: 10px 20px;
			}
			
			/* Upcoming MOvies */
			
			.movie{
			    background-color: #141927;
			    padding: 20px 30px;
			    border-radius: 15px;
			    width: 255px;
			    margin-left: 30px;
			    /* align-items: center; */
			}
			
			.current{
			    width: 1300px;
			    /* align-items: center; */
			}
			
			.current h2{
			    color: white;
			    align-items: center;
			    margin-left: 80px;
			    font-size: 30px;
			    font-family: 'Alkatra', cursive;
			}
			.moviesList{
			    margin-top: 30px;
			    display: flex;
			    justify-content: space-around;
			    /* width: 1300px; */
			}
			.moviesimg1 img{
			    height: 270px;
			    border-radius: 10px;
			    margin-bottom: 20px;
			    width: 200px;
			}
			
			.btn-view-more{
			    border: 1px solid #1B69D8;
			    background: transparent;
			    color: #1B69D8;
			    padding: 10px 20px;
			    border-radius: 7px;
			    margin-bottom: 10px;
			    margin-left: 45px;
			}
			.btn-view-more:hover{
			    background-color: #1B69D8;
			    color:#141927;
			    margin-bottom: 10px;
			    margin-left: 45px;
			}
			.current{
			    margin-top: 50px;
			    margin-left: 50px;
			    margin-right: 50px;
			}
			.logout{
			font-size: 30px;
			}
			    </style>
    <title>Document</title>
</head>
<body>
    <header>
        <nav>
            <div class="navbar">
                <a href="#">BookMyCinemas</a>
                <ul class="ulli">
                    <li>About</li>
                  <li><%=session.getAttribute("userName") %></li>
                   <li><a href="ticketScreen.jsp?p=<%=session.getAttribute("userName")%>" class="logout" style="font-size:20px">Get Ticket</a></li>
                   <li><a href="logout" class="logout" style="font-size:20px">Logout</a></li>
                </ul>
            </div>
        </nav>
    </header>
    <section class="slider">

    </section>
    <section class="current">
        <h2>Current Playing </h2>
        <div class="moviesList">
        <% Connection con=null;
        	Statement st=null;
        	ResultSet rs= null;
        	Statement st1=null;
        	ResultSet rs1= null;
        	String uname="pratik";
        	
        	try{
        		Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12680");
				
   		     st=con.createStatement();
   		     rs=st.executeQuery("select * from movieDetail");
   		     st1=con.createStatement();
		     rs1=st1.executeQuery("select * from movieDetail where mStatus='upcoming'");
   		     while(rs.next()){
   		 %> 
   		     <div class="movie">
            <div class="movies">
                <div class="moviesimg1">
                
                    <img src="<%out.println(rs.getString("mImgURL")); %>" height="270px" alt="">
                </div>
                    <div class="released">
                       <a href='moviedetails.jsp?u=<%=rs.getString("mName")%>&n=<%=session.getAttribute("userName")%>'><button class="btn-view-more">View More</button>       </a>   
                    </div>   
            </div>
        </div>
   		     
   		 <% }
        	}catch(Exception e) {
    			e.printStackTrace();
    		}
        	%>

    </div>
    
    </div>
</body>
</html>