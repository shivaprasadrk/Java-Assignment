//6a. Build a servlet program to find the factorial of a number using HTML with step by step procedure.

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation to calculate the factorial of a number.
 */
@WebServlet("/factorial")
public class FactorialServlet extends HttpServlet {

    // Handles POST requests (submitted from HTML form)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set the response content type to HTML
        response.setContentType("text/html");

        // Obtain the output writer to send HTML response to the client
        PrintWriter out = response.getWriter();

        try {
            // Parse the input number from the request
            int number = Integer.parseInt(request.getParameter("number"));

            // Validate that the number is within the allowed range
            if (number < 0) throw new IllegalArgumentException("Number cannot be negative");
            if (number > 20) throw new IllegalArgumentException("Maximum allowed is 20");

            // Initialize factorial and prepare the calculation explanation
            long factorial = 1;
            StringBuilder calculation = new StringBuilder("Calculation steps:<br>");
            calculation.append(number).append("! = ");

            // Compute factorial and build the step-by-step string
            for (int i = number; i >= 1; i--) {
                factorial *= i;
                calculation.append(i);
                if (i > 1) calculation.append(" × ");
            }
            calculation.append(" = ").append(factorial);

            // Build the HTML output
            out.println("<html><head><title>Factorial Result</title><style>");
            out.println(".container { margin: 20px; padding: 20px; width: 500px; "
                      + "border: 1px solid #ccc; border-radius: 5px; }");
            out.println("</style></head><body><div class='container'>");
            out.println("<h2>Factorial Result</h2>");
            out.println("<p>Number: " + number + "</p>");
            out.println("<p>Factorial: " + factorial + "</p>");
            out.println("<p>" + calculation.toString() + "</p>");
            out.println("<a href='index.html'>Calculate Another</a>");
            out.println("</div></body></html>");

        } catch (NumberFormatException e) {
            // Handle invalid input (e.g., non-integer values)
            displayError(out, "Please enter a valid number.");
        } catch (IllegalArgumentException e) {
            // Handle out-of-range values
            displayError(out, e.getMessage());
        }
    }

    /**
     * Display an error message with a link back to the input form.
     */
    private void displayError(PrintWriter out, String message) {
        out.println("<html><head><title>Error</title></head><body>");
        out.println("<div style='margin: 20px; color: red;'>");
        out.println("<h2>Error</h2><p>" + message + "</p>");
        out.println("<a href='index.html'>Try Again</a>");
        out.println("</div></body></html>");
    }

    // Handles GET requests by redirecting to the input form
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.html");
    }
}
