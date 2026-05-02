package controller;

import java.sql.ResultSet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.WorkDAO;
import dao.BidDAO;

@WebServlet("/WorkServlet")
public class WorkServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String tenderIdStr = request.getParameter("tender_id");
            String contractor = request.getParameter("contractor_name");
            String status = request.getParameter("status");

            if (tenderIdStr == null || contractor == null || contractor.isEmpty() || status == null) {
                response.getWriter().println("Invalid input");
                return;
            }

            int tenderId = Integer.parseInt(tenderIdStr);

            // If contractor not provided  auto assign L1
            if (contractor.equalsIgnoreCase("auto")) {

            	ResultSet rs = BidDAO.getLowestBid(tenderId);

                if (rs != null && rs.next()) {
                    contractor = rs.getString("contractor_name");
                } else {
                    response.getWriter().println("No bids available for L1 selection");
                    return;
                }
            }

            boolean result = WorkDAO.insertWork(tenderId, contractor, status);

            if (result) {
                response.sendRedirect("pages/work.jsp");
            } else {
                response.getWriter().println("Error in assigning work");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error occurred");
        }
    }
}