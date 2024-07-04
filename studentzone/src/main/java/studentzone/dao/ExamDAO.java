package studentzone.dao;

import studentzone.model.Exam;
import java.util.List;

public interface ExamDAO {
    void saveExam(Exam exam);
    void updateExam(Exam exam);
    Exam getExamById(int EID);
    List<Exam> getAllExams();
    int getExamIdBysetID_email(String email, int setid);
    void deleteExam(int EID);
    void updateTotalScore(int eid, int newScore);
    List<Exam> getUsersAllExams(String email);
}

