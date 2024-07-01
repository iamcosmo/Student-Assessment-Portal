package studentzone.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;
import studentzone.model.SubjectInterest;

import java.util.HashSet;
import java.util.Set;

@Repository
public class SubjectInterestDAOImpl implements SubjectInterestDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private static final String SELECT_BY_EMAIL_SQL = "SELECT * FROM subject_interest WHERE student_email = ?";
    private static final String INSERT_SUBJECT_SQL = "INSERT INTO subject_interest (student_email, subjects) VALUES (?, ?)";

    

    @Override
    public SubjectInterest findByEmail(String email) {
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(SELECT_BY_EMAIL_SQL, email);
        SubjectInterest subjectInterest = null;
        Set<String> subjects = new HashSet<>();
        while (rowSet.next()) {
        	System.out.println("Email found in subject_interest table!!");
            if (subjectInterest == null) {
            	System.out.println("Creating the subjectInterest object!!");
                subjectInterest = new SubjectInterest();
                subjectInterest.setStudentEmail(rowSet.getString("student_email"));
            }
            subjects.add(rowSet.getString("subjects"));
        }
        if (subjectInterest != null) {
        	System.out.println("Adding the subjects to the subjectInterest object!!");
            subjectInterest.setSubjects(subjects);
        }
        return subjectInterest;
    }

    @Override
    public void save(SubjectInterest subjectInterest) {
        String finalSubjects = "#";
        for (String subject : subjectInterest.getSubjects()) {
        	if(finalSubjects.equals("#"))
        	{
        		finalSubjects = subject;
        	}
        	else
        	{
        		finalSubjects = finalSubjects+","+subject;
        	}
        }
        jdbcTemplate.update(INSERT_SUBJECT_SQL, subjectInterest.getStudentEmail(), finalSubjects);
    }
}
