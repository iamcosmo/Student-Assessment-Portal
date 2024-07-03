package studentzone.model;


import java.util.Date;

public class RecentUpdate {
    private String message;
    private Date date;

    public RecentUpdate(String message, Date date) {
        this.message = message;
        this.date = date;
    }
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}

