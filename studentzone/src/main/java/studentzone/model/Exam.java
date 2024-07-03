package studentzone.model;

import java.time.LocalDateTime;

public class Exam {
    private int EID;
    private String email;
    private int QSID;
    private LocalDateTime startTime;
    private LocalDateTime finishTime;
    private int score;

    // Getters and setters
    public int getEID() { return EID; }
    public void setEID(int EID) { this.EID = EID; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public int getQSID() { return QSID; }
    public void setQSID(int QSID) { this.QSID = QSID; }

    public LocalDateTime getStartTime() { return startTime; }
    public void setStartTime(LocalDateTime startTime) { this.startTime = startTime; }

    public LocalDateTime getFinishTime() { return finishTime; }
    public void setFinishTime(LocalDateTime finishTime) { this.finishTime = finishTime; }

    public int getScore() { return score; }
    public void setScore(int score) { this.score = score; }
}
