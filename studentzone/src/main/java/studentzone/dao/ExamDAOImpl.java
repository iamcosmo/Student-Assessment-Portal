package studentzone.dao;

import studentzone.model.Exam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class ExamDAOImpl implements ExamDAO {

    private JdbcTemplate jdbcTemplate;
    
    private static final String MATCH_EXAM_SQL = "SELECT * FROM exams WHERE email = ? AND QSID = ?";

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void saveExam(Exam exam) {
    	boolean check = false;
    	SqlRowSet rowSet = jdbcTemplate.queryForRowSet(MATCH_EXAM_SQL, exam.getEmail(), exam.getQSID());
    	while(rowSet.next())
    	{
    		if((rowSet.getString("email")).equals(exam.getEmail())&&rowSet.getInt("QSID")==exam.getQSID())
    		{
    			System.out.println("Cannot Insert same data again!!");
    			check =true;
    			break;
    		}
    	}
    	if(check)
    	{
    		return;
    	}
    	
        String sql = "INSERT INTO exams (email, QSID, start_time, finish_time, score) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, exam.getEmail(), exam.getQSID(), exam.getStartTime(), exam.getFinishTime(), exam.getScore());
    }

    @Override
    public void updateExam(Exam exam) {
        String sql = "UPDATE exams SET email = ?, QSID = ?, start_time = ?, finish_time = ?, score = ? WHERE EID = ?";
        jdbcTemplate.update(sql, exam.getEmail(), exam.getQSID(), exam.getStartTime(), exam.getFinishTime(), exam.getScore(), exam.getEID());
    }

	@SuppressWarnings("deprecation")
	@Override
    public Exam getExamById(int EID) {
        String sql = "SELECT * FROM exams WHERE EID = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{EID}, new ExamRowMapper());
    }

    @Override
    public List<Exam> getAllExams() {
        String sql = "SELECT * FROM exams";
        return jdbcTemplate.query(sql, new ExamRowMapper());
    }

    @Override
    public void deleteExam(int EID) {
        String sql = "DELETE FROM exams WHERE EID = ?";
        jdbcTemplate.update(sql, EID);
    }
    
    @Override
    public int getExamIdBysetID_email(String email, int setid)
    {
    	 String sql = "SELECT EID FROM exams WHERE QSID = ? AND email=?";
         
         // Execute query and retrieve the EID
    	 try
    	 {
    		 return jdbcTemplate.queryForObject(sql, Integer.class, setid, email);
    	 }
    	 catch(EmptyResultDataAccessException e)
    	 {
    		 return -1;
    	 }
    }
    
    @Override
    public void updateTotalScore(int eid, int newScore)
    {
    	try {
            String sql = "UPDATE exams SET score = ? WHERE EID = ?";
            int rowsUpdated = jdbcTemplate.update(sql, newScore, eid);
            System.out.println(rowsUpdated + " row(s) updated for EID " + eid + ". New score: " + newScore);
        } catch (Exception e) {
            System.err.println("Error updating score for EID " + eid + ": " + e.getMessage());
            e.printStackTrace(); // Print stack trace for detailed error analysis
        }
    }

    private static final class ExamRowMapper implements RowMapper<Exam> {
        @Override
        public Exam mapRow(ResultSet rs, int rowNum) throws SQLException {
            Exam exam = new Exam();
            exam.setEID(rs.getInt("EID"));
            exam.setEmail(rs.getString("email"));
            exam.setQSID(rs.getInt("QSID"));
            exam.setStartTime(rs.getTimestamp("startTime").toLocalDateTime());
            exam.setFinishTime(rs.getTimestamp("finishTime").toLocalDateTime());
            exam.setScore(rs.getInt("score"));
            return exam;
        }
    }
    
    
}
