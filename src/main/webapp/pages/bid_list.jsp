<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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
ResultSet rs = BidDAO.getAllBids();

//  Store lowest amount per tender
Map<Integer, Double> minMap = new HashMap<>();

// FIRST PASS  find L1 per tender
if(rs != null){
    while(rs.next()){
        int tid = rs.getInt("tender_id");
        double amt = rs.getDouble("amount");

        if(!minMap.containsKey(tid) || amt < minMap.get(tid)){
            minMap.put(tid, amt);
        }
    }

    rs.beforeFirst(); // reset cursor
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Bid List</title>
<link href="../css/style.css" rel="stylesheet">
</head>

<body>

<div class="content">

    <h2>All Bids</h2>

    <div class="card">

        <table>
            <tr>
                <th>ID</th>
                <th>Tender ID</th>
                <th>Contractor</th>
                <th>Amount (Rs)</th>
                <th>Status</th>
            </tr>

<%
if(rs != null){
    while(rs.next()){
        int tid = rs.getInt("tender_id");
        double amt = rs.getDouble("amount");

        boolean isL1 = (amt == minMap.get(tid));
%>

<tr class="<%= isL1 ? "l1" : "" %>">
    <td><%= rs.getInt("id") %></td>
    <td><%= tid %></td>
    <td><%= rs.getString("contractor_name") %></td>
    <td>Rs <%= amt %></td>

    <td>
        <% if(isL1){ %>
            <b style="color:green;">L1</b>
        <% } else { %>
            -
        <% } %>
    </td>
</tr>

<%
    }
}else{
%>

<tr>
    <td colspan="5">No data available</td>
</tr>

<%
}
%>

        </table>

    </div>

</div>

</body>
</html>