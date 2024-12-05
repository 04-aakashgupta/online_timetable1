<%-- 
    Document   : timetable
    Created on : 25-Jan-2024, 9:25:27 pm
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="login_check_server.jsp" %>
<%
    if (session.getAttribute("email") != null) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tracker Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="global.css" rel="stylesheet" />


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="tracker">
            <h3 class="h3 ps-3 pt-3 fs-2 mt-3">Track Teachers Lecture</h3>

            <div class="container-fluid text-center">
                <div class="row">

                    <div class="overflow-x-scroll   p-0 m-0 ms-5 mt-5 col-sm-12 col-md-9 col-lg-8   ">
                       
                        <h4 class="h4 text-center text-secondary fs-3">01/01/24 To 07/01/24</h4>
                        <table class="table mt-1 border border-5 text-center table-hover  mb-0 pb-0 border-bottom-0 ">
                            <thead class="table-info border border-2">
                                <tr>
                                    <th class="fw-bolder text-secondary">Teacher</th>
                                    <th class="text-danger fw-bolder">Extra</th>

                                    <th class="text-danger fw-bolder">Leave</th>
                                    <th class="text-danger fw-bolder">Set Theory</th>
                                    <th class="text-danger fw-bolder">Take Theory</th>
                                    <th class="text-danger fw-bolder">Set Practical</th>
                                    <th class="text-danger fw-bolder">Take Practical</th>
                                    <th class="text-danger fw-bolder">Set</th>
                                    <th class="text-danger fw-bolder">Take</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="table-light">
                                    <td class="table-secondary border border-info-subtle border-2 fw-bolder text-success">OM</td>
                                    <td><p class="fw-medium text-secondary">4</p></td>
                                    <td><p class="fw-medium text-secondary">4</p></td>
                                    <td><p class="fw-medium text-secondary">4</p></td>
                                    <td><p class="fw-medium text-secondary">4</p></td>
                                    <td><p class="fw-medium text-secondary">4</p></td>
                                    <td><p class="fw-medium text-secondary">4</p></td>
                                    <td><p class="fw-medium text-secondary">4</p></td>
                                    <td><p class="fw-medium text-secondary">4</p></td>
                                </tr>
                                <tr class="table-light">

                                    <td class="table-secondary border border-info-subtle border-2 fw-bolder text-success">NY</td>
                                    <td><p class="fw-medium text-secondary">4</p></td>
                                    <td><p class="fw-medium text-secondary">4</p></td>
                                    <td><p class="fw-medium text-secondary">4</p></td>
                                    <td><p class="fw-medium text-secondary">4</p></td>
                                    <td><p class="fw-medium text-secondary">4</p></td>
                                    <td><p class="fw-medium text-secondary">4</p></td>
                                    <td><p class="fw-medium text-secondary">4</p></td>
                                    <td><p class="fw-medium text-secondary">4</p></td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
            </div>
    

    </body>
</html>

<%
    
    }
    %>