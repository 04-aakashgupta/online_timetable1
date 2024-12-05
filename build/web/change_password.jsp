
<%@page contentType="text/html"  pageEncoding="UTF-8" %>
<%@include  file="login_check_server.jsp" %>

<% String error_and_msg = "";
    if (session.getAttribute("email") != null)
    {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

        if (session.getAttribute("error_and_msg") != null) 
        {

            error_and_msg = session.getAttribute("error_and_msg").toString();

        }
        session.setAttribute("error_and_msg", null);

%>


<!DOCTYPE html>
<html lang="en"><head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Passoword Change Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer">
        <link href="global.css" rel="stylesheet">

        <link href="change_password.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>


    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="change_password">
            <div class="change_password_page">
                <h4 class="text-center text-danger"> <%=error_and_msg%></h4>
                <div class="form">
                    <form class="change_password_form d-flex flex-column" action="change_password_server.jsp" method="POST">

                        <input type="password" placeholder="Old Password" name="old_password"  pattern=".{3,15}" class="fs-6" title="Minimum 8  Maximum 15 Password" required="">
                        <input type="password" placeholder="New Password" name="new_password" pattern=".{8,15}" title="Minimum 8  Maximum 15 Password" class="fs-6" required="">
                        <input type="password" placeholder="Re-Enter New Password" name="new_re_e_password" title="Minimum 8  Maximum 15 Password" pattern=".{8,15}" class="fs-6" required="">
                        <button type="submit" name="save" class="fs-6">Save</button>
                    </form>
                </div>
            </div>
        </div>


    </body></html>

<%

    }
%>