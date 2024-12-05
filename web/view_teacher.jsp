
<%@page contentType="text/html"  import="java.sql.*"  %>
<%@include  file="login_check_server.jsp" %>

<%    if (session.getAttribute("email") != null) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View All Teacher</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="global.css" rel="stylesheet" />


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    </head>
    <body class="p-0 m-0  " >
        <%@include  file="components/navbar.jsp" %>
        <div  style="margin-top:7%"></div>
        <%
            
            int v_count = 0;

            String v_email = "";
            String v_password = "";
            int v_user_id = 1;
            String v_name = "";
            String v_branch = "";
            String v_user_type = "";
            String v_s_user_type = "";
            String v_year = "";
            int v_user_code = 0;

            if (session.getAttribute("s_user_type").toString().equals("admin")) {

                if (request.getParameter("view") != null) {

                    v_branch = session.getAttribute("branch").toString();


        %>







        <div class=" col-xl-7 col-lg-7 col-md-10 col-sm-12  col-12  text-center mx-auto mt-2  mb-5  ">
            <h1 class="h1 text-center text-success"  > All <%= v_branch.toUpperCase()%> Teacher </h1>
            <table class="table table-bordered table-hover  border border-5   border-secondary ">
                <thead>
                    <tr class="table-secondary">
                        <th scope="col">Sr No</th>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>

                        <th scope="col">Password</th>
                        <th scope="col">Year</th>
                        <th scope="col">Branch</th>
                        <th scope="col">User Type</th>
                    </tr>
                </thead>

                <tbody>

                    <%  String user1 = "root";
                        String pass = "12345678";

                        String branch = session.getAttribute("branch").toString();

                        Connection conn = null;
                        String url = null;
                        PreparedStatement statement = null;
                        String sql = null;

                        ResultSet result = null;
                        ResultSet result1 = null;

                        try {

                            Class.forName("com.mysql.cj.jdbc.Driver");
                            url = "jdbc:mysql://localhost:3306/tt_user";
                            conn = DriverManager.getConnection(url, user1, pass);

                            sql = "SELECT * FROM " + "user_data  where  branch=?  AND s_user_type=?";
                            statement = conn.prepareStatement(sql);

                            statement.setString(1, v_branch);
                            statement.setString(2, "Teacher");

                            result = statement.executeQuery();

                            while (result.next()) {
                                v_count++;
                                v_user_id = result.getInt(1);
                                v_email = result.getString(2);
                                v_name = result.getString(3);
                                v_name = v_name.substring(0, 1).toUpperCase() + v_name.substring(1).toLowerCase();
                                v_branch = result.getString(4);
                                v_user_type = result.getString(5);
                                v_s_user_type = result.getString(6);
                                v_year = result.getString(7);

                                sql = "SELECT * FROM " + "uesr_credentials  where  email=?";
                                statement = conn.prepareStatement(sql);

                                statement.setString(1, v_email);
                                result1 = statement.executeQuery();
                                while (result1.next()) {

                                    v_password = result1.getString(2);
                                }


                    %>


                    <tr class="table-light">
                        <th scope="row"><%=v_count%></th>
                        <td><%= v_name%></td>
                        <td><%= v_email%></td>

                        <td><%= v_password%></td>

                        <td><%= v_year%></td>
                        <td><%= v_branch%></td>
                        <td><%= v_s_user_type%></td>

                    </tr>


                    <%

                        }
                    %>


                </tbody>
            </table>

        </div>







        <%  } catch (Exception e) {
                           
                        } finally {
                            try {
                                result.close();
                                statement.close();
                                conn.close();

                            } catch (Exception e) {
                                out.print(e);

                            }

                        }

                    }
                }
            }
        %>





