package studentzone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import studentzone.dao.SubjectInterestDAO;
import studentzone.model.SubjectInterest;

import java.util.HashSet;
import java.util.Set;

@Service
public class SubjectInterestService {

    @Autowired
    private SubjectInterestDAO subjectInterestDAO;

    public SubjectInterest findByEmail(String email) {
        return subjectInterestDAO.findByEmail(email);
    }

    public void saveSubjectInterests(String email, String[] subjects) {
        SubjectInterest existingInterest = subjectInterestDAO.findByEmail(email);
        Set<String> subjectsSet = new HashSet<>();
        for (String subject : subjects) {
            subjectsSet.add(subject);
        }
        
        if (existingInterest != null) {
            // Update existing interest if it exists
            existingInterest.setSubjects(subjectsSet);
            subjectInterestDAO.save(existingInterest);
        } else {
            // Create new subject interest if it does not exist
            SubjectInterest newInterest = new SubjectInterest();
            newInterest.setStudentEmail(email);
            newInterest.setSubjects(subjectsSet);
            subjectInterestDAO.save(newInterest);
        }
    }
}
