package studentzone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import studentzone.dao.UserDao;
import studentzone.model.User;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public void registerUser(String name, String email, String dob, String password, int usertype) {
    	String lowercaseEmail = email.toLowerCase();
    	userDao.registerUser(name, lowercaseEmail, dob, password,usertype);
    }
    
    public User validateUser(String email, String password, int usertype) {
        String lowercaseEmail = email.toLowerCase();
        return userDao.validateUser(lowercaseEmail, password, usertype);
    }
    
    public boolean validateUserPassword(String email, String currPassword)
    {
    	return userDao.validateUserPassword(email, currPassword);
    }
    public String changeUserPassword(String email, String newPassword)
    {
    	return userDao.changePassword(email, newPassword);
    }
}
