<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Session Management - Welcome</title>
</head>
<body>
<%
    // Get username from request parameter
    String name = request.getParameter("uname");

    // Display welcome message
    out.print("Welcome! " + name + "<br/>");

    // Inform user session has started
    out.print("Session has started for user: " + name + "<br/>");

    // Store username in session object
    session.setAttribute("user", name);

    // Inform that username is stored in session
    out.print("Your name has been stored in session object.<br/>");

    // Set session timeout to 60 seconds (1 minute)
    session.setMaxInactiveInterval(60);

    out.print("Session will expire in 1 minute of inactivity.<br/>");

    // Provide link to second.jsp to retrieve session value
    out.print("Kindly press the following link to check it:<br/>");
%>
<a href="second.jsp">Display the session value</a>
</body>
</html>
