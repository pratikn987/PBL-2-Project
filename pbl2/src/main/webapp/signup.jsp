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

            <div class="showcase-content1">
                <div class="formm">
                    <form action="signup" method="post"  >
                        <h1>Sign Up</h1>
                        <div class="info">
                            <input class="email" type="text" placeholder="Name" name="uName" required > <br>
                            <input class="email" type="text" placeholder="Username" name="userName" required> <br>
                            <input class="email" type="email" placeholder="Email" name="uEmail" required> <br>
                            <input class="email" type="number" placeholder="Mobile No" name="Umobile" required> <br>
                            <input class="email" type="password" placeholder="Password" name="password" required>
                            <input class="email" type="password" placeholder="Confirm Password" name="conf-pass" required>
                        </div>
                        <div class="btn">
                            <button class="btn-primary" type="submit">Create Account</button>
                        </div>
                    </form>
    
                </div>
                <div class="signin">
                    <p>Already have a account</p>
                    <a href="signin.jsp">Sign In</a>
                </div>
            </div>
    </header>


</body>
</html>


