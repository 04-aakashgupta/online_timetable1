

<%@page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*"  %>
<%
    String error_and_msg_search_teacher = "";

    if (session.getAttribute("email") != null) {
        session.setAttribute("error_and_msg_search_teacher", null);
        if (request.getParameter("search") != null) {

            s_user_type = "teacher";
            branch = session.getAttribute("branch").toString().toUpperCase();

            email = request.getParameter("email").trim();
            if (check_already_exist()) {
                if (search_teacher(out)) {
                    session.setAttribute("teacher_search", "true");
                    session.setAttribute("s_name", name);
                    session.setAttribute("s_email", email);
                    session.setAttribute("s_password", password);
                    session.setAttribute("s_year", year);
                    session.setAttribute("s_branch", branch);
                    session.setAttribute("s_s_user_type", s_user_type);
                } else {
                    error_and_msg_search_teacher = "Server Issue";
                }

            } else {
                error_and_msg_search_teacher = "Teacher  Not Exist";
            }

        }
    } else {
        redirect = "login.jsp";
    }
    out.print(error_and_msg_search_teacher);

    session.setAttribute("error_and_msg_search_teacher", error_and_msg_search_teacher);
    response.sendRedirect(redirect);
%>


<%!
    String redirect = "handle_users.jsp";
    String email = "";
    String password = "";
    int user_id = 1;
    String name = "";
    String branch = "";
    String user_type = "";
    String s_user_type = "";
    String year = "";
    int user_code = 0;

    String user = "root";
    String pass = "12345678";

    boolean valid = false;

    Connection conn = null;
    String url = null;
    PreparedStatement statement = null;
    String sql = null;

    ResultSet result = null;

    public boolean search_teacher(JspWriter out) {
        valid = false;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            url = "jdbc:mysql://localhost:3306/tt_user";

            conn = DriverManager.getConnection(url, user, pass);

            sql = "SELECT * FROM user_data WHERE email=?  AND branch=?  AND  s_user_type=?  ";
            statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, branch);
            statement.setString(3, s_user_type);

            result = statement.executeQuery();

            while (result.next()) {

                user_id = result.getInt(1);
                email = result.getString(2);
                name = result.getString(3);
                name = name.substring(0, 1).toUpperCase() + name.substring(1).toLowerCase();
                branch = result.getString(4);
                user_type = result.getString(5);
                s_user_type = result.getString(6);
                year = result.getString(7);

                valid = true;

            }

        } catch (Exception e) {
            out.print(e);

        } finally {
            try {
                result.close();
                statement.close();
                conn.close();

            } catch (Exception e) {

            }

            return valid;
        }

    }

    public boolean check_already_exist() {
        valid = false;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            url = "jdbc:mysql://localhost:3306/tt_user";
            conn = DriverManager.getConnection(url, user, pass);

            sql = "SELECT * FROM uesr_credentials WHERE email=? ";
            statement = conn.prepareStatement(sql);
            statement.setString(1, email.toUpperCase());

            result = statement.executeQuery();

            if (result.next()) {

                valid = true;
                password = result.getString(2);
            }
        } catch (Exception e) {

        } finally {
            try {
                result.close();
                statement.close();
                conn.close();

            } catch (Exception e) {

            }

            return valid;
        }

    }

%>