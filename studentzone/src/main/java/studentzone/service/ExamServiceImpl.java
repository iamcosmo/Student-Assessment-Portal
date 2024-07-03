package studentzone.service;

import studentzone.dao.ExamDAO;
import studentzone.model.Exam;

import java.util.List;

public class ExamServiceImpl implements ExamService {

    private ExamDAO examDAO;

    public void setExamDAO(ExamDAO examDAO) {
        this.examDAO = examDAO;
    }

    @Override
    public void saveExam(Exam exam) {
        examDAO.saveExam(exam);
    }

    @Override
    public void updateExam(Exam exam) {
        examDAO.updateExam(exam);
    }

    @Override
    public Exam getExamById(int EID) {
        return examDAO.getExamById(EID);
    }

    @Override
    public List<Exam> getAllExams() {
        return examDAO.getAllExams();
    }

    @Override
    public void deleteExam(int EID) {
        examDAO.deleteExam(EID);
    }
}
