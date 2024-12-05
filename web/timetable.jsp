<%@page import="java.time.LocalDate"%>
<%@page import="java.time.DayOfWeek"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="login_check_server.jsp" %>
<%    if (session.getAttribute("email") != null) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

%> 

<% String currentDayOfWeek_short = LocalDate.now().getDayOfWeek().toString().substring(0, 3).toLowerCase();
%>
<!DOCTYPE html>     
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Timetable Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="global.css" rel="stylesheet" />


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script>



            document.addEventListener("DOMContentLoaded", function ()
            {
                const timetable = document.querySelector('.timetable');


                if (timetable.querySelector('.msg') === null)
                {


                    const ttTable = document.querySelectorAll('.tt_' + '<%= currentDayOfWeek_short%>');
                    const selectDropdown = document.getElementById("selectday");
                    const optionAllClass = document.createElement("option");
                    optionAllClass.value = "ALL";
                    optionAllClass.textContent = "ALL";
                    selectDropdown.appendChild(optionAllClass);

                    // Loop through each tt_tue element
                    ttTable.forEach(function (element)
                    {
                        // Get the inner text of the h1 element
                        const className = element.querySelector("h1").innerText;
                        // Create a new option element
                        const option = document.createElement("option");
                        // Set the value of the option to the class name
                        option.value = className;
                        // Set the text content of the option to the class name
                        option.textContent = className;
                        // Append the option to the select dropdown
                        selectDropdown.appendChild(option);
                    });

                    var tables = document.querySelectorAll('.table');
                    var userTables = [];
                    var otherTables = [];

                    tables.forEach(function (table)
                    {
                        var rows = table.querySelectorAll('tbody tr');
                        var hasUser = false;

                        rows.forEach(function (row) {
                            var lecture = row.querySelector('td:nth-child(4)').textContent.trim();
                            if (lecture === "<%= session.getAttribute("name").toString().toUpperCase()%>")
                            {
                                hasUser = true;
                            }
                        });

                        if (hasUser) {
                            userTables.push(table.closest('.tt_' + '<%= currentDayOfWeek_short%>'));
                        } else {
                            otherTables.push(table.closest('.tt_' + '<%= currentDayOfWeek_short%>'));
                        }
                    });

                    // Clear the parent container
                    var timetableContainer = document.querySelector('.timetable');
                    var selectClass = document.querySelector('.select_class');
                    timetableContainer.innerHTML = '';
                    // Append selectClass 
                    timetableContainer.appendChild(selectClass);
                    // Append user tables first
                    userTables.forEach(function (table)
                    {
                        timetableContainer.appendChild(table);
                    });
                    // Append other tables afterwards
                    otherTables.forEach(function (table)
                    {
                        timetableContainer.appendChild(table);
                    });

                    // Add event listener to the select dropdown
                    selectDropdown.addEventListener("change", function ()
                    {
                        // Get the selected option value
                        const selectedClass = this.value;
                        ttTable.forEach(function (table)
                        {
                            // Get the inner text of the h1 element
                            const className = table.querySelector("h1").innerText;
                            if (className === selectedClass)
                            {

                                timetableContainer.innerHTML = '';
                                timetableContainer.appendChild(selectClass);
                                timetableContainer.appendChild(table);
                            } else if (selectedClass === "ALL")
                            {

                                timetableContainer.innerHTML = '';
                                timetableContainer.appendChild(selectClass);
                                // Append user tables first
                                userTables.forEach(function (table)
                                {
                                    timetableContainer.appendChild(table);
                                });
                                // Append other tables afterwards
                                otherTables.forEach(function (table)
                                {
                                    timetableContainer.appendChild(table);
                                });
                            }
                        });
                    });



                } else
                {

                    timetable.querySelector('.select_class ').remove();

                }

            });

        </script>

    </head>
    <body class="p-0 m-0">
        <%@include  file="components/navbar.jsp" %>
        <div  style="margin-top:7%"></div>
        <div class="timetable  mt-0 pt-0" >



            <jsp:include page="components/select_class.jsp"  />
            <jsp:include page="components/ttseter.jsp" />


        </div>
    </body>
</html>
<%}
%>