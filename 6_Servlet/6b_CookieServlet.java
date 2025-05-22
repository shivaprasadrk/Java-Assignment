/*
6b. Build a servlet program to create a cookie to get your name through a text box and press the submit
button (through HTML) to display the message:
"Welcome back your name!", 
"You have visited this page n times" (n = number of visits),
and demonstrate the expiry of the cookie also.
*/


// Step 1: Required imports
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

// Step 2: Create servlet class and map it to a URL
@WebServlet("/CookieServlet")
public class CookieServlet extends HttpServlet {

    // Counter to simulate visit count (Note: not reliable per user across multiple requests)
    int count = 0;

    // Step 3: Handle GET requests
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Step 4: Create a cookie from user input if provided
        String userName = request.getParameter("userName");
        if (userName != null && !userName.isEmpty()) {
            // Create a new cookie storing the username
            Cookie userCookie = new Cookie("user", userName);

            // Step 5: Set cookie properties (expire after 60 seconds)
            userCookie.setMaxAge(60); // 1 minute expiry
            userCookie.setPath("/");

            // Step 6: Add cookie to response
            response.addCookie(userCookie);
        }

        // Step 7: Read existing cookies to check if the user has visited before
        Cookie[] cookies = request.getCookies();
        String existingUser = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("user")) {
                    existingUser = cookie.getValue();
                    break;
                }
            }
        }

        // Step 8: Generate HTML response based on presence of cookie
        out.println("<html>");
        out.println("<head><title>Cookie Example</title></head>");
        out.println("<body>");

        if (existingUser != null) {
            count += 1; // Count increases per servlet load (not persistent per user)
            out.println("<font color=blue><h2>Welcome back, " + existingUser + "!</h2></font>");
            out.println("<font color=magenta><h2>You have visited this page " + count + " times!</h2></font>");
        } else {
            // Show input form if user cookie not found
            out.println("<h2>Welcome Guest!</h2>");
            out.println("<form action='CookieServlet' method='get'>");
            out.println("Enter your name: <input type='text' name='userName'>");
            out.println("<input type='submit' value='Submit'>");
            out.println("</form>");
        }

        // Optional: Uncomment to add a logout (cookie removal) feature
        /*
        out.println("<form action='CookieServlet' method='post'>");
        out.println("<input type='submit' value='Logout'>");
        out.println("</form>");
        */

        out.println("</body></html>");
    }

    // Step 10: Handle POST requests (used to delete the cookie, e.g., on logout)
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Delete the user cookie by setting its age to 0
        Cookie cookie = new Cookie("user", "");
        cookie.setMaxAge(0); // Immediate expiration
        cookie.setPath("/");
        response.addCookie(cookie);

        // Redirect user back to the servlet page
        response.sendRedirect("CookieServlet");
    }
}
