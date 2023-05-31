<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.Connection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/book.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
   </head>
<body>

	<%
	   int price = 150;
       String u= request.getParameter("u");
       String n=request.getParameter("n");
       Connection con=null;
       Statement st=null;
       ResultSet rs= null;
       Statement st1=null;
       ResultSet rs1= null;
       Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12680");
		
       st=con.createStatement();
       st1=con.createStatement();
       rs=st.executeQuery("select * from movieDetail where mname='"+u+"'");
       rs1=st1.executeQuery("select * from theatre where mname='"+u+"'");
    %>

  <div class="container">
    <div class="title">Registration</div>
    
    <div class="content">
      <form action="booking" method="post">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Movie Name</span>
            <input type="text" value='<%=u %>' name="mName" required>
          </div>
          <div class="input-box">
            <span class="details">Username</span>
            <input type="text" value='<%=n %>' name="uName" required>
          </div>    
          <div class="input-box">
            <span class="details">Email</span>
            <input type="text" placeholder="Enter your email" name="uEmail" required>
          </div>
          <div class="input-box">
            <span class="details">Phone Number</span>
            <input type="text" placeholder="Enter your number" name="uMobile" required>
          </div>
          
          <div class="input-box">
            <span class="details">Booking Date</span>
            <input type="date" id="inputdate" name="uBookDate">
          </div>
          <div class="input-box">
            <span class="details">Select Theatre</span>
             <select name="uTheatre">
             <%while(rs1.next()) {%>  
             	<option value="<%out.print(rs1.getString("theatreName")); %>,<%out.print(rs1.getString("tLocation")); %>"><%out.print(rs1.getString("theatreName"));%> <%out.print(rs1.getString("tLocation"));%></option>
             <%} %>
             </select>
          </div>

          <div class="input-box">
            <span class="details">No of Seats</span>
            <!-- <input type="noofseats" name="uNoSeats" id="" required> -->
            <select id="noofseat" onchange="test()" name="uNoSeats"  >
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
              <option value="7">7</option>
              <option value="8">8</option>
              <option value="9">9</option>
              <option value="10">10</option>
            </select>
          </div>

          <div class="input-box">
            <span class="details">Seat Category</span>
            <!-- <label for="cars">Seat Category:</label> -->
            <select id="cat" name="uCategory">
              <option value="silver">Silver</option>
              <option value="gold">Gold</option>
            </select>
          </div>
        </div>
        
        <div class="button">
          <input type="button" class="btn-pay" value="Proccess For Payment">
        </div>
        <div class="popup">
            <button id="close">&times;</button>
            <h2>Payment Details</h2>
            <div class="input-box">
              <span class="details">Account Number</span>
              <input type="text" placeholder="Enter Account Number"  name="accNo"required>
            </div>
            <div class="input-box">
              <span class="details">Expire Date</span>
              <input type="date" placeholder="Enter Account Number"  name="expdate"required>
            </div>
            
            <div class="input-box">
              <span class="details">CVV</span>
              <input type="text" placeholder="CVV"  name="CVV" required>
            </div>
            <div class="input-box">
              <span class="details">Price</span>
            
              <div id="result">
              </div>
            </div>
            
            <div class="makePay">
             <button type="submit" style="width:300px; border-radius:7px; font-size:20px; margin-left:200px">Make Payment</button>
            </div>
        </div>
      </form>
    </div>
  </div>

</body>
<script type="text/javascript">
  $(function(){
      var dtToday = new Date();
   
      var month = dtToday.getMonth() + 1;
      var day = dtToday.getDate();
      var year = dtToday.getFullYear();
      if(month < 10)
          month = '0' + month.toString();
      if(day < 10)
       day = '0' + day.toString();
      var maxDate = year + '-' + month + '-' + day;
      $('#inputdate').attr('min', maxDate);
  });

  const btn = document.querySelector(".button");

btn.addEventListener("click",function(){
      document.querySelector(".popup").style.display = "block";
});


document.querySelector("#close").addEventListener("click", function(){
    document.querySelector(".popup").style.display = "none";
});


var pp= 0;
    function test(){
      var x =document.getElementById("noofseat");
      var x1 =document.getElementById("cat");
      
      if(x1.value=="silver"){
    	  pp=150;
    	  var value = x.value;
          
          var disp = document.getElementById("result");
          disp.innerHTML=pp*value;
          var disp1 = document.querySelector(".makePay");
          disp1.innerHTML+=pp*value;
      }else if(x1.value=="gold"){
      var value = x.value;
      pp=200;
      var disp = document.getElementById("result");
      disp.innerHTML=pp*value;
      var disp1 = document.querySelector(".makePay");
      disp1.innerHTML+=pp*value;
    }
    }
  </script>
</html>
