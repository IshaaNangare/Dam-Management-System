<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ include file="header.jsp" %>
<%@ include file="sidebar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Submit Bid</title>

<link href="../css/style.css" rel="stylesheet">

</head>

<body>

<div class="content">

    <h2>Submit Bid</h2>

    <div class="card">

        <form action="/DamManagement/BidServlet" method="post">
            <table>

                <tr>
                    <td>Tender ID</td>
                    <td><input type="number" name="tender_id" required></td>
                </tr>

                <tr>
                    <td>Bid Amount (Rs)</td>
                    <td><input type="number" name="amount" required></td>
                </tr>

                <tr>
                    <td colspan="2">
                        <button type="submit">Submit Bid</button>
                    </td>
                </tr>

            </table>
        </form>

    </div>

</div>

</body>
</html>