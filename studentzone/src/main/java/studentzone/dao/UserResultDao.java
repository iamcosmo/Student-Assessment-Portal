package studentzone.dao;

import studentzone.model.UserResult;

import java.util.List;
import java.util.Map;

public interface UserResultDao {
    void addUserResult(UserResult userResult);
    UserResult getUserResultById(int eid);
    List<UserResult> getAllUserResults();
    List<UserResult> getAllUserResultsByEmail(String email);
    Map<Integer,Integer> getEID_QSIDByEmail(String email);
    void updateUserResult(UserResult userResult);
    void deleteUserResult(int eid);
}
