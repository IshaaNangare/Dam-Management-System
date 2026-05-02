<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<title>Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">

</head>

<body class="d-flex justify-content-center align-items-center vh-100">

<div class="card p-4 shadow" style="width:350px;">
    <h3 class="text-center mb-3">Dam Management</h3>

    <!--  SHOW ERROR MESSAGE -->
    <%
        String error = request.getParameter("error");
        if(error != null) {
    %>
        <div class="alert alert-danger text-center">Invalid Credentials</div>
    <%
        }
    %>

    <form action="/DamManagement/LoginServlet" method="post">

        <input type="text" name="username" class="form-control mb-3" placeholder="Username" required>

        <input type="password" name="password" class="form-control mb-3" placeholder="Password" required>

        <select name="role">
    <option value="admin">Admin</option>
    <option value="contractor">Contractor</option>
    <option value="auditor">Auditor</option>
</select>

        <button class="btn btn-primary w-100">Login</button>

    </form>

</div>

</body>
</html>