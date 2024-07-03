package studentzone.service;


import studentzone.model.Response;

import java.util.List;

public interface ResponseService {
    void saveResponse(Response response);
    List<Response> getResponsesByExamId(int EID);
    void deleteResponsesByExamId(int EID);
}
