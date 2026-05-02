package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.TenderDAO;
import dao.WorkDAO;
import model.User;

@WebServlet("/TenderServlet")
public class TenderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {

            String title = req.getParameter("title");
            String desc = req.getParameter("description");
            String costStr = req.getParameter("cost");
            String deadline = req.getParameter("deadline");
            String type = req.getParameter("type");

            // Session user (admin)
            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("user");

            if (title == null || title.isEmpty() ||
                costStr == null || deadline == null ||
                type == null || user == null) {

                res.getWriter().println("Invalid input");
                return;
            }

            double cost = Double.parseDouble(costStr);

            // Default status = OPEN
            String status = "OPEN";

            boolean inserted = TenderDAO.insertTender(title, desc, cost, deadline, type, status);

            if (inserted) {

                int tenderId = TenderDAO.getLastTenderId();

                //  EMERGENCY FLOW
                if ("Emergency".equalsIgnoreCase(type)) {

                    // Direct work assignment (no bidding)
                    WorkDAO.insertWork(tenderId, "Govt Contractor", "Ongoing");

                    res.getWriter().println(
                        "<h2 style='color:#800000;text-align:center;'>Emergency Tender Created</h2>" +
                        "<p style='text-align:center;'>Work assigned directly without bidding.</p>" +
                        "<div style='text-align:center;'>" +
                        "<a href='pages/dashboard.jsp'>Go to Dashboard</a>" +
                        "</div>"
                    );

                } else {
                    res.sendRedirect("pages/tender_list.jsp");
                }

            } else {
                res.getWriter().println("Error creating tender");
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error occurred");
        }
    }
}