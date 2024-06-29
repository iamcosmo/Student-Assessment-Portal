package studentzone.dao;

import studentzone.model.UserDetails;

public interface UserDetailsDAO {
	UserDetails findByEmail(String email);
	void create(UserDetails userDetails);
	
}
