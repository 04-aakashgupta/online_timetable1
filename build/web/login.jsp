
<%@page contentType="text/html"  pageEncoding="UTF-8" %>
<%@include  file="login_check_server.jsp" %>

<% String error = "";
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if (session.getAttribute("error") != null) {
        error = session.getAttribute("error").toString();

    }
    session.setAttribute("error", null);
%>


<!DOCTYPE html>
<html lang="en"><head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer">
        <link href="global.css" rel="stylesheet">
        <link href="login.css" rel="stylesheet">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    

    </head>
    <body  >
        <%@include file="components/navbar.jsp" %>
        <div class="login">

            <div class="login-page">
                <h2 class="text-center mb-4  ">LOGIN PAGE</h2>
                <h4 class="text-center text-danger"> <%=error%></h4>
                <div class="form">
                    <form class="login-form d-flex flex-column" action="login_server.jsp" method="POST">
                        <input type="email" placeholder="Email" name="email" required="">
                        <input type="text" placeholder="Branch" name="branch" required="">
                        <input type="password" placeholder="Password" name="password" class="fs-6" required="">
                        <button type="submit" class="fs-6">Login</button>
                    </form>
                </div>
            </div>
        </div>


    </body></html>