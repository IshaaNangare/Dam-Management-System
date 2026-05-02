<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<div class="sidebar">

    <h3>Govt of India</h3>

    <% if("admin".equals(session.getAttribute("role"))) { %>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="create_tender.jsp">Create Tender</a>
        <a href="tender_list.jsp">Tenders</a>
        <a href="l1_selection.jsp">L1 Selection</a>
        <a href="work.jsp">Work</a>
        <a href="reports.jsp">Reports</a>
    <% } %>

    <% if("contractor".equals(session.getAttribute("role"))) { %>
        <a href="contractor_dashboard.jsp">Dashboard</a>
        <a href="tender_list.jsp">View Tenders</a>
        <a href="submit_bid.jsp">Submit Bid</a>
        <a href="bid_list.jsp">My Bids</a>
        <a href="work.jsp">My Work</a>
    <% } %>

    <% if("auditor".equals(session.getAttribute("role"))) { %>
        <a href="audit.jsp">Dashboard</a>
        <a href="tender_list.jsp">View Tenders</a>
        <a href="bid_list.jsp">View Bids</a>
        <a href="reports.jsp">Audit Reports</a>
    <% } %>

</div>