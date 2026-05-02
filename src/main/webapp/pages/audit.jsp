<%@ page import="java.sql.*" %>
<%@ page import="dao.*" %>

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
ResultSet rs = AuditDAO.getAllAudits();
%>

<!DOCTYPE html>
<html>
<head>
<title>Auditor Dashboard</title>

<link href="../css/style.css" rel="stylesheet">

</head>

<body>

<div class="content">

    <h2>Auditor Dashboard</h2>

    <div class="card">
        <h4>Audit Verification</h4>

        <form action="/DamManagement/AuditServlet" method="post">
            <table>
                <tr>
                    <td>Tender ID</td>
                    <td><input type="number" name="tender_id" required></td>
                </tr>

                <tr>
                    <td>Status</td>
                    <td>
                        <select name="status">
                            <option value="Approved">Approved</option>
                            <option value="Rejected">Rejected</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <button type="submit">Submit Audit</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <div class="card">
        <h4>Audit Records</h4>

        <table>
            <tr>
                <th>Audit ID</th>
                <th>Tender ID</th>
                <th>Status</th>
                <th>Date</th>
            </tr>

            <%
            if(rs != null){
                while(rs.next()){
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getInt("tender_id") %></td>
                <td><%= rs.getString("status") %></td>
                <td><%= rs.getTimestamp("audit_date") %></td>
            </tr>
            <%
                }
            }
            %>

        </table>
    </div>

</div>

</body>
</html>