package studentzone.model;

public class Response {
    private int EID;
    private int QID;
    private char userResponse;
    private boolean match;
    private int marks;

    // Getters and setters
    public int getEID() { return EID; }
    public void setEID(int EID) { this.EID = EID; }

    public int getQID() { return QID; }
    public void setQID(int QID) { this.QID = QID; }

    public char getUserResponse() { return userResponse; }
    public void setUserResponse(char userResponse) { this.userResponse = userResponse; }

    public boolean isMatch() { return match; }
    public void setMatch(boolean match) { this.match = match; }

    public int getMarks() { return marks; }
    public void setMarks(int marks) { this.marks = marks; }
}
