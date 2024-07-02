package studentzone.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import studentzone.model.UserSubjectTag;


@Repository
public class UserSubjectTagDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    private static final String FIND_USER_IN_SUBJECT_TAG_TABLE = "SELECT * FROM user_subject_tag WHERE user_email=?";
    private static final String INSERT_USER_SUBJECT_TAG_SQL = 
        "INSERT INTO user_subject_tag (user_email, tag_id) VALUES (?, ?)";
    private static final String DELETE_USER_SUBJECT_TAGS_SQL = 
        "DELETE FROM user_subject_tag WHERE user_email = ?";
    
    public List<UserSubjectTag> findUserTags(String email)
    {
    	SqlRowSet rowSet = jdbcTemplate.queryForRowSet(FIND_USER_IN_SUBJECT_TAG_TABLE, email);
    	List<UserSubjectTag> userSubTagList = new ArrayList<>();

    	while(rowSet.next())
    	{
    		UserSubjectTag userSubjectTag = new UserSubjectTag();
    			 
			userSubjectTag.setTagId(rowSet.getInt("tag_id"));
			userSubjectTag.setUserEmail(rowSet.getString("user_email"));
			userSubTagList.add(userSubjectTag);
    		
    	}
    	
    	return userSubTagList;
    	
    }

    public void saveUserSubjectTags(String userEmail, int[] tagIds) {
    	
    	List<UserSubjectTag> userSubTagList = findUserTags(userEmail);
    	
    	for (UserSubjectTag userSubTag : userSubTagList) {
    	    String uEmail = userSubTag.getUserEmail();
    	    jdbcTemplate.update(DELETE_USER_SUBJECT_TAGS_SQL, uEmail);
    	}
    	    	
        // Insert new subject tags
        for (int tagId : tagIds) {
            jdbcTemplate.update(INSERT_USER_SUBJECT_TAG_SQL, userEmail, tagId);
        }
    }
}
