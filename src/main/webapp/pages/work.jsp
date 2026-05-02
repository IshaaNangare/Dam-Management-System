<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>
<%@ page import="dao.WorkDAO" %>

<%
String role = (String) session.getAttribute("role");
String username = (String) session.getAttribute("username");

if(role == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<%@ include file="header.jsp" %>
<%@ include file="sidebar.jsp" %>

<%
ResultSet rs;

//  Contractor should see only their work
if("contractor".equals(role)){
    rs = WorkDAO.getWorkByContractor(username);
} else {
    rs = WorkDAO.getAllWork();
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Work Assignment</title>
<link href="../css/style.css" rel="stylesheet">
</head>

<body>

<div class="content">

    <h2>Work Assignment</h2>

    <!--  SHOW ONLY FOR ADMIN -->
    <% if("admin".equals(role)) { %>

    <div class="card">
        <h4>Assign Work</h4>

        <form action="/DamManagement/WorkServlet" method="post">
            <table>
                <tr>
                    <td>Tender ID</td>
                    <td><input type="number" name="tender_id" required></td>
                </tr>

                <tr>
                    <td>Contractor Name</td>
                    <td>
                        <input type="text" name="contractor_name" placeholder="Enter contractor or 'auto'" required>
                    </td>
                </tr>

                <tr>
                    <td>Status</td>
                    <td>
                        <select name="status">
                            <option value="Pending">Pending</option>
                            <option value="Ongoing">Ongoing</option>
                            <option value="Completed">Completed</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <button type="submit">Assign Work</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <% } %>

    <!--  WORK LIST (ALL / OWN) -->
    <div class="card">
        <h4>Assigned Work List</h4>

        <table>
            <tr>
                <th>ID</th>
                <th>Tender ID</th>
                <th>Contractor</th>
                <th>Status</th>
            </tr>

<%
if(rs != null){
    while(rs.next()){
%>

<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getInt("tender_id") %></td>
    <td><%= rs.getString("contractor_name") %></td>
    <td><%= rs.getString("status") %></td>
</tr>

<%
    }
}else{
%>

<tr>
    <td colspan="4">No work assigned yet</td>
</tr>

<%
}
%>

        </table>

    </div>

</div>

</body>
</html>