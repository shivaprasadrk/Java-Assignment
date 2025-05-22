<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insert Employee Record</title>
</head>
<body>

<h2>Insert Employee Record</h2>

<!-- Form to get employee details -->
<form method="post" action="insertEmp.jsp">
    Emp No: <input type="number" name="empno" required><br><br>
    Emp Name: <input type="text" name="empname" required><br><br>
    Basic Salary: <input type="number" name="basicsalary" required><br><br>
    <input type="submit" value="Add Employee">
</form>

<hr>

<%
    String url = "jdbc:mysql://localhost:3306/Employee";
    String user = "root";
    String password = "your_password";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            // Get form data
            int empno = Integer.parseInt(request.getParameter("empno"));
            String empname = request.getParameter("empname");
            int basicsalary = Integer.parseInt(request.getParameter("basicsalary"));

            // Insert new record
            String insertSQL = "INSERT INTO Emp (Emp_NO, Emp_Name, Basicsalary) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(insertSQL);
            pstmt.setInt(1, empno);
            pstmt.setString(2, empname);
            pstmt.setInt(3, basicsalary);
            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                out.println("<p style='color:green;'>Employee added successfully.</p>");
            }
            pstmt.close();

            // Fetch all records for report
            String selectSQL = "SELECT * FROM Emp";
            pstmt = conn.prepareStatement(selectSQL);
            rs = pstmt.executeQuery();

            int grandSalary = 0;

            out.println("<h3>Salary Report</h3>");
            out.println("<pre>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</pre>");
            while (rs.next()) {
                int eno = rs.getInt("Emp_NO");
                String ename = rs.getString("Emp_Name");
                int salary = rs.getInt("Basicsalary");

                grandSalary += salary;

                out.println("Emp_No : " + eno);
                out.println("Emp_Name: " + ename);
                out.println("Basic : " + salary);
                out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            }
            out.println("<b>Grand Salary : " + grandSalary + "</b>");
            out.println("<pre>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</pre>");

        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        } finally {
            try { if (rs != null) rs.close(); } catch(Exception e) {}
            try { if (pstmt != null) pstmt.close(); } catch(Exception e) {}
            try { if (conn != null) conn.close(); } catch(Exception e) {}
        }
    }
%>

</body>
</html>
