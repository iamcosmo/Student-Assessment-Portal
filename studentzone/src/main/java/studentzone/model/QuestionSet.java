package studentzone.model;

public class QuestionSet {
    private int id;
    private String name;
    private int questionCount; 


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

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public int getQuestionCount() { return questionCount; }
    public void setQuestionCount(int questionCount) { this.questionCount = questionCount; }
}
