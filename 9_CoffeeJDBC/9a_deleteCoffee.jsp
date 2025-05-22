<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head><title>Delete Coffee Product</title></head>
<body>

<h2>Delete Coffee Product by ID</h2>

<!-- Form to enter coffee id for deletion -->
<form method="post" action="deleteCoffee.jsp">
    Enter Coffee ID to Delete: <input type="number" name="coffeeId" required>
    <input type="submit" value="Delete">
</form>

<hr>

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

        // If form submitted, delete record
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            int coffeeId = Integer.parseInt(request.getParameter("coffeeId"));

            String deleteSQL = "DELETE FROM coffee WHERE id = ?";
            pstmt = conn.prepareStatement(deleteSQL);
            pstmt.setInt(1, coffeeId);
            int rowsDeleted = pstmt.executeUpdate();

            if (rowsDeleted > 0) {
                out.println("<p style='color:green;'>Coffee with ID " + coffeeId + " deleted successfully.</p>");
            } else {
                out.println("<p style='color:red;'>No coffee found with ID " + coffeeId + ".</p>");
            }
            pstmt.close();
        }

        // Display all remaining coffee records
        String selectSQL = "SELECT * FROM coffee";
        pstmt = conn.prepareStatement(selectSQL);
        rs = pstmt.executeQuery();

        out.println("<h3>Existing Coffee Products</h3>");
        out.println("<table border='1' cellpadding='5'>");
        out.println("<tr><th>ID</th><th>Coffee Name</th><th>Price</th></tr>");

        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("coffee_name");
            int price = rs.getInt("price");

            out.println("<tr>");
            out.println("<td>" + id + "</td>");
            out.println("<td>" + name + "</td>");
            out.println("<td>" + price + "</td>");
            out.println("</tr>");
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
