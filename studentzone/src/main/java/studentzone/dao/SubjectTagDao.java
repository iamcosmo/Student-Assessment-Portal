package studentzone.dao;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import studentzone.model.SubjectTag;
import studentzone.service.RecentUpdateService;

@Repository
public class SubjectTagDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

      @Autowired
    private RecentUpdateService recentUpdateService;
  

    public List<SubjectTag> getAllSubjectTags() {
        String sql = "SELECT * FROM subject_tag";
        return jdbcTemplate.query(sql, (rs, rowNum) -> new SubjectTag(rs.getInt("id"), rs.getString("name")));
    }
    


    public boolean insertSubjectTag(SubjectTag subjectTag) {
        String sql = "INSERT INTO subject_tag (name) VALUES (?)";
        boolean result = jdbcTemplate.update(sql, subjectTag.getName()) > 0;
        if (result) {
            recentUpdateService.addRecentUpdate("Added new subject tag: " + subjectTag.getName());
        }
        return result;
    }

    public boolean deleteSubjectTag(int id) {
        String getNameSql = "SELECT name FROM subject_tag WHERE id = ?";
        @SuppressWarnings("deprecation")
        String name = jdbcTemplate.queryForObject(getNameSql, new Object[]{id}, String.class);
        String sql = "DELETE FROM subject_tag WHERE id = ?";
        boolean result = jdbcTemplate.update(sql, id) > 0;
        if (result) {
            recentUpdateService.addRecentUpdate("Deleted subject tag: " + name);
        }
        return result;
    }

    public boolean updateSubjectTag(SubjectTag subjectTag) {
        String sql = "UPDATE subject_tag SET name = ? WHERE id = ?";
        boolean result = jdbcTemplate.update(sql, subjectTag.getName(), subjectTag.getId()) > 0;
        if (result) {
            recentUpdateService.addRecentUpdate("Updated subject tag: " + subjectTag.getName());
        }
        return result;
    }

    @SuppressWarnings("deprecation")
    public SubjectTag getSubjectTagById(int id) {
        String sql = "SELECT * FROM subject_tag WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, rowNum) -> {
            SubjectTag subjectTag = new SubjectTag();
            subjectTag.setId(rs.getInt("id"));
            subjectTag.setName(rs.getString("name"));
            return subjectTag;
        });
    }
    public boolean isSubjectTagInUse(int tagId) {
        String query = "SELECT COUNT(*) FROM subjecttag_setid WHERE subject_tag_id = ?";
        int count = jdbcTemplate.queryForObject(query, Integer.class, tagId);
        return count > 0;
    }
}
