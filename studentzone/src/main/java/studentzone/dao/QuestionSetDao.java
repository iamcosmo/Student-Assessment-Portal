package studentzone.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import  org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import studentzone.model.QuestionSet;

@Repository
public class QuestionSetDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    // public List<QuestionSet> getAllSets() {
    //     String sql = "SELECT * FROM question_set";
    //     return jdbcTemplate.query(sql, (rs, rowNum) -> new QuestionSet(rs.getInt("id"), rs.getString("name")));
    // }
    public List<QuestionSet> getAllSets() {
        String sql = "SELECT * FROM question_set";
        return jdbcTemplate.query(sql, (rs, rowNum) -> new QuestionSet(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getInt("question_count") 
        ));
    }

    public boolean insertSet(QuestionSet set) {
        String sql = "INSERT INTO question_set (name) VALUES (?)";
        return jdbcTemplate.update(sql, set.getName()) > 0;
    }

    public boolean deleteSet(int id) {
       
        String deleteQuestionsSql = "DELETE FROM question WHERE set_id = ?";
        jdbcTemplate.update(deleteQuestionsSql, id);
        
        
        String deleteSetSql = "DELETE FROM question_set WHERE id = ?";
        return jdbcTemplate.update(deleteSetSql, id) > 0;
    }
  

    public boolean updateSet(QuestionSet set) {
        String sql = "UPDATE question_set SET name = ? WHERE id = ?";
        return jdbcTemplate.update(sql, set.getName(), set.getId()) > 0;
    }
    @SuppressWarnings("deprecation")
    public QuestionSet getSetById(int id) {
        String sql = "SELECT * FROM question_set WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new RowMapper<QuestionSet>() {
            @Override
            public QuestionSet mapRow(ResultSet rs, int rowNum) throws SQLException {
                QuestionSet set = new QuestionSet();
                set.setId(rs.getInt("id"));
                set.setName(rs.getString("name"));
                set.setQuestionCount(rs.getInt("question_count"));
                return set;
            }
        });
    }
    public void incrementQuestionCount(int setId) {
        String sql = "UPDATE question_set SET question_count = question_count + 1 WHERE id = ?";
        jdbcTemplate.update(sql, setId);
    }

    public void decrementQuestionCount(int setId) {
        String sql = "UPDATE question_set SET question_count = question_count - 1 WHERE id = ?";
        jdbcTemplate.update(sql, setId);
    }
    
}
