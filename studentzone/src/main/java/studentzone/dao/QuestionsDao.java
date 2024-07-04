package studentzone.dao;

import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import studentzone.model.Questions;
import studentzone.service.RecentUpdateService;

@Repository
public class QuestionsDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
        @Autowired
    private RecentUpdateService recentUpdateService;

public boolean insertQuestion(Questions question) {
    String sql = "INSERT INTO question (question, a, b, c, d, answer, set_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
    try {
        int result = jdbcTemplate.update(sql, question.getQuestion(), question.getA(), question.getB(), question.getC(), question.getD(), question.getAnswer(), question.getSetId());
        if (result > 0) {
            incrementQuestionCount(question.getSetId());
            recentUpdateService.addRecentUpdate("Added new question in set ID: " + question.getSetId());
            return true;
        } else {
            return false;
        }
    } catch (DataAccessException e) {
        return false;
    }
}

    @SuppressWarnings("deprecation")
    public List<Questions> getAllRecordsBySetId(int setId) {
        String sql = "SELECT * FROM question WHERE set_id = ?";
        return jdbcTemplate.query(sql, new Object[]{setId}, (ResultSet rs, int rowNum) -> {
            Questions question = new Questions();
            question.setId(rs.getInt("id")); 
            question.setQuestion(rs.getString("question"));
            question.setA(rs.getString("a"));
            question.setB(rs.getString("b"));
            question.setC(rs.getString("c"));
            question.setD(rs.getString("d"));
            question.setAnswer(rs.getString("answer"));
            question.setSetId(rs.getInt("set_id"));
            return question;
        });
    }

    public List<Questions> getAllRecords() {
        String sql = "SELECT * FROM question";
        return jdbcTemplate.query(sql, (ResultSet rs, int rowNum) -> {
            Questions question = new Questions();
            question.setId(rs.getInt("id"));
            question.setQuestion(rs.getString("question"));
            question.setA(rs.getString("a"));
            question.setB(rs.getString("b"));
            question.setC(rs.getString("c"));
            question.setD(rs.getString("d"));
            question.setAnswer(rs.getString("answer"));
            question.setSetId(rs.getInt("set_id"));
            return question;
        });
    }



    @SuppressWarnings("deprecation")
    public Questions getRecordById(int qid) {
        String sql = "SELECT * FROM question WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{qid}, (rs, rowNum) -> {
            Questions question = new Questions();
            question.setId(rs.getInt("id"));
            question.setQuestion(rs.getString("question"));
            question.setA(rs.getString("a"));
            question.setB(rs.getString("b"));
            question.setC(rs.getString("c"));
            question.setD(rs.getString("d"));
            question.setAnswer(rs.getString("answer"));
            question.setSetId(rs.getInt("set_id"));
            return question;
        });
    }
    public int updateQuestion(int qid, String newQuestion, String optA, String optB, String optC, String optD, String answer, int set_id) {
        String sql = "UPDATE question SET question = ?, a = ?, b = ?, c = ?, d = ?, answer = ?, set_id = ? WHERE id = ?";
        recentUpdateService.addRecentUpdate("Updated question in set ID: " + set_id);
        return jdbcTemplate.update(sql, newQuestion, optA, optB, optC, optD, answer, set_id, qid); // Include set_id parameter
    }
    
    @SuppressWarnings("deprecation")
    public Map<Integer, Character> getAnswersBySetId(int setId)
    {
    	String sql = "SELECT q.id AS id, q.answer AS answer " +
                "FROM question q " +
                "JOIN question_set qs ON q.set_id = qs.id " +
                "WHERE qs.id = ?";

	   
	   List<Questions> questions = jdbcTemplate.query(sql, new Object[]{setId}, new BeanPropertyRowMapper<>(Questions.class));
	
	   Map<Integer, Character> questionAnswerMap = new HashMap<>();
	
	   for (Questions question : questions) {
	       questionAnswerMap.put(question.getId(), question.getAnswer().charAt(0)); // Assuming answer is stored as a single character
	   }
	
	   return questionAnswerMap;
    }

@SuppressWarnings("deprecation")
public int deleteRecord(int qid) {
    String getSetIdSql = "SELECT set_id FROM question WHERE id = ?";
    int setId = jdbcTemplate.queryForObject(getSetIdSql, new Object[]{qid}, Integer.class);
    String sql = "DELETE FROM question WHERE id = ?";
    int result = jdbcTemplate.update(sql, qid) ;
    if (result>0) {
        recentUpdateService.addRecentUpdate("Deleted question from set ID: " + setId);
    }
    return result;
}

private void incrementQuestionCount(int setId) {
    String sql = "UPDATE question_set SET question_count = question_count + 1 WHERE id = ?";
    jdbcTemplate.update(sql, setId);
}

private void decrementQuestionCount(int setId) {
    String sql = "UPDATE question_set SET question_count = question_count - 1 WHERE id = ?";
    jdbcTemplate.update(sql, setId);
}
public void deleteQuestionsBySetId(int setId) {
    String sql = "DELETE FROM question WHERE set_id = ?";
    jdbcTemplate.update(sql, setId);
}
    
}
