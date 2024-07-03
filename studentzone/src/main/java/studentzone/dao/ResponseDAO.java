package studentzone.dao;

import studentzone.model.Response;
import java.util.List;

public interface ResponseDAO {
    void saveResponse(Response response);
    List<Response> getResponsesByExamId(int EID);
    void deleteResponsesByExamId(int EID);
}
