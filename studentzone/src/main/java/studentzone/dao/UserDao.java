package studentzone.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import studentzone.model.User;

@Repository
public class UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    private static final String FIND_USER_PASSWORD_SQL="SELECT * FROM users WHERE email=?";
    private static final String UPDATE_USER_PASSWORD_SQL="UPDATE users SET password = ? WHERE email= ?";

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
                user.setPassword("");
                user.setUsertype(rs.getInt("usertype"));
                return user;
            }, email, password, usertype);
        } catch (DataAccessException e) {
            return null;
        }
    }
    
    public boolean validateUserPassword(String email, String currentPassword) {
        boolean validated = false;
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(FIND_USER_PASSWORD_SQL, email);
        while (rowSet.next()) {
        	
            if (currentPassword.equals(rowSet.getString("password"))) { // Correct column name
                
            	validated = true;
            }
        }
        return validated;
    }    
    
    public String changePassword(String email, String newPassword)
    {
    	try {
    		
    		jdbcTemplate.update(UPDATE_USER_PASSWORD_SQL,newPassword,email); 	    	
    	}
    	catch (DataIntegrityViolationException e) {
            // Handle constraint violation, such as invalid password format
            System.err.println("Password update failed due to constraint violation: " + e.getMessage());
            return "Constraint violated"+e.getMessage();
        } catch (BadSqlGrammarException e) {
            // Handle SQL syntax errors
            System.err.println("Password update failed due to SQL syntax error: " + e.getMessage());
            return "SQL syntax error"+e.getMessage();
        } catch (DataAccessException e) {
            // Handle general database access errors
            System.err.println("Password update failed due to database access error: " + e.getMessage());
            return "Database access failed: "+e.getMessage();
        } catch (IllegalArgumentException e) {
            // Handle case where email does not exist or password validation failure
            System.err.println(e.getMessage());
            return "User Not Found: "+e.getMessage();
        } catch (Exception e) {
            // Handle any other unexpected exceptions
            System.err.println("Password update failed due to an unexpected error: " + e.getMessage());
            return "Update Failed";
        }
    	
    	return "updated";
    }
}
