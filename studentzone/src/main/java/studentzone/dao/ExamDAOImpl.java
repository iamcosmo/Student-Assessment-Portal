package studentzone.dao;

import studentzone.model.Exam;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ExamDAOImpl implements ExamDAO {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void saveExam(Exam exam) {
        String sql = "INSERT INTO exams (email, QSID, startTime, finishTime, score) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, exam.getEmail(), exam.getQSID(), exam.getStartTime(), exam.getFinishTime(), exam.getScore());
    }

    @Override
    public void updateExam(Exam exam) {
        String sql = "UPDATE exams SET email = ?, QSID = ?, startTime = ?, finishTime = ?, score = ? WHERE EID = ?";
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
