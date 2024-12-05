

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("s_user_type").toString().toLowerCase().equals("admin")) {
        LocalDate currentDate = LocalDate.now();

        String[] day = new String[7];

        for (int i = 0, j = 0; i <= 6; i++) {
            LocalDate nextDate = currentDate.plusDays(i);
            if (nextDate.getDayOfWeek().getValue() != 7) { // 7 represents Sunday
                day[j++] = (nextDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy")) + " (" + nextDate.getDayOfWeek() + ")");
            }
        }
    

%>


<form action="edittable_server.jsp"  method="post">
    <div class="d-flex justify-content-between container align-items-center">
        <div  class="w-50   ">
            <label for="selectday" class="form-label h4  m-0 p-0 pb-1">Select Day</label>

            <select class="form-select text-secondary-emphasis  text-center mb-2"  id="selectday" name="edit_table_date_day" >
                <option class="py-1"  value='<%=day[0]%>' ><%=day[0]%></option>
                <option  class="py-1" value='<%=day[1]%>' ><%=day[1]%></option>
                <option  class="py-1" value='<%=day[2]%>' ><%=day[2]%></option>
                <option class="py-1"  value='<%=day[3]%>' ><%=day[3]%></option>
                <option  class="py-1" value='<%=day[4]%>' ><%=day[4]%></option>
                <option class="py-1"  value='<%=day[5]%>' ><%=day[5]%></option>
            </select>
        </div>

        <input type="hidden"  name="todaytablename"   value="<%= request.getParameter("todaytablename")%>"  />
        <input type="hidden" name="edittableclassname"  value="<%= request.getParameter("edittableclassname")%>"   />   
        <input type="submit" class="btn btn-secondary w-25 mt-3" name="Edit" value="Edit" />
    </div>
</form>
        
<%

    }
%>