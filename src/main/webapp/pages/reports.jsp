<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="dao.TenderDAO" %>
<%@ page import="dao.BidDAO" %>

<%@ page import="dao.WorkDAO" %>

<%
int totalTenders = TenderDAO.getTenderCount();
int totalBids = BidDAO.getBidCount();

int totalWork = WorkDAO.getWorkCount();
%>

<!DOCTYPE html>
<html>
<head>
<title>Reports</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">

</head>

<body>

<nav class="navbar navbar-dark px-3">
    <span class="navbar-brand">Reports Dashboard</span>
</nav>

<div class="container mt-5">

    <h3 class="text-center mb-4">System Reports</h3>

    <div class="row text-center">

        <div class="col-md-3">
            <div class="dashboard-card bg-blue">
                Total Tenders
                <h4><%= totalTenders %></h4>
            </div>
        </div>

        <div class="col-md-3">
            <div class="dashboard-card bg-green">
                Total Bids
                <h4><%= totalBids %></h4>
            </div>
        </div>

       

        <div class="col-md-3">
            <div class="dashboard-card bg-orange">
                Work Records
                <h4><%= totalWork %></h4>
            </div>
        </div>

    </div>

    <div class="mt-5">

        <h5>Quick Reports</h5>

        <ul class="list-group">
            <li class="list-group-item"> Tender Summary Report</li>
            <li class="list-group-item"> Bid Analysis Report</li>
            <li class="list-group-item"> Emergency Issue Report</li>
            <li class="list-group-item"> Work Progress Report</li>
        </ul>

    </div>

</div>

</body>
</html>