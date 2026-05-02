package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.User;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String role = request.getParameter("role");

            if (username == null || password == null || role == null ||
                username.isEmpty() || password.isEmpty() || role.isEmpty()) {

                response.getWriter().println("Invalid input");
                return;
            }

            username = username.trim();
            password = password.trim();
            role = role.trim().toLowerCase();

            HttpSession session = request.getSession();

            User user = null;
            String redirectPage = "";

            // ADMIN
            if ("admin".equals(role)) {

                if ("admin".equals(username) && "admin123".equals(password)) {
                    user = new User(1, username, password, "admin");
                    redirectPage = "pages/dashboard.jsp";
                }

            // CONTRACTOR
            } else if ("contractor".equals(role)) {

                user = new User(2, username, password, "contractor");
                redirectPage = "pages/contractor_dashboard.jsp";

            // AUDITOR
            } else if ("auditor".equals(role)) {

                if ("auditor".equals(username) && "audit123".equals(password)) {
                    user = new User(3, username, password, "auditor");
                    redirectPage = "pages/audit.jsp";
                }
            }

            //  SET SESSION FIRST
            if (user != null) {
                session.setAttribute("user", user);
                session.setAttribute("role", user.getRole());
                session.setAttribute("username", user.getUsername());

                // THEN redirect
                response.sendRedirect(redirectPage);

            } else {
                response.getWriter().println("Invalid Credentials");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error occurred");
        }
    }
}