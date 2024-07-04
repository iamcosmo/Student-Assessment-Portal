package studentzone.model;

public class SubjectTag {
    private int id;
    private String name;
    public SubjectTag() {
    }

    public SubjectTag(int id, String name) {
        this.id = id;
        this.name = name;
    }
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

    @Override
    public String toString() {
        return "SubjectTag{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
