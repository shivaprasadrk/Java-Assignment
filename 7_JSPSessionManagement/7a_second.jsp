<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Session Management - Display</title>
</head>
<body>
    <h1>Display the session value on this page</h1>
<%
    // Retrieve the username from session
    String name = (String) session.getAttribute("user");

    // Check if session attribute exists
    if (name == null) {
        // Session expired or attribute not found
        out.print("Sorry, the session has ended or no user is logged in.");
    } else {
        // Display username from session
        out.print("Hello " + name + "!");
    }
%>
</body>
</html>
