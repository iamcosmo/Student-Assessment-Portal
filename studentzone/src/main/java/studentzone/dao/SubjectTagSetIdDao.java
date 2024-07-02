package studentzone.dao;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import studentzone.model.SubjectTagSetId;

@Repository
public class SubjectTagSetIdDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<SubjectTagSetId> getAllSubjectTagSetIds() {
        String sql = "SELECT * FROM subjecttag_setid";
        return jdbcTemplate.query(sql, (rs, rowNum) -> new SubjectTagSetId(
                rs.getInt("set_id"),
                rs.getInt("subject_tag_id")
        ));
    }

    public boolean insertSubjectTagSetId(SubjectTagSetId subjectTagSetId) {
        String sql = "INSERT INTO subjecttag_setid (set_id, subject_tag_id) VALUES (?, ?)";
        return jdbcTemplate.update(sql, subjectTagSetId.getSetId(), subjectTagSetId.getSubjectTagId()) > 0;
    }

    public boolean deleteSubjectTagSetId(int setId, int subjectTagId) {
        String sql = "DELETE FROM subjecttag_setid WHERE set_id = ? AND subject_tag_id = ?";
        return jdbcTemplate.update(sql, setId, subjectTagId) > 0;
    }
}

