<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head><title>Coffee Names Starting with 'D'</title></head>
<body>

<h2>Coffee Names Starting with 'D'</h2>

<%
    String url = "jdbc:mysql://localhost:3306/test";
    String user = "root";
    String password = "your_password";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        // Query coffee names starting with 'D'
        String query = "SELECT * FROM coffee WHERE coffee_name LIKE 'D%'";
        pstmt = conn.prepareStatement(query);
        rs = pstmt.executeQuery();

        out.println("<table border='1' cellpadding='5'>");
        out.println("<tr><th>ID</th><th>Coffee Name</th><th>Price</th></tr>");

        boolean found = false;
        while (rs.next()) {
            found = true;
            int id = rs.getInt("id");
            String name = rs.getString("coffee_name");
            int price = rs.getInt("price");

            out.println("<tr>");
            out.println("<td>" + id + "</td>");
            out.println("<td>" + name + "</td>");
            out.println("<td>" + price + "</td>");
            out.println("</tr>");
        }

        if (!found) {
            out.println("<tr><td colspan='3' style='text-align:center;'>No coffee names starting with 'D'</td></tr>");
        }
        out.println("</table>");

    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>

</body>
</html>
