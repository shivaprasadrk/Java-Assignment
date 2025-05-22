<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head><title>Insert Employee Records</title></head>
<body>

<h2>Insert Employee Record</h2>

<!-- Form to insert employee details -->
<form method="post" action="insertEmp.jsp">
    Emp No: <input type="number" name="empno" required><br><br>
    Emp Name: <input type="text" name="empname" required><br><br>
    Basic Salary: <input type="number" name="basicsalary" required><br><br>
    <input type="submit" value="Insert Employee">
</form>

<hr>

<%
    // Database connection parameters - update per your setup
    String url = "jdbc:mysql://localhost:3306/Employee";
    String user = "root";
    String password = "your_password";

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        conn = DriverManager.getConnection(url, user, password);

        // Insert record if POST request
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            int empno = Integer.parseInt(request.getParameter("empno"));
            String empname = request.getParameter("empname");
            int basicsalary = Integer.parseInt(request.getParameter("basicsalary"));

            String insertSQL = "INSERT INTO Emp (Emp_NO, Emp_Name, Basicsalary) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(insertSQL);
            pstmt.setInt(1, empno);
            pstmt.setString(2, empname);
            pstmt.setInt(3, basicsalary);

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                out.println("<p style='color:green;'>Employee record inserted successfully!</p>");
            } else {
                out.println("<p style='color:red;'>Failed to insert employee record.</p>");
            }
            pstmt.close();
        }

        // Generate Salary Report for all employees
        String selectSQL = "SELECT * FROM Emp";
        pstmt = conn.prepareStatement(selectSQL);
        rs = pstmt.executeQuery();

        int grandSalary = 0;

        out.println("<pre>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        out.println("                    Salary Report");
        out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");

        while (rs.next()) {
            int empNo = rs.getInt("Emp_NO");
            String empName = rs.getString("Emp_Name");
            int basic = rs.getInt("Basicsalary");

            out.println("Emp_No : " + empNo);
            out.println("Emp_Name: " + empName);
            out.println("Basic : " + basic);
            out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");

            grandSalary += basic;
        }

        out.println("Grand Salary : " + grandSalary);
        out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</pre>");

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
