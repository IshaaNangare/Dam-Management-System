<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<title>Register</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">

</head>

<body class="d-flex justify-content-center align-items-center vh-100">

<div class="card p-4 shadow" style="width:350px;">

    <h3 class="text-center mb-3">Register</h3>

    <form action="/DamManagement/RegisterServlet" method="post">

        <input type="text" name="username" class="form-control mb-3" placeholder="Username" required>

        <input type="password" name="password" class="form-control mb-3" placeholder="Password" required>

        <select name="role" class="form-control mb-3">
            <option value="admin">Admin</option>
            <option value="contractor">Contractor</option>
        </select>

        <button class="btn btn-success w-100">Register</button>

    </form>

    <div class="text-center mt-3">
        <a href="login.jsp">Already have an account? Login</a>
    </div>

</div>

</body>
</html>