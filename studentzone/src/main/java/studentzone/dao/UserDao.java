package studentzone.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.dao.DataAccessException;

@Repository
public class UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Transactional
    public void registerUser(String name, String email, String dob, String password) {
        String sql = "INSERT INTO users (name, email, dob, password) VALUES (?, ?, ?, ?)";
        try {
            jdbcTemplate.update(sql, name, email, dob, password);
        } catch (DataAccessException e) {
            // Log the exception and handle it as needed
            e.printStackTrace();
            // You can throw a custom exception or handle it based on your application's requirements
            throw new RuntimeException("Error registering user", e);
        }
    }
}
