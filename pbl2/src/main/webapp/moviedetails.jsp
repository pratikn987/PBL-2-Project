<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException" %>


<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book My Cinema</title>
    <link href="css/mdetails.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <title>Document</title>
    <script>
    
    </script>
</head>
<body>
    <section class="content1">
            <%
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
       		 	rs1=st1.executeQuery("select * from reviews where mname='"+u+"'");
                %>
         <%while(rs.next()) {%>  
               
        <div class="content2">
            <div class="content3">

                <h3><%out.print(rs.getString("mName")); %></h3>
                <p>&#x2022; &nbsp; <%out.print(rs.getString("mMovieTime"));%></p>
              
                <p><%out.print(rs.getString("mDescription"));%></p>

                <div class="watch-trailer-book" style="display:flex">
                    
                    <button class="watch-trailer btn-content3">
                        <img src="/images/play.png" class="play-btn" height="14px" alt="">
                        <h4 class="watch-btn">Watch Trailer</h4> 
                    </button>
            
                    
                   <a href='book.jsp?u=<%=rs.getString("mName")%>&n=<%=n%>'> 
	                   <button class="book-now btn-content3">Book Now
	                    </button> 
                    </a>
  
                </div>
            </div>       
            <div class="content4">
              
                <img src="<%out.println(rs.getString("mbackImage")); %>" height="400px" width="720px" alt="">
            </div>  
        </div>

        
        <div class="trailer-play">
            <div class="close-btn">
                 <p style="color:white">
                 close</p> 
            </div>
          
            <iframe allow='autoplay' width="1200" height="600" id="trailer-play-video" class="trailer-play-video" src="<%out.println(rs.getString("mTrailerURl")); %>" title="YouTube video player" frameborder="0" allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

        </div>
        
        <%} %>
    </section>
    
    <br>
    <br>
    <hr>
    <br><br>
    <br>
    
    <div class="wrapper">
      <i id="left" class="fa-solid fa-angle-left"></i>
      <ul class="carousel">
        <%while(rs1.next()) {%>        
        <li class="card">
          
          <h2><%out.print(rs1.getString("mUname")); %></h2>
          <span><%out.print(rs1.getString("mReview"));%></span>
        </li>
        <%} %>
       
      </ul>
      <i id="right" class="fa-solid fa-angle-right"></i>
    </div>
    
    
    <button class="add-review" style="padidng:10px">
      <h1 >Add Review</h1>
    </button>
    <div class="review-screen" style="padding-left:100px; padding-top:100px">
      	<div class="close-btn1">
           <p style="color:white"> close</p> 
      	</div>
     	<h3 >.</h3>
     	<form action="addreview" method="post">
      		<label style="color:white; padding-top:20px">Movie Name</label><br>
      		<input type="text" value='<%=u %>' name="mName" style="padding:10px; width:300px;border-radius:10px" > <br><br>
      		<label style="color:white; padding-top:20px">Name </label><br>
      		<input style="padding:10px; width:300px;border-radius:10px" type="text" placeholder="Enter Your Name Here" name="mUname"> <br><br>
      		<label style="color:white; padding-top:20px">Review</label><br>
      		<textarea style="padding:10px; width:300px;border-radius:10px" name="mReview" id="" cols="30" rows="10" required></textarea><br><br><br>
	
	        <input style="padding:10px; width:=200px;border-radius:10px" type="Submit" value="Submit">
     	</form>
    </div>
    
    
    <script>
	    const watch_trailer=document.querySelector(".watch-trailer")
	    const close_btn=document.querySelector(".close-btn")
	    const trailer_play =document.querySelector(".trailer-play")
	    const trailer_play_video = document.getElementById("trailer-play-video")
	    watch_trailer.addEventListener('click',()=>{
	        trailer_play.style.display="block";
	    })
	
	    close_btn.addEventListener('click',()=>{
	        // trailer_play_video.pause();
	        trailer_play.style.display="none";
	    })
    
			    
		const addreview=document.querySelector(".add-review")
		const close_btn1=document.querySelector(".close-btn1")
		const reviewScreen =document.querySelector(".review-screen")
		addreview.addEventListener('click',()=>{
		    reviewScreen.style.display="block";
		})
		
		close_btn1.addEventListener('click',()=>{
		    // trailer_play_video.pause();
		    reviewScreen.style.display="none";
		})
		
		const wrapper = document.querySelector(".wrapper");
const carousel = document.querySelector(".carousel");
const firstCardWidth = carousel.querySelector(".card").offsetWidth;
const arrowBtns = document.querySelectorAll(".wrapper i");
const carouselChildrens = [...carousel.children];

let isDragging = false, isAutoPlay = true, startX, startScrollLeft, timeoutId;

// Get the number of cards that can fit in the carousel at once
let cardPerView = Math.round(carousel.offsetWidth / firstCardWidth);

// Insert copies of the last few cards to beginning of carousel for infinite scrolling
carouselChildrens.slice(-cardPerView).reverse().forEach(card => {
    carousel.insertAdjacentHTML("afterbegin", card.outerHTML);
});

// Insert copies of the first few cards to end of carousel for infinite scrolling
carouselChildrens.slice(0, cardPerView).forEach(card => {
    carousel.insertAdjacentHTML("beforeend", card.outerHTML);
});

// Scroll the carousel at appropriate postition to hide first few duplicate cards on Firefox
carousel.classList.add("no-transition");
carousel.scrollLeft = carousel.offsetWidth;
carousel.classList.remove("no-transition");

// Add event listeners for the arrow buttons to scroll the carousel left and right
arrowBtns.forEach(btn => {
    btn.addEventListener("click", () => {
        carousel.scrollLeft += btn.id == "left" ? -firstCardWidth : firstCardWidth;
    });
});

const dragStart = (e) => {
    isDragging = true;
    carousel.classList.add("dragging");
    // Records the initial cursor and scroll position of the carousel
    startX = e.pageX;
    startScrollLeft = carousel.scrollLeft;
}

const dragging = (e) => {
    if(!isDragging) return; // if isDragging is false return from here
    // Updates the scroll position of the carousel based on the cursor movement
    carousel.scrollLeft = startScrollLeft - (e.pageX - startX);
}

const dragStop = () => {
    isDragging = false;
    carousel.classList.remove("dragging");
}

const infiniteScroll = () => {
    // If the carousel is at the beginning, scroll to the end
    if(carousel.scrollLeft === 0) {
        carousel.classList.add("no-transition");
        carousel.scrollLeft = carousel.scrollWidth - (2 * carousel.offsetWidth);
        carousel.classList.remove("no-transition");
    }
    // If the carousel is at the end, scroll to the beginning
    else if(Math.ceil(carousel.scrollLeft) === carousel.scrollWidth - carousel.offsetWidth) {
        carousel.classList.add("no-transition");
        carousel.scrollLeft = carousel.offsetWidth;
        carousel.classList.remove("no-transition");
    }

    // Clear existing timeout & start autoplay if mouse is not hovering over carousel
    clearTimeout(timeoutId);
    if(!wrapper.matches(":hover")) autoPlay();
}

		const autoPlay = () => {
		    if(window.innerWidth < 800 || !isAutoPlay) return; // Return if window is smaller than 800 or isAutoPlay is false
		    // Autoplay the carousel after every 2500 ms
		    timeoutId = setTimeout(() => carousel.scrollLeft += firstCardWidth, 2500);
		}
		autoPlay();
		
		carousel.addEventListener("mousedown", dragStart);
		carousel.addEventListener("mousemove", dragging);
		document.addEventListener("mouseup", dragStop);
		carousel.addEventListener("scroll", infiniteScroll);
		wrapper.addEventListener("mouseenter", () => clearTimeout(timeoutId));
		wrapper.addEventListener("mouseleave", autoPlay);

    </script>
</body>
</html>