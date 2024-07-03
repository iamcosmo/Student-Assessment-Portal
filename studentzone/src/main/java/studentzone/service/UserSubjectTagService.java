package studentzone.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import studentzone.model.UserSubjectTag;
import studentzone.dao.UserSubjectTagDao;

@Service
public class UserSubjectTagService {
	
	@Autowired
	private UserSubjectTagDao userSubjectTagDao;	
	
	public List<UserSubjectTag> findUserTags(String email)
	{
		return userSubjectTagDao.findUserTags(email);
	}
	
	public void saveUserSubjectTags(String email, int[] tagIds)
	{
		userSubjectTagDao.saveUserSubjectTags(email, tagIds);
	}

}
