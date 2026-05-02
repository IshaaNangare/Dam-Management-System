package model;

import java.sql.Timestamp;

public class Audit {

    private int id;
    private int tenderId;
    private String status;
    private Timestamp auditDate;

    public Audit() {}

    public Audit(int id, int tenderId, String status, Timestamp auditDate) {
        this.id = id;
        this.tenderId = tenderId;
        this.status = status;
        this.auditDate = auditDate;
    }

    public int getId() {
        return id;
    }

    public int getTenderId() {
        return tenderId;
    }

    public String getStatus() {
        return status;
    }

    public Timestamp getAuditDate() {
        return auditDate;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTenderId(int tenderId) {
        this.tenderId = tenderId;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setAuditDate(Timestamp auditDate) {
        this.auditDate = auditDate;
    }
}