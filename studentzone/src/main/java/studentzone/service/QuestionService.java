package studentzone.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studentzone.dao.QuestionsDao;
import studentzone.model.Questions;

@Service
public class QuestionService {

    @Autowired
    private QuestionsDao questionsDao;

    public boolean insertQuestion(Questions question) {
        return questionsDao.insertQuestion(question);
    }

    public List<Questions> getAllRecords() {
        return questionsDao.getAllRecords();
    }

    public int deleteRecord(int qid) {
        return questionsDao.deleteRecord(qid);
    }

    public Questions getRecordById(int qid) {
        return questionsDao.getRecordById(qid);
    }

    public int updateQuestion(int qid, String newQuestion, String optA, String optB, String optC, String optD, String ans) {
        return questionsDao.updateQuestion(qid, newQuestion, optA, optB, optC, optD, ans);
    }
}
