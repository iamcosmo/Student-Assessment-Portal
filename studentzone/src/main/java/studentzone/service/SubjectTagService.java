package studentzone.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studentzone.dao.SubjectTagDao;
import studentzone.model.SubjectTag;

@Service
public class SubjectTagService {

    @Autowired
    private SubjectTagDao subjectTagDao;
    

    public List<SubjectTag> getAllSubjectTags() {
        return subjectTagDao.getAllSubjectTags();
    }
    

    public boolean addSubjectTag(SubjectTag subjectTag) {
        return subjectTagDao.insertSubjectTag(subjectTag);
    }

    public boolean deleteSubjectTag(int id) {
        return subjectTagDao.deleteSubjectTag(id);
    }

    public boolean updateSubjectTag(SubjectTag subjectTag) {
        return subjectTagDao.updateSubjectTag(subjectTag);
    }

    public SubjectTag getSubjectTagById(int id) {
        return subjectTagDao.getSubjectTagById(id);
    }
    public boolean isSubjectTagInUse(int id) {
        return subjectTagDao.isSubjectTagInUse(id);
    }
}
