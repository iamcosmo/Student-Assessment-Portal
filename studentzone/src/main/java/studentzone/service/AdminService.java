package studentzone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studentzone.dao.AdminDao;
import studentzone.model.User;

@Service
public class AdminService {

    @Autowired
    private AdminDao adminDao;

    public boolean authenticateAdmin(String email, String password, int usertype) {
        User user = new User();
        user.setEmail(email);
        user.setPassword(password);
        user.setUsertype(usertype);
        return adminDao.validateUser(user);
    }
}
