<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="dao.TenderDAO" %>
<%@ page import="dao.BidDAO" %>
<%@ page import="dao.WorkDAO" %>

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
int totalTenders = TenderDAO.getTenderCount();
int totalBids = BidDAO.getBidCount();
int totalWork = WorkDAO.getWorkCount();
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<link href="../css/style.css" rel="stylesheet">
</head>

<body>

<div class="content">

    <h2>Admin Dashboard</h2>

    <div class="card">
        <h4>System Overview</h4>

        <table>
            <tr>
                <th>Total Tenders</th>
                <th>Total Bids</th>
                <th>Work Ongoing</th>
            </tr>

            <tr>
                <td><%= totalTenders %></td>
                <td><%= totalBids %></td>
                <td><%= totalWork %></td>
            </tr>
        </table>
    </div>

</div>

</body>
</html>