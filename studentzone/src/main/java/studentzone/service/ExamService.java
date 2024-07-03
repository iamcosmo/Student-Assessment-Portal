package studentzone.service;


import studentzone.model.Exam;

import java.util.List;

public interface ExamService {
    void saveExam(Exam exam);
    void updateExam(Exam exam);
    Exam getExamById(int EID);
    List<Exam> getAllExams();
    void deleteExam(int EID);
}

