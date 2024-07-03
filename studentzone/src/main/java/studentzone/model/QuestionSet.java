package studentzone.model;

import java.util.List;

public class QuestionSet {
    private int id;
    private String name;
    private int questionCount;
    private List<Integer> subjectTags; 
    private transient List<String> tags;

    public QuestionSet() {}

    public QuestionSet(int id, String name, int questionCount) {
        this.id = id;
        this.name = name;
        this.questionCount = questionCount;
    }

    public QuestionSet(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public int getQuestionCount() { return questionCount; }
    public void setQuestionCount(int questionCount) { this.questionCount = questionCount; }
    
    public List<Integer> getSubjectTags() {
        return subjectTags;
    }

    public void setSubjectTags(List<Integer> subjectTags) {
        this.subjectTags = subjectTags;
    }
    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }
}
