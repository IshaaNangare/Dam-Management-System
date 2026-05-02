<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>
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

<!DOCTYPE html>
<html>
<head>
<title>L1 Selection</title>
<link href="../css/style.css" rel="stylesheet">
</head>

<body>

<div class="content">

    <h2>L1 Selection (Lowest Bidder)</h2>

    <div class="card">
        <form method="get">
            <table>
                <tr>
                    <td>Enter Tender ID</td>
                    <td><input type="number" name="tender_id" required></td>
                    <td><button type="submit">Find Bids</button></td>
                </tr>
            </table>
        </form>
    </div>

<%
String tid = request.getParameter("tender_id");

if(tid != null){

    int tenderId = Integer.parseInt(tid);

    ResultSet rs = BidDAO.getBidsByTender(tenderId);

    double minAmount = Double.MAX_VALUE;

    if(rs != null){
        while(rs.next()){
            double amt = rs.getDouble("amount");
            if(amt < minAmount){
                minAmount = amt;
            }
        }

        // reset cursor (make sure DAO is scrollable)
        rs.beforeFirst();
%>

    <div class="card">
        <h4>Bid Comparison</h4>

        <table>
            <tr>
                <th>Bid ID</th>
                <th>Contractor</th>
                <th>Amount (Rs)</th>
                <th>Status</th>
            </tr>

<%
        while(rs.next()){
            double amt = rs.getDouble("amount");
            boolean isL1 = (amt == minAmount);
%>

<tr class="<%= isL1 ? "l1" : "" %>">
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("contractor_name") %></td>
    <td>Rs <%= amt %></td>
    <td>
        <% if(isL1){ %>
            <b style="color:green;">L1 (Lowest)</b>
        <% } else { %>
            -
        <% } %>
    </td>
</tr>

<%
        }
%>

        </table>
    </div>

<%
    } else {
%>

    <div class="card">No bids found for this tender</div>

<%
    }
}
%>

</div>

</body>
</html>