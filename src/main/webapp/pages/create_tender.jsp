<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<title>Create Tender</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">

</head>

<body>

<div class="container mt-5">

    <div class="card shadow p-4" style="max-width:600px; margin:auto;">
        
        <h3 class="text-center mb-4">Create Tender</h3>

        <form action="/DamManagement/TenderServlet" method="post">

            <div class="mb-3">
                <label class="form-label">Tender Title</label>
                <input type="text" name="title" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Description</label>
                <textarea name="description" class="form-control"></textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">Estimated Cost (Rs)</label>
                <input type="number" name="cost" class="form-control" required>
            </div>

            <!--  NEW FIELD -->
            <div class="mb-3">
                <label class="form-label">Tender Type</label>
                <select name="type" class="form-control">
                    <option value="Normal">Normal</option>
                    <option value="Emergency"> Emergency</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Deadline</label>
                <input type="date" name="deadline" class="form-control" required>
            </div>

            <button class="btn btn-success w-100">Create Tender</button>

        </form>

    </div>

</div>

</body>
</html>