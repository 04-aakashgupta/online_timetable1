
<%@page contentType="text/html"  pageEncoding="UTF-8" %>
<%

    Object user = session.getAttribute("email");

    if (user!= null && request.getServletPath().equals("/login.jsp")) {
        response.sendRedirect("home.jsp");
    }
    
    
    if (user == null && request.getServletPath().equals("/login.jsp") == false) {
        response.sendRedirect("login.jsp");
    }


%>


