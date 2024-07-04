package studentzone.model;

public class UserSubjectTag {
    private String userEmail;
    private int tagId;

    public UserSubjectTag() {}

    public UserSubjectTag(String userEmail, int tagId) {
        this.userEmail = userEmail;
        this.tagId = tagId;
    }

 
    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }
}
