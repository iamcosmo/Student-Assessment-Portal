package studentzone.service;


import studentzone.dao.ResponseDAO;
import studentzone.model.Response;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResponseService {

	@Autowired
    private ResponseDAO responseDAO;

    public void setResponseDAO(ResponseDAO responseDAO) {
        this.responseDAO = responseDAO;
    }

    
    public void saveResponse(Response response) {
        responseDAO.saveResponse(response);
    }

    
    public List<Response> getResponsesByExamId(int EID) {
        return responseDAO.getResponsesByExamId(EID);
    }

    
    public void deleteResponsesByExamId(int EID) {
        responseDAO.deleteResponsesByExamId(EID);
    }
}

