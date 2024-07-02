package studentzone.model;

public class SubjectTagSetId {
    private int setId;
    private int subjectTagId;

    // Constructor
    public SubjectTagSetId() {
    }

    public SubjectTagSetId(int setId, int subjectTagId) {
        this.setId = setId;
        this.subjectTagId = subjectTagId;
    }

    // Getters and Setters
    public int getSetId() {
        return setId;
    }

    public void setSetId(int setId) {
        this.setId = setId;
    }

    public int getSubjectTagId() {
        return subjectTagId;
    }

    public void setSubjectTagId(int subjectTagId) {
        this.subjectTagId = subjectTagId;
    }

    // toString method
    @Override
    public String toString() {
        return "SubjectTagSetId{" +
                "setId=" + setId +
                ", subjectTagId=" + subjectTagId +
                '}';
    }
}
