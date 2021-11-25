<%-- 
    Document   : logout.jsp
    Created on : 11/11/2021, 04:25:54 AM
    Author     : yayah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
session.invalidate();
response.sendRedirect("logueo.jsp");
%>
    </body>
</html>
