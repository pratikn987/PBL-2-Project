<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />
<link rel="stylesheet" href="css/login.css">
<title>BookMyCinema</title>
</head>
<body>
    <header class="showcase">
        

            <div class="logo">
               <h2 style="padding:30px">BookMyCinema</h2>
            </div>

            <div class="showcase-content">
                <div class="formm">
                    <form method="post" action="signin">
                        <h1>Sign In</h1>
                        <div class="info">
                            
                            <input class="email" type="text" placeholder="Username" name="userName"> <br>
                            <input class="email" type="password" placeholder="Password" name="password">
                        </div>
                        <div class="btn">
                            <button class="btn-primary" type="submit">Sign In</button>
                        </div>
                    </form>
    
                </div>
                <div class="signup">
                    <p>New to BookMyCinemas ?</p>
                    <a href="signup.jsp">Sign up now</a>
                </div>
            </div>
    </header>


</body>
</html>


