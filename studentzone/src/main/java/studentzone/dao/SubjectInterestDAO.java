package studentzone.dao;

import studentzone.model.SubjectInterest;

public interface SubjectInterestDAO {
    SubjectInterest findByEmail(String email);
    void save(SubjectInterest subjectInterest);
}
