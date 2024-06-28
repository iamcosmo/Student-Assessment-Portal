package studentzone.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import studentzone.model.User;

@Repository
public class AdminDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public boolean validateUser(User user) {
        String sql = "SELECT COUNT(*) FROM users WHERE email = ? AND password = ? AND usertype = ?";
        @SuppressWarnings("deprecation")
        int count = jdbcTemplate.queryForObject(sql, new Object[]{user.getEmail(), user.getPassword(), user.getUsertype()}, Integer.class);
        return count > 0;
    }
}
