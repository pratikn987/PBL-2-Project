<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            
            <img src="images/profile.jpg" alt="">
        </div>

        <div class="dash-content">
            <form action="addData" method="post">
                <label for="Movie name">Enter Movie Name</label><br>
                <input type="text" name="mName" id=""> <br><br>

                <label for="Movie name">Enter Release Date</label><br>
                <input type="date" name="mDate" id=""> <br><br>

                <label for="Movie name">Poster Image URL</label><br>
                <input type="text" name="mImgURL" id=""> <br><br>

                <label for="Movie name">Trailer Link</label><br>
                <input type="text" name="mTrailerURL" id=""> <br><br>

                <label for="Movie name">Movie Description</label><br>
                <textarea  name="mDescription" rows="4" cols="50"></textarea><br><br>

                <label for="Movie name">Movie Background Image</label><br>
                <input type="text" name="mbackImage" id=""> <br><br>

                <label for="Movie name">Time</label><br>
                <input type="text" name="mMovieTime" id=""> <br><br>

                <label for="Movie name">status</label><br>
                <input type="text" name="mStatus" id=""> <br><br>

                <input type="Submit" value="Add Movie">
            </form>
        </div>
    </section>

    <script src="js/admin.js"></script>
</body>
</html>