package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BidDAO {

    // INSERT BID
    public static boolean insertBid(int tenderId, String contractor, double amount) {

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO bid(tender_id, contractor_name, amount) VALUES(?,?,?)";

            //  DO NOT use scrollable here
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, tenderId);
            ps.setString(2, contractor);
            ps.setDouble(3, amount);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // GET ALL BIDS
    public static ResultSet getAllBids() {
        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM bid";

            PreparedStatement ps = con.prepareStatement(
                query,
                ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY
            );

            return ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // GET BIDS BY TENDER (SCROLLABLE FIXED)
    public static ResultSet getBidsByTender(int tenderId) {
        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM bid WHERE tender_id=? ORDER BY amount ASC";

            PreparedStatement ps = con.prepareStatement(
                query,
                ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY
            );

            ps.setInt(1, tenderId);

            return ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // GET LOWEST BID (L1)
    public static ResultSet getLowestBid(int tenderId) {
        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM bid WHERE tender_id=? ORDER BY amount ASC LIMIT 1";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, tenderId);

            return ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // CHECK IF CONTRACTOR ALREADY BIDDED
    public static boolean hasAlreadyBid(int tenderId, String contractor) {

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM bid WHERE tender_id=? AND contractor_name=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, tenderId);
            ps.setString(2, contractor);

            ResultSet rs = ps.executeQuery();

            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // COUNT BIDS
    public static int getBidCount() {
        int count = 0;

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT COUNT(*) FROM bid";

            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }
}