<!-- index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cookie List Management</title>
    <style>
        /* Styling for cookie table */
        .cookie-table {
            border-collapse: collapse;
            width: 60%;
            margin: 20px 0;
        }
        .cookie-table th, .cookie-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .cookie-table th {
            background-color: #f2f2f2;
        }
        /* Styling for form groups */
        .form-group {
            margin: 15px 0;
        }
        /* Styling for auto refresh notice */
        .auto-refresh {
            color: #666;
            font-size: 0.9em;
            margin-bottom: 10px;
        }
    </style>
    <script>
        // Auto refresh page every 1 second to update cookie list dynamically
        setTimeout(function() {
            window.location.reload();
        }, 1000);
    </script>
</head>
<body>

    <h2>Cookie List Management</h2>

    <!-- Form to add/set a new cookie -->
    <form action="setCookie.jsp" method="post">
        <h3>Set New Cookie</h3>
        <table>
            <tr class="form-group">
                <td><label>Cookie Name:</label></td>
                <td><input type="text" name="cookieName" required></td>
            </tr>
            <tr class="form-group">
                <td><label>Domain:</label></td>
                <td><input type="text" name="domain" required></td>
            </tr>
            <tr class="form-group">
                <td><label>Max Age (seconds):</label></td>
                <td><input type="number" name="maxAge" value="10" required></td>
            </tr>
        </table>
        <input type="submit" value="Add Cookie">
    </form>

    <hr>

    <!-- Display list of active cookies -->
    <h3>List of Active Cookies</h3>
    <p class="auto-refresh">List updates automatically when cookies expire</p>

    <table class="cookie-table">
        <thead>
            <tr>
                <th>Cookie Name</th>
                <th>Domain</th>
                <th>Max Age (seconds)</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Retrieve the cookie list from session
                @SuppressWarnings("unchecked")
                List<Map<String, String>> cookieList = (List<Map<String, String>>) session.getAttribute("cookieList");
                long currentTime = System.currentTimeMillis() / 1000; // Current time in seconds

                if (cookieList != null) {
                    // Remove expired cookies based on maxAge and setTime
                    Iterator<Map<String, String>> iterator = cookieList.iterator();
                    while (iterator.hasNext()) {
                        Map<String, String> cookie = iterator.next();
                        long setTime = Long.parseLong(cookie.get("setTime"));
                        int maxAge = Integer.parseInt(cookie.get("maxAge"));
                        if (currentTime > setTime + maxAge) {
                            iterator.remove(); // Remove expired cookie
                            continue;
                        }
                    }
                    // Update the session attribute with cleaned list
                    session.setAttribute("cookieList", cookieList);
                }

                if (cookieList != null && !cookieList.isEmpty()) {
                    // Display active cookies in table rows
                    for (Map<String, String> cookie : cookieList) {
            %>
                        <tr>
                            <td><%= cookie.get("name") %></td>
                            <td><%= cookie.get("domain") %></td>
                            <td><%= cookie.get("maxAge") %></td>
                        </tr>
            <%
                    }
                } else {
                    // If no cookies are active, show this message
            %>
                    <tr>
                        <td colspan="3" style="text-align: center;">No active cookies</td>
                    </tr>
            <%
                }
            %>
        </tbody>
    </table>

</body>
</html>
