<!-- setCookie.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <title>Setting Cookie</title>
    <style>
        /* Styling for info box */
        .info-box {
            margin: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        /* Success message styling */
        .success {
            color: green;
        }
    </style>
</head>
<body>
    <div class="info-box">
        <%
            // Get parameters from form submission
            String name = request.getParameter("cookieName");
            String domain = request.getParameter("domain");
            String maxAge = request.getParameter("maxAge");

            if (name != null && domain != null && maxAge != null) {
                // Retrieve or create cookie list from session
                @SuppressWarnings("unchecked")
                List<Map<String, String>> cookieList = (List<Map<String, String>>) session.getAttribute("cookieList");
                if (cookieList == null) {
                    cookieList = new ArrayList<>();
                }

                // Get current time in seconds
                long currentTimeSeconds = System.currentTimeMillis() / 1000;
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String timestamp = sdf.format(new Date());

                // Create new cookie entry map
                Map<String, String> cookieEntry = new HashMap<>();
                cookieEntry.put("name", name);
                cookieEntry.put("domain", domain);
                cookieEntry.put("maxAge", maxAge);
                cookieEntry.put("setTime", String.valueOf(currentTimeSeconds));

                // Create and set actual cookie
                Cookie cookie = new Cookie(name, "value");
                cookie.setMaxAge(Integer.parseInt(maxAge));
                cookie.setDomain(domain);
                response.addCookie(cookie);

                // Add cookie entry to the list and update session
                cookieList.add(cookieEntry);
                session.setAttribute("cookieList", cookieList);
        %>
                <!-- Display confirmation and details -->
                <h3 class="success">Cookie Set Successfully</h3>
                <p><strong>Cookie Name:</strong> <%= name %></p>
                <p><strong>Domain:</strong> <%= domain %></p>
                <p><strong>Max Age:</strong> <%= maxAge %> seconds</p>
                <p><strong>Set Time:</strong> <%= timestamp %></p>
        <%
            }
        %>
        <p><a href="index.jsp">Return to Cookie List</a></p>
    </div>
</body>
</html>
