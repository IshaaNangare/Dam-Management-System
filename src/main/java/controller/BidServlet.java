package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.BidDAO;
import dao.TenderDAO;
import model.User;

@WebServlet("/BidServlet")
public class BidServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {

            String tenderIdStr = req.getParameter("tender_id");
            String amountStr = req.getParameter("amount");

            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("user");

            if (tenderIdStr == null || amountStr == null || user == null) {
                res.getWriter().println("Invalid input");
                return;
            }

            int tenderId = Integer.parseInt(tenderIdStr);
            double amount = Double.parseDouble(amountStr);

            // Check if tender is still OPEN
            String tenderStatus = TenderDAO.getTenderStatus(tenderId);

            if (!"OPEN".equalsIgnoreCase(tenderStatus)) {
                res.getWriter().println("Bidding closed for this tender");
                return;
            }

            String contractor = user.getUsername();

            boolean inserted = BidDAO.insertBid(tenderId, contractor, amount);

            if (inserted) {
                res.sendRedirect("pages/bid_list.jsp");
            } else {
                res.getWriter().println("Error submitting bid");
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Invalid input");
        }
    }
}