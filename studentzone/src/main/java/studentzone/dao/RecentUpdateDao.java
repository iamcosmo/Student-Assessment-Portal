package studentzone.dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import studentzone.model.RecentUpdate;

@Repository
public class RecentUpdateDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }

    public List<RecentUpdate> getRecentUpdates() {
        String sql = "SELECT message, date FROM recent_updates ORDER BY date DESC LIMIT 4";
        return jdbcTemplate.query(sql, (rs, rowNum) -> new RecentUpdate(rs.getString("message"), rs.getTimestamp("date")));
    }
    public void deleteOldUpdates() {
        String sql = "DELETE FROM recent_updates WHERE id NOT IN (SELECT id FROM (SELECT id FROM recent_updates ORDER BY date DESC LIMIT 4) AS subquery)";
        jdbcTemplate.update(sql);
    }
    
  

    public void insertRecentUpdate(String message) {
        String sql = "INSERT INTO recent_updates (message) VALUES (?)";
        jdbcTemplate.update(sql, message);
    }
}
