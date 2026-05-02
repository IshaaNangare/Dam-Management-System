package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AuditDAO {

    // INSERT AUDIT
    public static boolean insertAudit(int tenderId, String status) {

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO audit(tender_id, status, audit_date) VALUES(?,?,NOW())";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, tenderId);
            ps.setString(2, status);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // GET ALL AUDITS
    public static ResultSet getAllAudits() {
        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM audit ORDER BY audit_date DESC";

            PreparedStatement ps = con.prepareStatement(query);

            return ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}