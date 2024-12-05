<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.time.DayOfWeek,java.time.LocalDate,java.util.LinkedList,java.sql.*" %>

<%@ page import="java.util.HashMap" %>
<%
    branch = session.getAttribute("branch").toString();

    s_user_type = session.getAttribute("s_user_type").toString();
    year_student = session.getAttribute("year").toString();
    LocalDate todayDate = LocalDate.now();

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
    String todayFormattedDate = todayDate.format(formatter);
    DayOfWeek currentDayOfWeek =todayDate.getDayOfWeek();
    DayOfWeek[] days = {DayOfWeek.MONDAY, DayOfWeek.TUESDAY, DayOfWeek.WEDNESDAY, DayOfWeek.THURSDAY, DayOfWeek.FRIDAY, DayOfWeek.SATURDAY, DayOfWeek.SUNDAY};
    HashMap<DayOfWeek, String> timetableMap = new HashMap<>();

    // Populate the timetable map (replace with your actual timetable data)
    timetableMap.put(DayOfWeek.MONDAY, "tt_mon.jsp");
    timetableMap.put(DayOfWeek.TUESDAY, "tt_tue.jsp");
    timetableMap.put(DayOfWeek.WEDNESDAY, "tt_wed.jsp");
    timetableMap.put(DayOfWeek.THURSDAY, "tt_thu.jsp");
    timetableMap.put(DayOfWeek.FRIDAY, "tt_fri.jsp");
    timetableMap.put(DayOfWeek.SATURDAY, "tt_sat.jsp");
   

    String currentDayTimetable = timetableMap.get(currentDayOfWeek);
    session.setAttribute("currentDayOfWeek", currentDayOfWeek);


%>


<%        if (session.getAttribute("vacation") != null) {

%> 

<jsp:include page ='msg.jsp'   />

<%    } else if (currentDayOfWeek.toString().equals("SUNDAY") ){
    application.setAttribute(branch.toString() + "msgtitle", "Holiday");
    application.setAttribute(branch.toString() + "msg", "Today is Sunday ");
%>

<jsp:include page ='msg.jsp'   />

<%    } else if (s_user_type.equals("admin")) {

    if (countYear()) {

        for (String year : year_admin_teacher) {

            if (countDiv(out, year)) {

                for (String div : divisions) {

                    String tablename = "edit" + "_" + currentDayOfWeek.toString().substring(0, 3).toLowerCase() + "_" + year.trim() + branch.trim() + div;

                    if (application.getAttribute("saved" + tablename.toLowerCase()) != null) {

                        String saved_edit_table_date = application.getAttribute("saved" + tablename.toLowerCase()).toString();

                        if (check_EditTableDate(todayFormattedDate, saved_edit_table_date)) {

                            if (clearTable(out, tablename)) {

                                if (fill_fix_table_data(out, tablename)) {

                                    application.setAttribute("saved" + tablename.toLowerCase().toString(), null);
                                 
                                }
                            }

                        }

                    }

                    session.setAttribute("classname", year + branch + " " + div);
                    session.setAttribute("tablename", tablename.toLowerCase());


%>


<jsp:include page ='<%= currentDayTimetable%>'  />

<%                   }
            }
        }
    }
} else if (s_user_type.equals("teacher")) {
    if (countYear()) {

        for (String year : year_admin_teacher) {

            if (countDiv(out, year)) {

                for (String div : divisions) {

                    String tablename = "edit" + "_" + currentDayOfWeek.toString().substring(0, 3).toLowerCase() + "_" + year.trim() + branch.trim().toLowerCase() + div;

                    session.setAttribute("classname", year + branch + " " + div);
                    session.setAttribute("tablename", tablename.toLowerCase());


%>
<jsp:include page ='<%= currentDayTimetable%>'   />

<%                        }
                }
            }
        }
    }
   else if (s_user_type.equals("student")) {
        if (countDiv(out, year_student)) {

            for (String div : divisions) {

                String tablename = "edit" + "_" + currentDayOfWeek.toString().substring(0, 3).toLowerCase() + "_" + year_student.trim() + branch.trim() + div.trim();

                session.setAttribute("tablename", tablename.toLowerCase());
                session.setAttribute("classname", year_student + branch + " " + div);
%>
<jsp:include page ='<%= currentDayTimetable%>'   />
<%
            }
        }
    }

%>




<%!
    LinkedList<String> divisions = new LinkedList<>();
    LinkedList<String> year_admin_teacher = new LinkedList<>();
    String branch = "";
    String s_user_type = "";

    String year_student = "";

    String user = "root";
    String pass = "12345678";

    boolean valid = false;

    Connection conn = null;
    String url = null;
    PreparedStatement statement = null;
    String sql = null;

    ResultSet result = null;

    boolean countYear() {
        year_admin_teacher.clear();
        valid = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            url = "jdbc:mysql://localhost:3306/tt_div";
            conn = DriverManager.getConnection(url, user, pass);

            sql = "SELECT  *  FROM  " + branch + "_div";
            statement = conn.prepareStatement(sql);

            result = statement.executeQuery();

            int count = 1;
            while (result.next()) {
                count++;
            }

            if (count > 0) {
                ResultSetMetaData rsmd = result.getMetaData();
                int year_count = rsmd.getColumnCount();
                for (int i = 1; i <= year_count; i++) {

                    year_admin_teacher.add(rsmd.getColumnName(i));
                    valid = true;

                }

            } else {
                valid = false;
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

    boolean countDiv(JspWriter out, String year) {
        divisions.clear();

        valid = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            url = "jdbc:mysql://localhost:3306/tt_div";
            conn = DriverManager.getConnection(url, user, pass);

            sql = "SELECT " + year + "  FROM  " + branch + "_div";

            statement = conn.prepareStatement(sql);

            result = statement.executeQuery();

            while (result.next()) {

                if (!result.getString(1).equals("")) {

                    divisions.add(result.getString(1));
                    valid = true;
                }
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

    boolean fill_fix_table_data(JspWriter out, String tablename) {

        valid = false;
        int count = 0;
        int sr_no = 0;
        String time = "";
        String room_no = "";
        String lecture = "";
        try {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                url = "jdbc:mysql://localhost:3306/tt_" + branch + "_" + LocalDate.now().getDayOfWeek().toString().toLowerCase().substring(0, 3);
                conn = DriverManager.getConnection(url, user, pass);

                sql = "SELECT * FROM " + " fix" + tablename.substring(4);
                statement = conn.prepareStatement(sql);

                result = statement.executeQuery();

                while (result.next()) {

                    sr_no = result.getInt(1);
                    time = result.getString(2);
                    room_no = result.getString(3);
                    lecture = result.getString(4);

                    sql = "insert into " + tablename + " values(?,?,?,?,?)";

                    statement = conn.prepareStatement(sql);
                    statement.setInt(1, sr_no);
                    statement.setString(2, time);
                    statement.setString(3, room_no);

                    statement.setString(4, lecture);
                    statement.setString(5, "");

                    count = statement.executeUpdate();
                    if (count > 0) {
                        valid = true;
                    }

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
            }

        } catch (Exception e) {

        }

        return valid;
    }

    boolean check_EditTableDate(String todayFormattedDate, String saved_edit_table_date) {

        // Define the date format
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");

        // Parse the date string into a LocalDate object
        LocalDate todayFormattedDate1 = LocalDate.parse(todayFormattedDate, formatter);
        LocalDate saved_edit_table_date1 = LocalDate.parse(saved_edit_table_date, formatter);

        // Current date
        // Compare the two dates
        int comparison = todayFormattedDate1.compareTo(saved_edit_table_date1);

        if (comparison > 0) {
            valid = true;
        } else if (comparison < 0) {
            valid = false;
        } else if (comparison == 0) {
            valid = false;
        }

        return valid;
    }

    boolean clearTable(JspWriter out, String tablename) {

        valid = false;
        int count = 0;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            url = "jdbc:mysql://localhost:3306/tt_" + branch + "_" + LocalDate.now().getDayOfWeek().toString().toLowerCase().substring(0, 3);

            conn = DriverManager.getConnection(url, user, pass);

            sql = "Truncate " + tablename;
            statement = conn.prepareStatement(sql);

            statement.executeUpdate();

            sql = "select * from " + tablename;
            statement = conn.prepareStatement(sql);
            result = statement.executeQuery();
            while (result.next()) {
                count++;

            }
            if (count == 0) {

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

























