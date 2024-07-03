package studentzone.service;

import studentzone.dao.ResponseDAO;
import studentzone.model.Response;

import java.util.List;

public class ResponseServiceImpl implements ResponseService {

    private ResponseDAO responseDAO;

    public void setResponseDAO(ResponseDAO responseDAO) {
        this.responseDAO = responseDAO;
    }

    @Override
    public void saveResponse(Response response) {
        responseDAO.saveResponse(response);
    }

    @Override
    public List<Response> getResponsesByExamId(int EID) {
        return responseDAO.getResponsesByExamId(EID);
    }

    @Override
    public void deleteResponsesByExamId(int EID) {
        responseDAO.deleteResponsesByExamId(EID);
    }
}
