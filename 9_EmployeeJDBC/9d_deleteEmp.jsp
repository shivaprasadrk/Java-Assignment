<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Employees by Name Starting Letter</title>
</head>
<body>

<h2>Delete Employees Whose Name Starts With Letter</h2>

<!-- Form to get starting letter -->
<form method="post" action="deleteEmp.jsp">
    Enter starting letter: <input type="text" name="startLetter" maxlength="1" required>
    <input type="submit" value="Delete Employees">
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
        String startLetter = request.getParameter("startLetter");
        if (startLetter != null && !startLetter.isEmpty()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);

                // Delete employees whose name starts with the given letter
                String deleteSQL = "DELETE FROM Emp WHERE Emp_Name LIKE ?";
                pstmt = conn.prepareStatement(deleteSQL);
                pstmt.setString(1, startLetter + "%");
                int deletedRows = pstmt.executeUpdate();
                out.println("<p style='color:green;'>" + deletedRows + " employee(s) deleted whose name starts with '" + startLetter + "'</p>");
                pstmt.close();

                // Fetch remaining records for report
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
        } else {
            out.println("<p style='color:red;'>Please enter a starting letter!</p>");
        }
    }
%>

</body>
</html>
