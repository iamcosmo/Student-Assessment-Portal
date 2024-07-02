package studentzone.model;

public class SubjectTag {
    private int id;
    private String name;

    // Constructor
    public SubjectTag() {
    }

    public SubjectTag(int id, String name) {
        this.id = id;
        this.name = name;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // toString method
    @Override
    public String toString() {
        return "SubjectTag{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
