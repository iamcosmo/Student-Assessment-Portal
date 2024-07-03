package studentzone.model;

import java.util.Set;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Table;

@Entity
@Table(name = "subject_interest")
public class SubjectInterest {
    @Id
    @Column(name = "student_email", nullable = false)
    private String studentEmail;

    @ElementCollection
    @CollectionTable(name = "subject_interest", joinColumns = @JoinColumn(name = "student_email"))
    @Column(name = "subjects")
    private Set<String> subjects;
    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }

    public Set<String> getSubjects() {
        return subjects;
    }

    public void setSubjects(Set<String> subjects) {
        this.subjects = subjects;
    }
}
