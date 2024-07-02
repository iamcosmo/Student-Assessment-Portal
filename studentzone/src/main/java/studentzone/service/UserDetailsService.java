package studentzone.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studentzone.dao.UserDetailsDAO;
import studentzone.model.UserDetails;


@Service
public class UserDetailsService {
	
	@Autowired
    private UserDetailsDAO userDetailsDAO;
	
	public UserDetails findByEmail(String email) {
        return userDetailsDAO.findByEmail(email);
    }
	
	public void createUserProfile(String email, String fullName)
	{
		UserDetails userDetails = userDetailsDAO.findByEmail(email);
		if(userDetails==null)
		{
			String about="Education is the evergreen and so is my Future!";
			String address="Currently in a Learning Hub";
			String gitHubProfile="https://github.com/#";
			String linkedInProfile="https://linkedin.com/#";
			String instagramProfile="https://instagram.com/#";
			String country="INDIA";
			String phone="9999999999";
			String college="Silicon University";
			userDetails = new UserDetails(email.toLowerCase(),fullName,about,country,address,phone,gitHubProfile,instagramProfile,linkedInProfile,college);
			userDetailsDAO.create(userDetails);
		}
	}
	
	public UserDetails updateUserProfile(String email,String fullName,String country,
			String college,String phone,String about,String gitHubProfile,
    		String igProfile,String linkedInProfile,String address)
	{
		UserDetails userDetails = new UserDetails(email.toLowerCase(),fullName,about,country,address,phone,gitHubProfile,igProfile,linkedInProfile,college);
		return userDetails = userDetailsDAO.update(userDetails);		
	}
	
	

}
