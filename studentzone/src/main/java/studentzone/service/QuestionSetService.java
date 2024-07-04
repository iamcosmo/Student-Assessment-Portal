package studentzone.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import studentzone.dao.QuestionSetDao;
import studentzone.model.QuestionSet;
import  studentzone.model.SubjectTagSetId;
import studentzone.model.UserSubjectTag;

@Service
public class QuestionSetService {
    @Autowired
    private QuestionSetDao questionSetDao;
    @Autowired
    private SubjectTagSetIdService subjectTagSetIdService;

    public List<QuestionSet> getAllSets() { return questionSetDao.getAllSets(); }
     @Transactional
    public boolean addSetWithTags(QuestionSet set, List<Integer> subjectTags) {
        int setId = questionSetDao.insertSet(set);
        if (setId > 0) {
            for (Integer subjectTagId : subjectTags) {
                SubjectTagSetId subjectTagSetId = new SubjectTagSetId();
                subjectTagSetId.setSetId(setId);
                subjectTagSetId.setSubjectTagId(subjectTagId);
                subjectTagSetIdService.addSubjectTagSetId(subjectTagSetId);
            }
            return true;
        }
        return false;
    }
    public List<String> getTagsForSet(int setId) {
        return questionSetDao.getTagsForSet(setId);
    }

    public boolean deleteSet(int id) { return questionSetDao.deleteSet(id); }

    public boolean updateSet(QuestionSet set) { return questionSetDao.updateSet(set); }

    public QuestionSet getSetById(int setId) {
        return questionSetDao.getSetById(setId);
    }
    
    public List<QuestionSet> getFilteredQuestionSetByTagIds(List<UserSubjectTag> tagObjs)
    {
    	return questionSetDao.getFilteredQuestionSetsByTagIds(tagObjs);
    }

    
}
