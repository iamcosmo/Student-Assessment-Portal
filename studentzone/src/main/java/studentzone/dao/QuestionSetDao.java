package studentzone.dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import  org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;
import java.sql.Statement;

import studentzone.model.QuestionSet;
import studentzone.model.UserSubjectTag;
import studentzone.service.RecentUpdateService;


@Repository
public class QuestionSetDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
     @Autowired
    private RecentUpdateService recentUpdateService;
    
    
    public List<QuestionSet> getAllSets() {
        String sql = "SELECT * FROM question_set";
        return jdbcTemplate.query(sql, (rs, rowNum) -> new QuestionSet(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getInt("question_count") 
        ));
    }
    
    public List<QuestionSet> getFilteredQuestionSetsByTagIds(List<UserSubjectTag> userSubjectTags) {
  
        List<Integer> tagIds = new ArrayList<>();
        for (UserSubjectTag userSubjectTag : userSubjectTags) {
            tagIds.add(userSubjectTag.getTagId());
        }

        String tagIdsString = tagIds.stream()
                                    .map(String::valueOf)
                                    .collect(Collectors.joining(", "));

        String sql = "SELECT DISTINCT qs.id, qs.name, qs.question_count " +
                     "FROM question_set qs " +
                     "JOIN subjecttag_setid st ON qs.id = st.set_id " +
                     "WHERE st.subject_tag_id IN (" + tagIdsString + ")";

        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql);

        List<QuestionSet> questionSets = new ArrayList<>();
        while (rowSet.next()) {
            QuestionSet questionSet = new QuestionSet();
            questionSet.setId(rowSet.getInt("id"));
            questionSet.setName(rowSet.getString("name"));
            questionSet.setQuestionCount(rowSet.getInt("question_count"));
            questionSets.add(questionSet);
        }

        return questionSets;
    }

   public QuestionSetDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public int insertSet(QuestionSet set) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        String sql = "INSERT INTO question_set (name, question_count) VALUES (?, ?)";
            recentUpdateService.addRecentUpdate("Added new question set: " + set.getName());
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

    @SuppressWarnings("deprecation")
    public boolean deleteSet(int id) {
        String deleteSubjectTagSetIdSql = "DELETE FROM subjecttag_setid WHERE set_id = ?";
       
        String getNameSql = "SELECT name FROM question_set WHERE id = ?";
        String name = jdbcTemplate.queryForObject(getNameSql, new Object[]{id}, String.class);
            recentUpdateService.addRecentUpdate("Deleted question set: " + name);//not checked
        jdbcTemplate.update(deleteSubjectTagSetIdSql, id);

        String deleteQuestionSetSql = "DELETE FROM question_set WHERE id = ?";
        
        jdbcTemplate.update(deleteQuestionSetSql, id);
        return jdbcTemplate.update(deleteQuestionSetSql, id) > 0;
    }
  


    public boolean updateSet(QuestionSet questionSet) {
        String sql = "UPDATE question_set SET name = ? WHERE id = ?";
        boolean result = jdbcTemplate.update(sql, questionSet.getName(), questionSet.getId()) > 0;
        if (result) {
            recentUpdateService.addRecentUpdate("Updated question set: " + questionSet.getName());
        }
        return result;
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
