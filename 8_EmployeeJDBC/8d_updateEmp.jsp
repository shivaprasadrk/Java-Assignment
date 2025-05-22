<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head><title>Update Employee Record</title></head>
<body>

<h2>Update Employee Record</h2>

<!-- Form to update employee by Emp_No -->
<form method="post" action="updateEmp.jsp">
    Emp No (to update): <input type="number" name="empno" required><br><br>
    New Emp Name: <input type="text" name="empname" required><br><br>
    New Basic Salary: <input type="number" name="basicsalary" required><br><br>
    <input type="submit" value="Update Employee">
</form>

<hr>

<%
    // DB credentials
    String url = "jdbc:mysql://localhost:3306/Employee";
    String user = "root";
    String password = "your_password";

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = DriverManager.getConnection(url, user, password);

        if ("POST".equalsIgnoreCase(request.getMethod())) {
            int empno = Integer.parseInt(request.getParameter("empno"));
            String empname = request.getParameter("empname");
            int basicsalary = Integer.parseInt(request.getParameter("basicsalary"));

            String updateSQL = "UPDATE Emp SET Emp_Name = ?, Basicsalary = ? WHERE Emp_NO = ?";
            pstmt = conn.prepareStatement(updateSQL);
            pstmt.setString(1, empname);
            pstmt.setInt(2, basicsalary);
            pstmt.setInt(3, empno);

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                out.println("<p style='color:green;'>Employee record updated successfully!</p>");
            } else {
                out.println("<p style='color:red;'>No employee found with Emp_No: " + empno + "</p>");
            }
            pstmt.close();
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>

</body>
</html>
