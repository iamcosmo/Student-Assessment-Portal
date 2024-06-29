package studentzone.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;

import studentzone.model.UserDetails;


@Repository
public class UserDetailsDAOImpl implements UserDetailsDAO
{
	
	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	private static final String FIND_BY_EMAIL_SQL = "SELECT * FROM user_details WHERE Email = ?";
	private static final String CREATE_DEFAULT_PROFILE_SQL = "INSERT INTO user_details (Email,FullName,About,Country,Address,Phone,GitHubProfile,InstagramProfile,LinkedInProfile,College) VALUES(?,?,?,?,?,?,?,?,?,?)";
	
	@Override
	public UserDetails findByEmail(String email)
	{
		SqlRowSet rowSet = jdbcTemplate.queryForRowSet(FIND_BY_EMAIL_SQL, email);
		UserDetails userDetails = null;
		while (rowSet.next()) {
        	System.out.println("Email found in USER_DETAILS table!!");
            if (userDetails == null) {
            	System.out.println("Creating the userDetails object!!");
                userDetails = new UserDetails();
                userDetails.setEmail(rowSet.getString("Email"));
    			userDetails.setFullName(rowSet.getString("FullName"));
    			userDetails.setCountry(rowSet.getString("Country"));
    			userDetails.setCollege(rowSet.getString("College"));
    			userDetails.setAbout(rowSet.getString("About"));
    			userDetails.setAddress(rowSet.getString("Address"));
    			userDetails.setInstagramProfile(rowSet.getString("InstagramProfile"));
    			userDetails.setLinkedInProfile(rowSet.getString("LinkedInProfile"));
    			userDetails.setGitHubProfile(rowSet.getString("GitHubProfile"));
    			userDetails.setPhone(rowSet.getString("Phone"));
            }   
        }	
		
		if(userDetails!=null)
		{
			System.out.println("Not Null ");
						
		}
		
		return userDetails;		
	}
	
	@Override
    public void create(UserDetails userDetails) {
		String email = userDetails.getEmail();
		String fullName = userDetails.getFullName();
		String about=userDetails.getAbout();
		String address=userDetails.getAddress();
		String gitHubProfile=userDetails.getGitHubProfile();
		String linkedInProfile=userDetails.getLinkedInProfile();
		String instagramProfile=userDetails.getInstagramProfile();
		String country=userDetails.getCountry();
		String phone=userDetails.getPhone();
		String college=userDetails.getCollege();
		jdbcTemplate.update(CREATE_DEFAULT_PROFILE_SQL,email,fullName,about,country,address,phone,gitHubProfile,instagramProfile,linkedInProfile,college);			
		
	}


}
