<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login | DevOps Demo</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#4facfe,#00f2fe);
}

.login-box{
    width:360px;
    background:#fff;
    padding:40px;
    border-radius:15px;
    box-shadow:0 15px 35px rgba(0,0,0,0.25);
}

.login-box h2{
    text-align:center;
    color:#333;
    margin-bottom:30px;
}

.input-group{
    margin-bottom:20px;
}

.input-group label{
    display:block;
    margin-bottom:8px;
    color:#555;
    font-weight:bold;
}

.input-group input{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
    outline:none;
    transition:.3s;
}

.input-group input:focus{
    border-color:#4facfe;
    box-shadow:0 0 8px rgba(79,172,254,.4);
}

.login-btn{
    width:100%;
    padding:12px;
    border:none;
    border-radius:8px;
    background:#4facfe;
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:.3s;
}

.login-btn:hover{
    background:#008cff;
}

.footer{
    text-align:center;
    margin-top:20px;
    color:#777;
    font-size:14px;
}
</style>

</head>

<body>

<div class="login-box">

    <h2>DevOps Login</h2>

    <form action="login" method="post">

        <div class="input-group">
            <label>Username</label>
            <input type="text" name="username" placeholder="Enter Username" required>
        </div>

        <div class="input-group">
            <label>Password</label>
            <input type="password" name="password" placeholder="Enter Password" required>
        </div>

        <button class="login-btn" type="submit">
            Login
        </button>

    </form>

    <div class="footer">
        Jenkins • Maven • SonarQube • Nexus • Tomcat
    </div>

</div>

</body>
</html>
