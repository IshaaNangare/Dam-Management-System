<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>
<%@ page import="dao.TenderDAO" %>

<%
String role = (String) session.getAttribute("role");

if(role == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<%@ include file="header.jsp" %>
<%@ include file="sidebar.jsp" %>

<%
ResultSet rs = TenderDAO.getAllTenders();
%>

<!DOCTYPE html>
<html>
<head>
<title>Tender List</title>
<link href="../css/style.css" rel="stylesheet">
</head>

<body>

<div class="content">

    <h2>Tender List</h2>

    <div class="card">

        <table>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Type</th>
                <th>Cost (Rs)</th>
                <th>Deadline</th>
            </tr>

<%
if(rs != null){
    while(rs.next()){
%>

<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("title") %></td>
    <td><%= rs.getString("description") %></td>

    <td>
        <% if("Emergency".equalsIgnoreCase(rs.getString("type"))){ %>
            <b style="color:#800000;">Emergency</b>
        <% } else { %>
            Normal
        <% } %>
    </td>

    <td>Rs <%= rs.getDouble("cost") %></td>
    <td><%= rs.getDate("deadline") %></td>
</tr>

<%
    }
}else{
%>

<tr>
    <td colspan="6">No tenders available</td>
</tr>

<%
}
%>

        </table>

    </div>

</div>

</body>
</html>