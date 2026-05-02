package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class WorkDAO {

    // INSERT WORK
    public static boolean insertWork(int tenderId, String contractor, String status) {

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO work(tender_id, contractor_name, status) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, tenderId);
            ps.setString(2, contractor);
            ps.setString(3, status);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // GET ALL WORK
    public static ResultSet getAllWork() {

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM work ORDER BY id DESC";

            PreparedStatement ps = con.prepareStatement(query);

            return ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // GET WORK BY CONTRACTOR
    public static ResultSet getWorkByContractor(String contractor) {

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM work WHERE contractor_name=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, contractor);

            return ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // COUNT WORK
    public static int getWorkCount() {
        int count = 0;

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT COUNT(*) FROM work";

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

    // UPDATE STATUS
    public static boolean updateWorkStatus(int id, String status) {

        try {
            Connection con = DBConnection.getConnection();

            String query = "UPDATE work SET status=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, status);
            ps.setInt(2, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}