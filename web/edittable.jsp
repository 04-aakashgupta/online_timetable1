
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page  import="java.sql.*"%>
<%@include  file="login_check_server.jsp" %>

<%
    if (session.getAttribute("email") != null) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        
        
        %>
<!DOCTYPE html>     

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Timetable Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
              crossorigin="anonymous" referrerpolicy="no-referrer">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link href="global.css" rel="stylesheet">
        <style>
            .input-field {
                width: 50px;
                /* Adjust as needed */
                height: 20px;
                /* Adjust as needed */
            }

            .time-cell  input,.room-cell input{
                height: 25px;
                width: 80px;
                /* Adjust as needed */
            }
        </style>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var cells = document.querySelectorAll('.time-cell, .room-cell, .adjust-cell');
                cells.forEach(function (cell) {
                    cell.addEventListener('click', function () {
                        if (!cell.querySelector('input')) { // Check if cell doesn't already contain an input field
                            var input;
                            if (cell.classList.contains('time-cell')) {
                                input = document.createElement('input');
                                input.setAttribute('type', 'time');
                                input.setAttribute('name', 'edit_time_' + cell.parentElement.rowIndex); // Set name attribute for time
                            } else if (cell.classList.contains('room-cell')) {
                                input = document.createElement('input');
                                input.setAttribute('type', 'text');
                                input.setAttribute('name', 'edit_roomno_' + cell.parentElement.rowIndex); // Set name attribute for room no
                            } else if (cell.classList.contains('adjust-cell')) {
                                input = document.createElement('input');
                                input.setAttribute('type', 'text'); // Adjust to your desired input type
                                input.setAttribute('name', 'edit_adjust_' + cell.parentElement.rowIndex); // Set name attribute for adjust
                            }
                            input.classList.add('input-field'); // Add custom class for styling
                            input.value = cell.innerText;
                            cell.innerHTML = '';
                            cell.appendChild(input);
                            input.focus();
                        }
                    });
                });
            });
        </script>


    </head>
    <body class="p-0 m-0">
        <%@include  file="components/navbar.jsp" %>
        <%
            String database_username = "root";
            String database_pass = "12345678";

            String branch = session.getAttribute("branch").toString();
            String sr_no = "";
            String room_no = "";
            String time = "";
            String lecture = "";
            String adjust = "";

            Connection conn = null;
            String url = null;
            PreparedStatement statement = null;
            String sql = null;

            ResultSet result = null;

            String classname = session.getAttribute("classname").toString();
            String edit_table_date_day = session.getAttribute("edit_table_date_day").toString();
            String edit_table_day_inshort = session.getAttribute("edit_table_day_inshort").toString();
            String today_table_name = session.getAttribute("today_table_name").toString();
            String edit_table_name = session.getAttribute("edit_table_name").toString();


        %>

        <div class="timetable " style="margin-top:100px" >
            <div class="tt_edit ">


                <div class=" col-xl-7 col-lg-7 col-md-10 col-sm-12  col-12  text-center mx-auto mt-2  mb-5  ">

                    <h1 class="h1 text-center d-inline"><%= classname%></h1> <h1 class="d-inline text-danger"><%= "(" + edit_table_date_day + ")"%></h1>

                    <form  action="edittable_server.jsp"  method="get">

                        <table class="table table-bordered table-hover  border border-5   border-secondary ">

                            <thead>
                                <tr class="table-secondary">
                                    <th scope="col">Sr No.</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Room No</th>
                                    <th scope="col">Lecture</th>
                                    <th scope="col">Adjust</th>

                                </tr>
                            </thead>

                            <tbody>

                                <%

                                    try {

                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        url = "jdbc:mysql://localhost:3306/tt_" + branch + "_" + edit_table_day_inshort;
                                        conn = DriverManager.getConnection(url, database_username, database_pass);

                                        sql = "SELECT * FROM " + edit_table_name;
                                        statement = conn.prepareStatement(sql);

                                        result = statement.executeQuery();

                                        while (result.next()) {
                                            sr_no = result.getString(1);
                                            time = result.getString(2).trim().substring(0, 5);
                                            room_no = result.getString(3);
                                            lecture = result.getString(4);
                                            adjust = result.getString(5);


                                %>


                                <tr class="table-light">
                                    <th scope="row"><%=sr_no%></th>
                                    <td class="time-cell"><%= time%></td>
                                    <td class="room-cell"><%= room_no%></td>

                                    <td class="lecture-cell"><%= lecture%></td>                                    
                                    <td class="adjust-cell"><%= adjust%></td>     


                                </tr>


                                <%

                                    }
                                %>


                            </tbody>
                        </table>



                        <input type="submit"  value="Save" name="savett" class="btn  btn-secondary w-25" />
                    </form>





                </div>
            </div>  






            <%
                } catch (Exception e) {
                    out.print(e);
                } finally {
                    try {
                        result.close();
                        statement.close();
                        conn.close();

                    } catch (Exception e) {

                    }
                }

            %>  
        </div>



    </body>

</html>



<%
    }

%>