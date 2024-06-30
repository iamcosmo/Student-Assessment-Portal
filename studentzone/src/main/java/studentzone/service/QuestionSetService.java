package studentzone.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studentzone.dao.QuestionSetDao;
import studentzone.dao.QuestionsDao;
import  studentzone.model.QuestionSet;

@Service
public class QuestionSetService {
    @Autowired
    private QuestionSetDao questionSetDao;
    @Autowired
    private QuestionsDao questionsDao;

    public List<QuestionSet> getAllSets() { return questionSetDao.getAllSets(); }

    public boolean addSet(QuestionSet set) { return questionSetDao.insertSet(set); }

    public boolean deleteSet(int id) { return questionSetDao.deleteSet(id); }

    public boolean updateSet(QuestionSet set) { return questionSetDao.updateSet(set); }

    public QuestionSet getSetById(int setId) {
        return questionSetDao.getSetById(setId);
    }

    
}
