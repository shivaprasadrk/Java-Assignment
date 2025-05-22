<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head><title>Update Coffee Product</title></head>
<body>

<h2>Update Coffee Product</h2>

<!-- Form to update coffee by ID -->
<form method="post" action="updateCoffee.jsp">
    Coffee ID to Update: <input type="number" name="id" required><br><br>
    New Coffee Name: <input type="text" name="coffee_name" required><br><br>
    New Price: <input type="number" name="price" required><br><br>
    <input type="submit" value="Update Coffee">
</form>

<%
    // DB parameters (update as per your MySQL setup)
    String url = "jdbc:mysql://localhost:3306/test";
    String user = "root";
    String password = "your_password";

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        conn = DriverManager.getConnection(url, user, password);

        // Process update if POST request
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            int id = Integer.parseInt(request.getParameter("id"));
            String coffeeName = request.getParameter("coffee_name");
            int price = Integer.parseInt(request.getParameter("price"));

            String updateSQL = "UPDATE coffee SET coffee_name = ?, priced = ? WHERE id = ?";
            pstmt = conn.prepareStatement(updateSQL);
            pstmt.setString(1, coffeeName);
            pstmt.setInt(2, price);
            pstmt.setInt(3, id);

            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                out.println("<p style='color:green;'>Coffee product updated successfully!</p>");
            } else {
                out.println("<p style='color:red;'>No coffee product found with ID: " + id + "</p>");
            }
            pstmt.close();
        }

        // Display all records after update
        String selectSQL = "SELECT * FROM coffee";
        pstmt = conn.prepareStatement(selectSQL);
        rs = pstmt.executeQuery();
%>
    <h3>Current Coffee Products</h3>
    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>Coffee Name</th>
            <th>Price</th>
        </tr>
<%
        while (rs.next()) {
%>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("coffee_name") %></td>
            <td><%= rs.getInt("priced") %></td>
        </tr>
<%
        }

    } catch(Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
    </table>
</body>
</html>
