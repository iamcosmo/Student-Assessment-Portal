package studentzone.service;


import studentzone.dao.ExamDAO;
import studentzone.model.Exam;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExamService{
	@Autowired
    private ExamDAO examDAO;

    public void setExamDAO(ExamDAO examDAO) {
        this.examDAO = examDAO;
    }

    
    public void saveExam(Exam exam) {
        examDAO.saveExam(exam);
    }

   
    public void updateExam(Exam exam) {
        examDAO.updateExam(exam);
    }

     
    public Exam getExamById(int EID) {
        return examDAO.getExamById(EID);
    }

     
    public List<Exam> getAllExams() {
        return examDAO.getAllExams();
    }

     
    public void deleteExam(int EID) {
        examDAO.deleteExam(EID);
    }
    
     
    public int getEIDbySetID_Email(String email, int setid)
    {
    	return examDAO.getExamIdBysetID_email(email, setid);
    }
    
     
    public void updateTotalScore(int eid, int newScore)
    {
    	examDAO.updateTotalScore(eid, newScore);
    }
    
    public List<Exam> getUsersAllExams(String email)
    {
    	return examDAO.getUsersAllExams(email);
    }
}

