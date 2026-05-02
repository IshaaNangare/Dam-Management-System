<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="dao.TenderDAO" %>
<%@ page import="dao.BidDAO" %>

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
%>

<!DOCTYPE html>
<html>
<head>
<title>Contractor Dashboard</title>
<link href="../css/style.css" rel="stylesheet">
</head>

<body>

<div class="content">

    <h2>Contractor Dashboard</h2>

    <div class="card">
        <h4>Overview</h4>

        <table>
            <tr>
                <th>Available Tenders</th>
                <th>Total Bids Submitted</th>
            </tr>

            <tr>
                <td><%= totalTenders %></td>
                <td><%= totalBids %></td>
            </tr>
        </table>
    </div>

    <div class="card">
        <h4>Quick Actions</h4>

        <table>
            <tr>
                <th>Action</th>
                <th>Link</th>
            </tr>

            <tr>
                <td>View Available Tenders</td>
                <td><a href="tender_list.jsp">Go</a></td>
            </tr>

            <tr>
                <td>Submit New Bid</td>
                <td><a href="submit_bid.jsp">Go</a></td>
            </tr>

            <tr>
                <td>Check My Bids</td>
                <td><a href="bid_list.jsp">Go</a></td>
            </tr>

            <tr>
                <td>Check L1 Result</td>
                <td><a href="l1_selection.jsp">Go</a></td>
            </tr>

        </table>
    </div>

</div>

</body>
</html>