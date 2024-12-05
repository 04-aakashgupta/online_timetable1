   







<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>





<div class="tt_wed mt-0 pt-0">
    <div class=" col-xl-7 col-lg-7 col-md-10 col-sm-12  col-12  text-center mx-auto mt-2  mb-5  ">
        <h1 class="h1 text-center">${sessionScope.classname.toUpperCase()  }</h1>
        <table class="table table-bordered table-hover border border-3   border-black ">
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

                    String user = "root";
                    String pass = "12345678";
                    String tablename = session.getAttribute("tablename").toString();
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

                    try {

                        Class.forName("com.mysql.cj.jdbc.Driver");
                        url = "jdbc:mysql://localhost:3306/tt_" + branch + "_wed";
                        conn = DriverManager.getConnection(url, user, pass);

                        sql = "SELECT * FROM " + tablename;
                        statement = conn.prepareStatement(sql);

                        result = statement.executeQuery();

                        while (result.next()) {
                            sr_no = result.getString(1);
                            time = result.getString(2);
                            room_no = result.getString(3);
                            lecture = result.getString(4);
                            adjust = result.getString(5);


                %>


                <tr class="table-light">
                    <th scope="row"><%=sr_no%></th>
                    <td><%= time%></td>
                    <td><%= room_no%></td>

                    <td><%= lecture%></td>
                <td><%= adjust%></td>

                </tr>


                <%

                    }
                %>


            </tbody>
        </table>
        <jsp:include  page="timetable_edit_option.jsp" >
            <jsp:param name='todaytablename' value='<%=tablename%>'   />
            <jsp:param name='edittableclassname' value='<%=session.getAttribute("classname")%>'   />
        </jsp:include >
    </div>
</div>  






<%  } catch (Exception e) {
        out.print(e);
    } finally {
        try {
            result.close();
            statement.close();
            conn.close();

        } catch (Exception e) {
            out.print(e);

        }

    }


%>   





