<%@page contentType="text/html"  pageEncoding="UTF-8"  %>
<%@ page import="java.sql.*" %>


<%
    try {

        email = request.getParameter("email").trim();
        password = request.getParameter("password").trim();
        branch = request.getParameter("branch").trim();

        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {

        } else {

            if (checkUserCredentials()) {

                if (checkUserData()) {

                    if (checkUserCode()) {

                        setUserData(session);

                    }

                }

            }

        }

        if (session.getAttribute("email") != null) {
            session.setAttribute("error", null);
            redirect = ("home.jsp");
        } else {

            session.setAttribute("error", "Enter Valid Email & Password");
          
        }

    } catch (Exception e) {

    }
    
response.sendRedirect(redirect);
%>

<%!
    String redirect = "login.jsp";
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

    public boolean checkUserCredentials() {
        valid = false;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            url = "jdbc:mysql://localhost:3306/tt_user";
            conn = DriverManager.getConnection(url, user, pass);

            sql = "SELECT * FROM uesr_credentials WHERE email=? AND pass=?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, email.toUpperCase());
            statement.setString(2, password);

            result = statement.executeQuery();

            if (result.next()) {

                valid = true;

            } else {

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

    public boolean checkUserData() {
        valid = false;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            url = "jdbc:mysql://localhost:3306/tt_user";

            conn = DriverManager.getConnection(url, user, pass);

            sql = "SELECT * FROM user_data WHERE email=? AND branch=? ";
            statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, branch);

            result = statement.executeQuery();

            while (result.next()) {
                user_id = result.getInt(1);
                email = result.getString(2);
                name = result.getString(3);
                branch = result.getString(4);
                user_type = result.getString(5);
                s_user_type = result.getString(6);
                year = result.getString(7);

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

    boolean checkUserCode() {
        valid = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            url = "jdbc:mysql://localhost:3306/tt_user";
            conn = DriverManager.getConnection(url, user, pass);

            sql = "SELECT * FROM user_code WHERE user_type=?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, user_type);

            result = statement.executeQuery();

            while (result.next()) {

                user_code = result.getInt(2);
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

    public void setUserData(HttpSession session) {
        session.setAttribute("email", email.toLowerCase());
        session.setAttribute("password", password.toLowerCase());
        session.setAttribute("user_id", user_id);
        session.setAttribute("name", name.toLowerCase());
        session.setAttribute("branch", branch.toLowerCase());
        session.setAttribute("user_type", user_type.toLowerCase());
        session.setAttribute("s_user_type", s_user_type.toLowerCase());
        session.setAttribute("year", year.toLowerCase());
        session.setAttribute("user_code", user_code);

    }

%>