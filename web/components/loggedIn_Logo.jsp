
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<div class="text-end me-2" style="width: 100%;">
    <button class="btn btn-primary rounded-circle fs-5 pt-1" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight" style="width: 40px; height: 40px;"><%= session.getAttribute("name").toString().toUpperCase().substring(0, 1) %></button>
</div>