<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head><title>Insert Coffee Product</title></head>
<body>

<h2>Insert New Coffee Product</h2>

<!-- HTML form to take coffee name and price -->
<form method="post" action="insertCoffee.jsp">
    Coffee Name: <input type="text" name="coffee_name" required><br><br>
    Price: <input type="number" name="price" required><br><br>
    <input type="submit" value="Insert Coffee">
</form>

<%
    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/test";
    String user = "root"; // your MySQL username
    String password = "your_password"; // your MySQL password

    // Load MySQL driver
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        conn = DriverManager.getConnection(url, user, password);

        // Insert only if form submitted via POST method and parameters exist
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String coffeeName = request.getParameter("coffee_name");
            String priceStr = request.getParameter("price");
            int price = Integer.parseInt(priceStr);

            String insertSQL = "INSERT INTO coffee (coffee_name, priced) VALUES (?, ?)";
            pstmt = conn.prepareStatement(insertSQL);
            pstmt.setString(1, coffeeName);
            pstmt.setInt(2, price);
            pstmt.executeUpdate();
            out.println("<p style='color:green;'>New coffee inserted successfully!</p>");
            pstmt.close();
        }

        // Now read and display all coffee records
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
