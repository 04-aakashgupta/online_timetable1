<%-- 
    Document   : signout
    Created on : 26-Jan-2024, 4:51:54 pm
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"  session="false"   %>


<%
    HttpSession s = request.getSession(false);
    if (s != null) {
        s.invalidate();

        response.sendRedirect("login.jsp");

    }

%>