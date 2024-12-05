<%@page import="java.time.LocalDate"%>
<%@page import="java.time.DayOfWeek"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="login_check_server.jsp" %>
<%    if (session.getAttribute("email") != null) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("s_user_type").equals("admin")) {
%> 


<!DOCTYPE html>     
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Handle Users</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="global.css" rel="stylesheet" />


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script>



            document.addEventListener("DOMContentLoaded", function ()
            {
                const handle_users = document.querySelector('.handle_users');





                const actions = document.querySelectorAll('.action');



                const selectDropdown = document.getElementById("selectaction");
                const optionAllaction = document.createElement("option");
                optionAllaction.value = "All Action";
                optionAllaction.textContent = "All Action";
                selectDropdown.appendChild(optionAllaction);

                // Loop through each tt_tue element

                // Loop through each tt_tue element

                var allactions = [];
                actions.forEach(function (element)
                {
                    // Get the inner text of the h1 element
                    const actionName = element.querySelector("h1").innerText;
                    // Create a new option element
                    const option = document.createElement("option");
                    // Set the value of the option to the class name
                    option.value = actionName;
                    // Set the text content of the option to the class name
                    option.textContent = actionName;
                    // Append the option to the select dropdown
                    selectDropdown.appendChild(option);
                    allactions.push(element);
                });






                var selectAction = document.querySelector('.select_action');
                // Add event listener to the select dropdown
                selectDropdown.addEventListener("change", function ()
                {
                    // Get the selected option value
                    const selectedAction = this.value;
                    actions.forEach(function (action)
                    {
                        // Get the inner text of the h1 element
                        const classAction = action.querySelector("h1").innerText;
                        if (classAction === selectedAction)
                        {

                            handle_users.innerHTML = '';
                            handle_users.appendChild(selectAction);
                            handle_users.appendChild(action);
                        } else if (selectedAction === "All Action")
                        {

                            handle_users.innerHTML = '';
                            handle_users.appendChild(selectAction);

                            allactions.forEach(function (action)
                            {
                                handle_users.appendChild(action);
                            });

                        }
                    });
                });





            });

        </script>
    </head>
    <body class="p-0 m-0">
        <%@include  file="components/navbar.jsp" %>
        <div  style="margin-top:7%"></div>
        <div class="handle_users   pt-0" >



            <jsp:include page="components/select_action.jsp"  />

            <jsp:include page="components/add_update_student.jsp"  />
            <hr>
            <jsp:include page="components/add_update_teacher.jsp"  />
            <hr>
            <jsp:include page="components/search_student.jsp"  />
            <hr>
            <jsp:include page="components/search_teacher.jsp"  />
            <hr>
            <jsp:include page="components/view_all_student_button.jsp"  />
            <hr>
            <jsp:include page="components/view_all_teacher_button.jsp"  />





        </div>
    </body>
</html>
<%
        } else {
            response.sendRedirect("home.jsp");
        }
    }
%>