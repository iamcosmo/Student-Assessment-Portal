package studentzone.service;

import studentzone.dao.UserResultDao;
import studentzone.model.UserResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserResultService {

    @Autowired
    private UserResultDao userResultDao;

    public void addUserResult(UserResult userResult) {
        userResultDao.addUserResult(userResult);
    }

    public UserResult getUserResultById(int eid) {
        return userResultDao.getUserResultById(eid);
    }

    public List<UserResult> getAllUserResults() {
        return userResultDao.getAllUserResults();
    }

    public void updateUserResult(UserResult userResult) {
        userResultDao.updateUserResult(userResult);
    }

    public void deleteUserResult(int eid) {
        userResultDao.deleteUserResult(eid);
    }
    
    public List<UserResult> getAllUserResultsByEmail(String email)
    {
    	return userResultDao.getAllUserResultsByEmail(email);
    }
    
    public Map<Integer, Integer> getEID_QSIDByEmail(String email)
    {
    	return userResultDao.getEID_QSIDByEmail(email);
    }
}
