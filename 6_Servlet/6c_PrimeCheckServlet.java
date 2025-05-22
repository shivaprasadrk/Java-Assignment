/* 6c. Build a servlet program to check the given number is prime number or not using HTML with step
by step procedure. build this according to my previous requirements */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/primecheck")
public class PrimeCheckServlet extends HttpServlet {

    // Handles POST request when form is submitted
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Parse input number from form
            int number = Integer.parseInt(request.getParameter("number"));

            // Validate input number
            if (number < 0) {
                throw new IllegalArgumentException("Number cannot be negative");
            }

            // Check if number is prime
            boolean isPrime = isPrime(number);

            // Generate HTML response with result
            out.println("<html><head><title>Prime Check Result</title>");
            out.println("<style>");
            out.println(".container { margin: 20px; padding: 20px; width: 400px; border: 1px solid #ccc; border-radius: 5px; font-family: Arial, sans-serif; }");
            out.println(".result { margin-top: 20px; }");
            out.println("</style></head><body>");
            out.println("<div class='container'>");
            out.println("<h2>Prime Number Check</h2>");
            out.println("<p>Number Entered: " + number + "</p>");

            if (isPrime) {
                out.println("<p><strong>" + number + " is a prime number.</strong></p>");
            } else {
                out.println("<p><strong>" + number + " is not a prime number.</strong></p>");
            }

            out.println("<a href='index.html'>Check Another Number</a>");
            out.println("</div></body></html>");

        } catch (NumberFormatException e) {
            displayError(out, "Please enter a valid integer number.");
        } catch (IllegalArgumentException e) {
            displayError(out, e.getMessage());
        }
    }

    // Utility method to check prime number logic
    private boolean isPrime(int num) {
        if (num <= 1) return false;
        if (num == 2) return true;
        if (num % 2 == 0) return false;
        for (int i = 3; i <= Math.sqrt(num); i += 2) {
            if (num % i == 0) return false;
        }
        return true;
    }

    // Show error page
    private void displayError(PrintWriter out, String message) {
        out.println("<html><head><title>Error</title></head><body>");
        out.println("<div style='margin: 20px; color: red;'>");
        out.println("<h2>Error</h2>");
        out.println("<p>" + message + "</p>");
        out.println("<a href='index.html'>Try Again</a>");
        out.println("</div></body></html>");
    }

    // Redirect GET requests to input form
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.html");
    }
}
