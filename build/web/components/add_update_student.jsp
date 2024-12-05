   
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<% String error_and_msg_student_add_update = "";
    if (session.getAttribute("error_and_msg_student_add_update") != null) {
        error_and_msg_student_add_update = session.getAttribute("error_and_msg_student_add_update").toString();
    }
    session.setAttribute("error_and_msg_student_add_update", null);
%>


<div class="action">
<div class="add_update_student ">



    <div class=" col-xl-5 col-lg-5 col-md-10 col-sm-12  col-12  text-center mx-auto mt-2  mb-5  ">
        <h1 class="h1 text-center  text-dark">Add Update Student</h1>
        <h3 ><%= error_and_msg_student_add_update %></h3>
        <form action="add_update_student_server.jsp" method="post">
            <table class="table table-bordered table-hover  border border-5   border-secondary   ">



                <tbody>


                    <tr class="table-light"  >
                        <th scope="col"   class="table-secondary">Name</th>
                        <td scope="col" ><input type="text"  class="w-100  form-control" name="name"   pattern="[a-zA-Z]+" title=" Enter  Valid Name" required></td>


                    </tr>


                    <tr class="table-light">
                        <th scope="col"  class="table-secondary">Email</th>
                        <td><input type="email" name="email"  class="w-100  form-control"  required  title=" Enter  Valid Email"></td>
                    </tr>


                    <tr class="table-light">


                        <th scope="col"  class="table-secondary">Password</th>
                        <td><input type="password" name="password" pattern=".{8,15}" class="w-100  form-control"  title="Password length Maximum 15 and  Minimum 8" required></td>

                    </tr>


                    <tr class="table-light">


                        <th scope="col"  class="table-secondary">Year</th>
                        <td><input type="text" name="year"  pattern="[a-zA-Z]{2}" class="w-100  form-control"  title="Enter Valid Year"  ></td>

                    </tr>


                    <tr class="table-light">


                        <th colspan="2"  class="table-seconadry">
                            <input type="submit" class="btn btn-primary w-50" name="Add" value="Add" /> </th>

                    </tr>



                    <tr class="table-light">


                        <th colspan="2"  class="table-seconadry">
                            <input type="submit" class="btn btn-primary w-50" name="Update" value="Update" /> </th>

                    </tr>
                </tbody>


            </table>

        </form>
    </div>
</div>  

</div>