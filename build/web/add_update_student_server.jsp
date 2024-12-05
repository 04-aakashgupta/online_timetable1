<%@page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*" %>
<%
    String error_and_msg_student_add_update = "";
    if (session.getAttribute("email") != null) {

        if (request.getParameter("Add") != null) {

            name = request.getParameter("name").toLowerCase().trim();
            email = request.getParameter("email").toLowerCase().trim();

            password = request.getParameter("password").trim();

            year = request.getParameter("year").trim();

            if (check_alredy_exist_not()) {
                out.print(email);
                if (add_credentials(out)) {
                    year = year.toUpperCase();
                    branch = session.getAttribute("branch").toString().toUpperCase();
                    user_type = year + branch + "_" + "Student";
                    s_user_type = "STUDENT";

                    if (add_data(out)) {
                        error_and_msg_student_add_update = "Student Added ";
                        redirect = "handle_users.jsp";
                    } else {
                        error_and_msg_student_add_update = "Server Issue";
                        redirect = "handle_users.jsp";
                    }

                } else {
                    error_and_msg_student_add_update = "Server Issue";
                    redirect = "handle_users.jsp";
                }
            } else {
                error_and_msg_student_add_update = "This Email User Already Exist";
                redirect = "handle_users.jsp";
            }

        }
        if (request.getParameter("Update") != null) {

            name = request.getParameter("name").toLowerCase().trim();
            email = request.getParameter("email").toLowerCase().trim();

            password = request.getParameter("password").trim();

            year = request.getParameter("year").trim();

            if (!check_alredy_exist_not()) {

                if (update_credentials(out)) {
                    year = year.toUpperCase();
                    branch = session.getAttribute("branch").toString().toUpperCase();
                    user_type = year + branch + "_" + "Student";
                    s_user_type = "STUDENT";

                    if (update_data(out)) {
                        error_and_msg_student_add_update = "Student Data Updated ";
                        redirect = "handle_users.jsp";
                    } else {
                        error_and_msg_student_add_update = "Server Issue";
                        redirect = "handle_users.jsp";
                    }

                } else {
                    error_and_msg_student_add_update = "Server Issue";
                    redirect = "handle_users.jsp";
                }
            } else {
                error_and_msg_student_add_update = "This Email User Already Not Exist";
                redirect = "handle_users.jsp";
            }

        }
    }

    response.sendRedirect(redirect);
    session.setAttribute("error_and_msg_student_add_update", error_and_msg_student_add_update);
%>

<%!
    String name = "";
    String email = "";
    String password = "";
    String year = "";
    String branch = "";
    String user_type = "";
    String s_user_type = "";

    String redirect = "login.jsp";


    String user = "root";
    String pass = "12345678";
    boolean valid = false;
    Connection conn = null;
    String url = null;
    PreparedStatement statement = null;
    String sql = null;
    ResultSet result = null;
    int count = 0;

    public boolean check_alredy_exist_not() {
        valid = false;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            url = "jdbc:mysql://localhost:3306/tt_user";
            conn = DriverManager.getConnection(url, user, pass);

            sql = "SELECT * FROM uesr_credentials WHERE email=?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, email);

            result = statement.executeQuery();

            if (result.next()) {

                valid = false;

            } else {
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

            return valid;
        }

    }

    boolean add_credentials(JspWriter out) {

        count = 0;
        valid = false;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            url = "jdbc:mysql://localhost:3306/tt_user";
            conn = DriverManager.getConnection(url, user, pass);

            sql = "insert into uesr_credentials values(?,?)";
            statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);

            count = statement.executeUpdate();
            if (count > 0) {

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

    boolean update_credentials(JspWriter out) {

        count = 0;
        valid = false;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            url = "jdbc:mysql://localhost:3306/tt_user";
            conn = DriverManager.getConnection(url, user, pass);

            sql = "update uesr_credentials set pass=? where email=?";
            statement = conn.prepareStatement(sql);
            statement.setString(2, email);
            statement.setString(1, password);

            count = statement.executeUpdate();
            if (count > 0) {

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

    boolean add_data(JspWriter out) {

        count = 0;
        valid = false;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            url = "jdbc:mysql://localhost:3306/tt_user";
            conn = DriverManager.getConnection(url, user, pass);

            sql = "insert into user_data (email,name,Branch,user_type,s_user_type,year) values(?,?,?,?,?,?)";
            statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, name);
            statement.setString(3, branch);
            statement.setString(4, user_type);
            statement.setString(5, s_user_type);
            statement.setString(6, year);

            count = statement.executeUpdate();
            if (count > 0) {

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

    boolean update_data(JspWriter out) {

        count = 0;
        valid = false;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            url = "jdbc:mysql://localhost:3306/tt_user";
            conn = DriverManager.getConnection(url, user, pass);

            sql = "update  user_data set  name=?,Branch=?,user_type=?,s_user_type=?,year=? where email=?";
            statement = conn.prepareStatement(sql);

            statement.setString(1, name);
            statement.setString(2, branch);
            statement.setString(3, user_type);
            statement.setString(4, s_user_type);
            statement.setString(5, year);
            statement.setString(6, email);

            count = statement.executeUpdate();
            if (count > 0) {

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
%>