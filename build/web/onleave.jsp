<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="login_check_server.jsp" %>
  <%  if (session.getAttribute("email") != null) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Onleave Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="global.css" rel="stylesheet" />
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

        <script src="onleave.js" type="text/javascript"></script>

    </head>
     <body class="p-0 m-0">
        <%@include file="components/navbar.jsp" %>



        <div class="timetable mt-5">
            <h3 class="h3 p-4">Manage Teachers On Leave</h3>

            <div class="row">
                <div class="col-11 col-sm-10 col-md-9 col-lg-6 m-4">
                    <table class="table border border-info-subtle border-5 table-hover text-center">
                        <thead class="table-info border border-2">
                            <tr>
                                <th class="fw-bolder text-secondary">Teacher</th>
                                <th class="fw-bolder text-danger">All</th>
                                <th class="fw-bolder text-danger">L1</th>
                                <th class="fw-bolder text-danger">L2</th>
                                <th class="fw-bolder text-danger">L3</th>
                                <th class="fw-bolder text-danger">L4</th>
                                <th class="fw-bolder text-danger">L5</th>
                                <th class="fw-bolder text-danger">L6</th>
                                <th class="text-primary fw">No. Leave</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="table-light border border-info-subtle border-2">
                                <td class="table-secondary border border-info-subtle border-2 fw-bolder text-success">OM</td>
                                <td><input class="input" type="checkbox"  onchange="selectAllLeacture(this)"  /></td>
                                <td><input class="input lectureCheckBox" type="checkbox" name="lec" /></td>
                                <td><input class="input lectureCheckBox" type="checkbox" name="lec" /></td>
                                <td><input class="input lectureCheckBox" type="checkbox" name="lec" /></td>
                                <td><input class="input lectureCheckBox" type="checkbox" name="lec" /></td>
                                <td><input class="input lectureCheckBox" type="checkbox" name="lec" /></td>
                                <td><input class="input lectureCheckBox" type="checkbox" name="lec" /></td>
                                <td class="text-secondary fw-bolder">0</td>
                            </tr>
                            <tr class="table-light border border-info-subtle border-2">
                                <td class="table-secondary border border-info-subtle border-2 fw-bolder text-success">NY</td>
                                <td><input class="input" type="checkbox" /></td>
                                <td><input class="input" type="checkbox" /></td>
                                <td><input class="input" type="checkbox" /></td>
                                <td><input class="input" type="checkbox" /></td>
                                <td><input class="input" type="checkbox" /></td>
                                <td><input class="input" type="checkbox" /></td>
                                <td><input class="input" type="checkbox" name="lec" /></td>
                                <td class="text-secondary fw-bolder">0</td>
                            </tr>
                            <tr class="p-0 table-light border border-info-subtle border-2">
                                <td class="text-center p-0" colspan="12">
                                    <button class="btn btn-outline-success btn-secondary w-100 text-white fs-5 fw-bolder">Submit</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="text" name="ss" />
                </div>
            </div>
        </div>
 

</body>
</html>


<%}
%>