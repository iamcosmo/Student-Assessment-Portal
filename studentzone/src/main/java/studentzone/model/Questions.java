package studentzone.model;

public class Questions {
    private int id;
    private String question;
    private String a;
    private String b;
    private String c;
    private String d;
    private String answer;
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getQuestion() { return question; }
    public void setQuestion(String question) { this.question = question; }

    public String getA() { return a; }
    public void setA(String a) { this.a = a; }

    public String getB() { return b; }
    public void setB(String b) { this.b = b; }

    public String getC() { return c; }
    public void setC(String c) { this.c = c; }

    public String getD() { return d; }
    public void setD(String d) { this.d = d; }

    public String getAnswer() { return answer; }
    public void setAnswer(String answer) { this.answer = answer; }

    private int setId; 
    public int getSetId() { return setId; }
    public void setSetId(int setId) { this.setId = setId; }

}
