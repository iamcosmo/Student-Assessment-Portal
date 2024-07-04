package studentzone.dao;

import studentzone.model.UserResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class UserResultDaoImpl implements UserResultDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private static final String FIND_ALL_RESULT_BY_EMAIL_SQL = "SELECT * FROM user_results WHERE email = ?";

    @Override
    public void addUserResult(UserResult userResult) {
        String sql = "INSERT INTO user_results (eid, qsid, email, set_name, total_score, user_score) VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, userResult.getEid(), userResult.getQsid(), userResult.getEmail(), userResult.getSetName(), userResult.getTotalScore(), userResult.getUserScore());
    }

    @Override
    public UserResult getUserResultById(int eid) {
        String sql = "SELECT * FROM user_results WHERE eid = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(UserResult.class), eid);
    }

    @Override
    public List<UserResult> getAllUserResults() {
        String sql = "SELECT * FROM user_results";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(UserResult.class));
    }

    @Override
    public void updateUserResult(UserResult userResult) {
        String sql = "UPDATE user_results SET qsid = ?, email = ?, set_name = ?, total_score = ?, user_score = ? WHERE eid = ?";
        jdbcTemplate.update(sql, userResult.getQsid(), userResult.getEmail(), userResult.getSetName(), userResult.getTotalScore(), userResult.getUserScore(), userResult.getEid());
    }

    @Override
    public void deleteUserResult(int eid) {
        String sql = "DELETE FROM user_results WHERE eid = ?";
        jdbcTemplate.update(sql, eid);
    }
    
    @Override
    public List<UserResult> getAllUserResultsByEmail(String email)
    {
    	return jdbcTemplate.query(FIND_ALL_RESULT_BY_EMAIL_SQL,new BeanPropertyRowMapper<>(UserResult.class), email);
    }
    
    @Override
    public Map<Integer,Integer> getEID_QSIDByEmail(String email)
    {
    	Map<Integer,Integer> eidQsid = new HashMap<>();
    	
    	SqlRowSet rowSet = jdbcTemplate.queryForRowSet(FIND_ALL_RESULT_BY_EMAIL_SQL, email);
    	while(rowSet.next())
    	{
    		eidQsid.put(rowSet.getInt("eid"),rowSet.getInt("qsid"));    		
    	}
    		
    		return eidQsid;
    }
}
