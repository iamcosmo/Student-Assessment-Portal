package studentzone.model;

public class SubjectTagSetId {
    private int setId;
    private int subjectTagId;


    public SubjectTagSetId() {
    }

    public SubjectTagSetId(int setId, int subjectTagId) {
        this.setId = setId;
        this.subjectTagId = subjectTagId;
    }

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

    @Override
    public String toString() {
        return "SubjectTagSetId{" +
                "setId=" + setId +
                ", subjectTagId=" + subjectTagId +
                '}';
    }
}
