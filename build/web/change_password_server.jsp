<%@page import="java.sql.*"%>



<%

    if (session.getAttribute("email") != null) {
      

        if (session.getAttribute("otp") != null) {

            if (request.getParameter("save") != null) {

                old_password = request.getParameter("old_password");
                new_password = request.getParameter("new_password");
                new_re_e_password = request.getParameter("new_re_e_password");

                if (new_password.equals(new_re_e_password)) {
                    redirect = "change_password.jsp";
                     email = session.getAttribute("email").toString();
                     
                    if (check_old_password()) {

                        if (change_password()) {

                            redirect="signout_server.jsp";

                        } else {

                            error_and_msg = "Server error";

                        }

                    } else {
                        error_and_msg = "Wrong Old Password";

                    }
                } else {
                    redirect = "change_password.jsp";
                    error_and_msg = "New Password & Re-Enter Password Should be Same";
                }
            } else {
                redirect = "change_password.jsp";
            }
        } else {
            error_and_msg = null;
            redirect = "verify_otp.jsp";

        }
    }

    session.setAttribute("otp", null);
    session.setAttribute("error_and_msg", error_and_msg);

     response.sendRedirect(redirect);

%>
<%!
    String new_re_e_password = "";
    String old_password = "";
    String new_password = "";
    String redirect = "login.jsp";
    String error_and_msg = "";
    String email = "";
  
    int user_id = 1;
    String name = "";
    String branch = "";
    String user_type = "";
    String s_user_type = "";
    String year = "";
    int user_code = 0;

    Exception es = null;

    String user = "root";
    String pass = "12345678";

    boolean valid = false;

    Connection conn = null;
    String url = null;
    PreparedStatement statement = null;
    String sql = null;
    int count = 0;

    ResultSet result = null;

    public boolean change_password() {

        count = 0;
        valid = false;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            url = "jdbc:mysql://localhost:3306/tt_user";

            conn = DriverManager.getConnection(url, user, pass);

            sql = "update  uesr_credentials  set pass= ? where email=?";

            statement = conn.prepareStatement(sql);
            statement.setString(1, new_password);
            statement.setString(2, email);
       
            count = statement.executeUpdate();;

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

            return valid;
        }

    }
    public boolean check_old_password() {
        valid = false;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            url = "jdbc:mysql://localhost:3306/tt_user";
            conn = DriverManager.getConnection(url, user, pass);

            sql = "SELECT * FROM uesr_credentials WHERE email=? AND pass=?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, email.toUpperCase());
            statement.setString(2,old_password );

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

%>