package studentzone.dao;

import studentzone.model.Response;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ResponseDAOImpl implements ResponseDAO {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void saveResponse(Response response) {
        String sql = "INSERT INTO responses (EID, QID, userResponse, match, marks) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, response.getEID(), response.getQID(), response.getUserResponse(), response.isMatch(), response.getMarks());
    }

    @SuppressWarnings("deprecation")
	@Override
    public List<Response> getResponsesByExamId(int EID) {
        String sql = "SELECT * FROM responses WHERE EID = ?";
        return jdbcTemplate.query(sql, new Object[]{EID}, new ResponseRowMapper());
    }

    @Override
    public void deleteResponsesByExamId(int EID) {
        String sql = "DELETE FROM responses WHERE EID = ?";
        jdbcTemplate.update(sql, EID);
    }

    private static final class ResponseRowMapper implements RowMapper<Response> {
        @Override
        public Response mapRow(ResultSet rs, int rowNum) throws SQLException {
            Response response = new Response();
            response.setEID(rs.getInt("EID"));
            response.setQID(rs.getInt("QID"));
            response.setUserResponse(rs.getString("userResponse").charAt(0));
            response.setMatch(rs.getBoolean("match"));
            response.setMarks(rs.getInt("marks"));
            return response;
        }
    }
}

