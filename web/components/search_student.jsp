

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<% String error_and_msg_search_student = "";
    String s_name = "";
    String s_year = "";
    String s_email = "";
    String s_branch = "";
    String s_password = "";
    String s_s_user_type = "";

    if (session.getAttribute("error_and_msg_search_student") != null) {
        error_and_msg_search_student = session.getAttribute("error_and_msg_search_student").toString();
        session.setAttribute("error_and_msg_search_student", null);

    }
    if (session.getAttribute("student_search") != null) {
        s_name = session.getAttribute("s_name").toString();
        s_email = session.getAttribute("s_email").toString();
        s_password = session.getAttribute("s_password").toString();
        s_year = session.getAttribute("s_year").toString();
        s_branch = session.getAttribute("s_branch").toString();
        s_s_user_type = session.getAttribute("s_s_user_type").toString();
        session.setAttribute("student_search", null);

    }


%>

<div class="action">

    <div class="search_student ">



        <div class=" col-xl-5 col-lg-5 col-md-10 col-sm-12  col-12  text-center mx-auto mt-2  mb-5  ">
            <h1 class="h1 text-center  text-dark">Search Student </h1>
            <h4 class="text-danger"><%= error_and_msg_search_student%></h4>
            <form action="search_student_server.jsp" method="post">

                <table class="table  table-hover      border border-3   border-dark   ">



                    <tbody>
                        <tr class="table-light  "  >
                            <th   class="table-info  "><input type="submit"  name="search"  value="Search"  class="btn btn-primary w-75" /></th>
                            <td><input type="email" name="email"  class="w-100 form-control"  required  value='<%= s_email%>' placeholder="Enter Student Email" title=" Enter  Valid Email"  ></td>


                        </tr>


                        <tr class="table-light">
                            <th scope="col"  class="table-secondary">  Name</th>
                            <td><label><%= s_name%></label></td>
                        </tr>


                        <tr class="table-light">


                            <th scope="col"  class="table-secondary">Password</th>
                            <td><label><%= s_password%></label></td>

                        </tr>


                        <tr class="table-light">


                            <th scope="col"  class="table-secondary">Year</th>
                            <td><label><%= s_year%></label></td>

                        </tr>

                        <tr class="table-light">


                            <th scope="col"  class="table-secondary">Branch</th>
                            <td><label><%= s_branch%></label></td>

                        </tr>
                        <tr class="table-light">


                            <th scope="col"  class="table-secondary">User Type</th>
                            <td><label><%=s_s_user_type%></label></td>








                    </tbody>


                </table>

            </form>

        </div>
    </div>
</div>



