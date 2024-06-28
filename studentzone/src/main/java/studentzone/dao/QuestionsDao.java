package studentzone.dao;

import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import studentzone.model.Questions;

@Repository
public class QuestionsDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Transactional
    public boolean insertQuestion(Questions question) {
        String sql = "INSERT INTO question (question, a, b, c, d, answer) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            int result = jdbcTemplate.update(sql, question.getQuestion(), question.getA(), question.getB(), question.getC(), question.getD(), question.getAnswer());
            return result > 0;
        } catch (DataAccessException e) {
            return false;
        }
    }


    public List<Questions> getAllRecords() {
        String sql = "SELECT * FROM question";
        return jdbcTemplate.query(sql, (ResultSet rs, int rowNum) -> {
            Questions question = new Questions();
            question.setId(rs.getInt("id")); // Make sure to include the ID
            question.setQuestion(rs.getString("question"));
            question.setA(rs.getString("a"));
            question.setB(rs.getString("b"));
            question.setC(rs.getString("c"));
            question.setD(rs.getString("d"));
            question.setAnswer(rs.getString("answer"));
            return question;
        });
    }

    public int deleteRecord(int qid) {
        String sql = "DELETE FROM question WHERE id = ?";
        return jdbcTemplate.update(sql, qid);
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
            return question;
        });
    }
    
    public int updateQuestion(int qid, String newQuestion, String optA, String optB, String optC, String optD, String answer) {
        String sql = "UPDATE question SET question = ?, a = ?, b = ?, c = ?, d = ?, answer = ? WHERE id = ?";
        return jdbcTemplate.update(sql, newQuestion, optA, optB, optC, optD, answer, qid);
    }
    
}
