package studentzone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import studentzone.dao.UserSubjectTagDao;

@Service
public class SubjectInterestService {
    @Autowired
    private UserSubjectTagDao userSubjectTagDao;

    public void saveSubjectInterests(String userEmail, int[] tagIds) {
        userSubjectTagDao.saveUserSubjectTags(userEmail, tagIds);
    }
}
