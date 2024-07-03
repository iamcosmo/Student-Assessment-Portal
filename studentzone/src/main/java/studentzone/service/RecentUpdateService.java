package studentzone.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import studentzone.dao.RecentUpdateDao;
import studentzone.model.RecentUpdate;

import java.util.List;

@Service
public class RecentUpdateService {
      @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private RecentUpdateDao recentUpdateDao;

    public List<RecentUpdate> getRecentUpdates() {
        return recentUpdateDao.getRecentUpdates();
    }
    

    public void addRecentUpdate(String message) {
        String sql = "INSERT INTO recent_updates (message) VALUES (?)";
        recentUpdateDao.getJdbcTemplate().update(sql, message);
        recentUpdateDao.deleteOldUpdates();
    }
}
