package studentzone.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import studentzone.dao.SubjectTagSetIdDao;
import studentzone.model.SubjectTagSetId;

import java.util.List;

@Service
public class SubjectTagSetIdService {

    @Autowired
    private SubjectTagSetIdDao subjectTagSetIdDao;

    public List<SubjectTagSetId> getAllSubjectTagSetIds() {
        return subjectTagSetIdDao.getAllSubjectTagSetIds();
    }

    public boolean addSubjectTagSetId(SubjectTagSetId subjectTagSetId) {
        return subjectTagSetIdDao.insertSubjectTagSetId(subjectTagSetId);
    }

    public boolean deleteSubjectTagSetId(int setId, int subjectTagId) {
        return subjectTagSetIdDao.deleteSubjectTagSetId(setId, subjectTagId);
    }
}
