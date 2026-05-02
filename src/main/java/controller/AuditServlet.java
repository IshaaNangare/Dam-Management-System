package controller;

import java.sql.ResultSet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.AuditDAO;
import dao.BidDAO;

@WebServlet("/AuditServlet")
public class AuditServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String tenderIdStr = request.getParameter("tender_id");
            String status = request.getParameter("status");

            if (tenderIdStr == null || status == null || status.isEmpty()) {
                response.getWriter().println("Invalid input");
                return;
            }

            int tenderId = Integer.parseInt(tenderIdStr);

            // Get L1 for verification
            ResultSet rs = BidDAO.getLowestBid(tenderId);

            if (rs == null || !rs.next()) {
                response.getWriter().println("No bids found for this tender");
                return;
            }

            double l1Amount = rs.getDouble("amount");

            // Save audit record
            boolean result = AuditDAO.insertAudit(tenderId, status);

            if (result) {
                response.sendRedirect("pages/audit.jsp");
            } else {
                response.getWriter().println("Error in audit");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error occurred");
        }
    }
}