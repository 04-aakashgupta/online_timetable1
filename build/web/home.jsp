
<%@page contentType="text/html" pageEncoding="UTF-8"  %>
<%@include  file="login_check_server.jsp" %>

<%    if (session.getAttribute("email") != null) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="global.css" rel="stylesheet" />


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <style>






        </style>
    </head>
    <body class="p-0 m-0">

        <%@include  file="components/navbar.jsp" %>


        <div style="margin-top:7%;">

        </div>

        <div  class="welcome" style="text-align: center" >

            <h1> Welcome,<%=  session.getAttribute("name").toString().toUpperCase()%></h1>


        </div>

        <div class="desription mx-auto  w-50  mt-5">
            <div class="desription1" ><h5>Greetings, students and faculty members! We are thrilled to introduce you to our cutting-edge online timetable platform tailored specifically for college life.

                    In the bustling environment of higher education, time management is key to success.</h5></div>  


            <div class=  "desription2 mt-4"><h5> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Our platform is designed to be your ultimate scheduling companion, offering a user-friendly interface and a plethora of features to help you navigate through your college journey with ease.

                    Here admins can update the timetable of their particular stream accordingly with just one click and it will be automatically visible to students without any hassle of sharing the updated handwritten timetable picture on every whatsapp group.

                </h5>
            </div>

            <div class="d-flex w-100 justify-content-evenly" style="margin-top:20% " >
                <div  ><a href="https://pcacsmis.pillai.edu.in/studentinfosys/studentportal/studinfo_studlogin.aspx">           <img src="attendence.png" alt="Student Information Portal" width="40" /></a></div>

                <div  ><a href="https://www.instagram.com/pillaiscollege/?hl=en"><img src="square-instagram.jpg"  alt="Instagram" width="30">  </a></div>

                <div  ><a href="https://www.facebook.com/pillaicollege/">    <img src="square-facebook.jpg" alt="Facebook"  width="30"  /> </a></div>
                <div  ><a href="https://www.pce.ac.in/">    <img src="info.png" alt="info"  width="30"  /> </a></div>
            </div>




    </body>
</html>

<% }

%>