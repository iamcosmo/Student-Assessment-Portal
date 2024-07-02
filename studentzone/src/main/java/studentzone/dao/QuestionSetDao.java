package studentzone.dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import  org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;
import java.sql.Statement;

import studentzone.model.QuestionSet;


@Repository
public class QuestionSetDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    private static final String FIND_QUESTION_SET_ID_WITH_TAG_SQL="SELECT * FROM subjecttag_setid WHERE subject_tag_id=?)";
    private static final String FIND_QUESTION_SET_FILTERED_SQL="SELECT * FROM question_set WHERE id=?";
    
    
    public List<QuestionSet> getAllSets() {
        String sql = "SELECT * FROM question_set";
        return jdbcTemplate.query(sql, (rs, rowNum) -> new QuestionSet(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getInt("question_count") 
        ));
    }
    
    public List<QuestionSet> getTagFilteredSets(int [] userTagIds)
    {
    	List<QuestionSet> tagFilteredSets = new ArrayList<>();
    	for(int i=0; i<userTagIds.length; i++)
    	{
    		SqlRowSet rowSet = jdbcTemplate.queryForRowSet(FIND_QUESTION_SET_ID_WITH_TAG_SQL, userTagIds);
    		while(rowSet.next())
    		{
    			QuestionSet questionSetFiltered = new QuestionSet();
    			questionSetFiltered.setId(rowSet.getInt("set_id"));
    		}
    	}
    	
    	return tagFilteredSets;
    }

   public QuestionSetDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public int insertSet(QuestionSet set) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        String sql = "INSERT INTO question_set (name, question_count) VALUES (?, ?)";
        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, set.getName());
            ps.setInt(2, set.getQuestionCount());
            return ps;
        }, keyHolder);
        return keyHolder.getKey().intValue() ;
    }

    @SuppressWarnings("deprecation")
    public List<String> getTagsForSet(int setId) {
        String sql = "SELECT st.name FROM subject_tag st INNER JOIN subjecttag_setid stsi ON st.id = stsi.subject_tag_id WHERE stsi.set_id = ?";
        return jdbcTemplate.queryForList(sql, new Object[]{setId}, String.class);
    }
    public boolean deleteSet(int id) {
       
        
        String deleteSubjectTagSetIdSql = "DELETE FROM subjecttag_setid WHERE set_id = ?";
        jdbcTemplate.update(deleteSubjectTagSetIdSql, id);

        // Then delete from question_set
        String deleteQuestionSetSql = "DELETE FROM question_set WHERE id = ?";
        jdbcTemplate.update(deleteQuestionSetSql, id);
        return jdbcTemplate.update(deleteQuestionSetSql, id) > 0;
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
