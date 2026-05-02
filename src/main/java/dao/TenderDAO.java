package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TenderDAO {

    // INSERT TENDER (WITH STATUS)
    public static boolean insertTender(String title, String desc, double cost, String deadline, String type, String status) {

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO tender(title, description, cost, deadline, type, status) VALUES(?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, desc);
            ps.setDouble(3, cost);
            ps.setDate(4, java.sql.Date.valueOf(deadline));
            ps.setString(5, type);
            ps.setString(6, status);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // GET LAST INSERTED TENDER ID
    public static int getLastTenderId() {
        int id = 0;

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT MAX(id) FROM tender";
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                id = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return id;
    }

    // GET ALL TENDERS
    public static ResultSet getAllTenders() {
        try {
            Connection con = DBConnection.getConnection();
            String query = "SELECT * FROM tender";
            PreparedStatement ps = con.prepareStatement(query);
            return ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // GET SINGLE TENDER BY ID
    public static ResultSet getTenderById(int id) {
        try {
            Connection con = DBConnection.getConnection();
            String query = "SELECT * FROM tender WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            return ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // GET TENDER STATUS (FOR CUTOFF CHECK)
    public static String getTenderStatus(int id) {
        String status = "";

        try {
            Connection con = DBConnection.getConnection();
            String query = "SELECT status FROM tender WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                status = rs.getString("status");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // COUNT TENDERS
    public static int getTenderCount() {
        int count = 0;

        try {
            Connection con = DBConnection.getConnection();
            String query = "SELECT COUNT(*) FROM tender";
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