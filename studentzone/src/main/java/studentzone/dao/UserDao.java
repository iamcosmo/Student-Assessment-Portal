package studentzone.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import studentzone.model.User;

@Repository
public class UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Transactional
    public void registerUser(String name, String email, String dob, String password, int usertype) {
        String sql = "INSERT INTO users (name, email, dob, password, usertype) VALUES (?, ?, ?, ?, ?)";
        try {
            jdbcTemplate.update(sql, name, email, dob, password, usertype);
        } catch (DuplicateKeyException e) {
            throw new RuntimeException("Email already exists", e);
        } catch (DataAccessException e) {
            String message = e.getRootCause().getMessage();
            if (message.contains("Date of birth indicates user is younger than 16 years")) {
                throw new RuntimeException("User is younger than 16 years", e);
            } else if (message.contains("check_password_length")) {
                throw new RuntimeException("Password length must be between 8 and 12 characters", e);
            } else if (message.contains("check_password_uppercase")) {
                throw new RuntimeException("Password must contain at least one uppercase letter", e);
            } else if (message.contains("check_password_lowercase")) {
                throw new RuntimeException("Password must contain at least one lowercase letter", e);
            } else if (message.contains("check_password_digit")) {
                throw new RuntimeException("Password must contain at least one digit", e);
            } else if (message.contains("check_password_special")) {
                throw new RuntimeException("Password must contain at least one special character", e);
            } else {
                throw new RuntimeException("Error registering user", e);
            }
        }
    }
    
    public User validateUser(String email, String password, int usertype) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ? AND usertype = ?";
        try {
            return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> {
                User user = new User();
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setDob(rs.getString("dob"));
                user.setPassword(rs.getString("password"));
                user.setUsertype(rs.getInt("usertype"));
                return user;
            }, email, password, usertype);
        } catch (DataAccessException e) {
            return null;
        }
    }
}
