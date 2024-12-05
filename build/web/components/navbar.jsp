<%@page contentType="text/html" pageEncoding="UTF-8"  %>

<%
    if (session.getAttribute("email") != null) {
        String redirect = null;
        String email = session.getAttribute("email").toString();
        String password = session.getAttribute("password").toString();
        String branch = session.getAttribute("branch").toString().toUpperCase();
        String name = session.getAttribute("name").toString();
        name = name.substring(0, 1).toUpperCase() + name.substring(1).toLowerCase();
        String s_user_type = session.getAttribute("s_user_type").toString();
        s_user_type = s_user_type.substring(0, 1).toUpperCase() + s_user_type.substring(1).toLowerCase();
        String year = session.getAttribute("year").toString().toUpperCase();

%>

<div class="nav" >
    <nav class="bg-white fixed-top navbar border border-light-subtle border-end-0 mb-5 ">
        <div class="offcanvas-header p-2 ps-3 pb-0 justify-content-start" style="width: 100%;">
            <button class="navbar-toggler py-1 px-2" type="button" data-bs-toggle="offcanvas"
                    data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                <span class="icon"><i class="fa-solid fa-bars"></i></span>
            </button>
            <div>
                <img src="logo.jpeg" width="52" height="52" class="img-fluid ms-3" alt="college logo" >

            </div>



            <%@include file="loggedIn_Logo.jsp" %>


        </div>
    </nav>

    <div class="offcanvas offcanvas-start rounded-end rounded-top" id="offcanvasNavbar"
         aria-labelledby="offcanvasNavbarLabel" style="margin-top: 67px; width: 300px;">
        <div class="offcanvas-body border border-dark-subtle rounded-end rounded-top bg-light-subtle fw-medium">
            <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                <li class="nav-item">
                    <a class="nav-link link-dark" href="home.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link link-dark" href="timetable.jsp">TimeTable</a>
                </li>
                <% if (s_user_type.equals("Admin")) {


                %>
                <li class="nav-item">
                    <a class="nav-link link-dark" href="handle_users.jsp">Handle Users</a>
                </li>
                <%                    }
                %>
            </ul>
        </div>
    </div>

    <div class="offcanvas offcanvas-end border border-3  border-light-subtle   bg-white p-0    me-1  bg-lite rounded-4" tabindex="-1" id="offcanvasRight"
         aria-labelledby="offcanvasRightLabel border-0" style="margin-top:70px">
        <div class="text-end m-3">
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                    aria-label="Close"></button>
        </div>
        <div class="offcanvas-body p-0 m-0    ">

            <div class="card  rounded-4  border-3  border-secondary-subtle d-flex flex-column  m-2">
                <div class="d-flex flex-column justify-content-end align-items-center">
                    <span><i class="fa-solid fa-user fa-2xl mt-5" style="font-size:65px;"></i></span>
                    <h5 class="card-title mt-"></h5>
                </div>

                <div class="profile mt-5 ">
                    <h5 class="card-subtitle bg-dark  text-center  text-white">Profile</h5>
                </div>                         

                <div class="m-2  d-flex justify-content-around border-0">



                    <ul class="list-group list-group-flush d-flex flex-column">
                        <li class="list-group-item border-0"><label class="text-primary"
                                                                    >Name</label>
                        </li>
                        <li class="list-group-item border-0"><label class="text-primary"
                                                                    >Branch</label>
                        </li>
                        <li class="list-group-item border-0"><label class="text-primary"
                                                                    >User Type</label>
                        </li>

                        <% if (s_user_type.equals("Student")) {


                        %>
                        <li class="list-group-item border-0"><label class="text-primary"
                                                                    >Year</label>
                        </li>
                        <% }
                        %>

                    </ul>

                    <ul class="list-group list-group-flush d-flex flex-column   ">
                        <li class="list-group-item border-0"><label class="text-success">
                                <%=name%> </label>
                        </li>
                        <li class="list-group-item border-0"><label class="text-success">
                                <%=branch%> </label>
                        </li>
                        <li class="list-group-item border-0"><label class="text-success"
                                                                    ><%= s_user_type%></label>
                        </li>

                        <% if (s_user_type.equals("Student")) {


                        %>
                        <li class="list-group-item border-0"><label class="text-success"
                                                                    ><%= year%></label>
                        </li>
                        <% }
                        %>
                    </ul>






                </div>

                <div class="profile  ">
                    <h5 class="card-subtitle bg-dark text-center  text-white">Password</h5>
                </div>  
                <a class="btn btn-primary w-50 m-auto mt-2" href="verify_otp.jsp">
                    Change Password</a>
                <div class="m-3  d-flex justify-content-around border-0">







                </div>





            </div>
            <div class="text-center mt-2">
                <a  href="signout_server.jsp" class="btn btn-danger w-50   ">
                    <i class="fa-solid fa-arrow-right-from-bracket fa-xl"></i>
                </a>
            </div>
        </div>
    </div>
</div>
<% }%>