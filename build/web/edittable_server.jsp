

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.sql.*"%>

<%

    branch = session.getAttribute("branch").toString();
    r = request;

    if (session.getAttribute("email") != null) {

        if (request.getParameter("savett") != null) {
            classname = session.getAttribute("classname").toString();
            edit_table_date_day = session.getAttribute("edit_table_date_day").toString();
            edit_table_day_inshort = session.getAttribute("edit_table_day_inshort").toString();
            today_table_name = session.getAttribute("today_table_name").toString();
            edit_table_name = session.getAttribute("edit_table_name").toString();
            edit_table_date = session.getAttribute("edit_table_date").toString();

            if (edit_table_data(out)) {

                application.setAttribute("saved" + edit_table_name, edit_table_date);

            }

        }

        if (request.getParameter("Edit") != null) {
            classname = request.getParameter("edittableclassname").toUpperCase();
            edit_table_date_day = request.getParameter("edit_table_date_day").toUpperCase();
            edit_table_day_inshort = edit_table_date_day.substring(12, 15).toLowerCase();
            today_table_name = request.getParameter("todaytablename");
            edit_table_name = "edit_" + edit_table_day_inshort + today_table_name.substring(8);
            edit_table_date = edit_table_date_day.substring(0, 10);

            session.setAttribute("classname", classname);
            session.setAttribute("edit_table_date_day", edit_table_date_day);
            session.setAttribute("edit_table_day_inshort", edit_table_day_inshort);
            session.setAttribute("today_table_name", today_table_name);
            session.setAttribute("edit_table_name", edit_table_name);
            session.setAttribute("edit_table_date", edit_table_date);

        }

    }
    response.sendRedirect("edittable.jsp");

%>

<%!
    String classname = "";
    String edit_table_date_day = "";
    String edit_table_day_inshort = "";
    String today_table_name = "";
    String edit_table_name = "";
    String edit_table_date = "";

    String branch = "";
    HttpServletRequest r = null;
    String user = "root";
    String pass = "12345678";

    boolean valid = false;

    Connection conn = null;
    String url = null;
    PreparedStatement statement = null;
    String sql = null;

    ResultSet result = null;
    int count = 0;

    boolean edit_table_data(JspWriter out) {

        valid = false;
        count = 0;

        String[] html_column_names = {"edit_time_", "edit_roomno_", "edit_adjust_"};
        String html_column_value = "";
        String[] sql_column_name = {"TIME", "ROOM", "ADJ"};

        try {

            for (int i = 1; i <= 6; i++) {

                for (int j = 0; j <= 2; j++) {

                    if (r.getParameter(html_column_names[j] + i) != null) {

                        html_column_value = r.getParameter(html_column_names[j] + i);

                        try {

                            Class.forName("com.mysql.cj.jdbc.Driver");
                            url = "jdbc:mysql://localhost:3306/tt_" + branch + "_" + edit_table_day_inshort;

                            conn = DriverManager.getConnection(url, user, pass);

                            sql = "update " + edit_table_name + " set " + sql_column_name[j].toLowerCase() + "= ?  where SR_NO=?";
                            statement = conn.prepareStatement(sql);

                            statement.setString(1, html_column_value.toUpperCase());
                            statement.setInt(2, i);
                            count = statement.executeUpdate();

                            if (count > 0) {

                                valid = true;
                            }

                        } catch (Exception e) {

                        } finally {
                            try {
                                result.close();
                                statement.close();
                                conn.close();

                            } catch (Exception e) {

                            }
                        }
                    }

                }

            }

        } catch (Exception e) {

        }
        return valid;
    }

%>