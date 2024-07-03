<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="studentzone.model.Questions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<c:url value='/assets/vendor/bootstrap/css/bootstrap.min.css' />">
    <title>Add Question</title>
    <link href="${pageContext.request.contextPath}/bootstrap.min.css" rel="stylesheet" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<c:if test="${empty sessionScope.adminUsername}">
    <% response.sendRedirect("${pageContext.request.contextPath}/admin/login?msg=Please+login+to+continue"); %>
</c:if>
<div class="container">
   <div class="d-flex justify-content-between align-items-center mb-3">
        <a href="${pageContext.request.contextPath}/admin/questionSets" class="btn btn-secondary">Back to Dashboard</a>
             </div>
    <h2>Add New Question</h2>
    <form:form action="${pageContext.request.contextPath}/admin/addQuestion" method="post" modelAttribute="question">
        <form:hidden path="setId" value="${param.setId}"/>
        <div class="form-group">
            <label for="question">Question:</label>
            <form:input path="question" id="question" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="a">Option A:</label>
            <form:input path="a" id="a" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="b">Option B:</label>
            <form:input path="b" id="b" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="c">Option C:</label>
            <form:input path="c" id="c" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="d">Option D:</label>
            <form:input path="d" id="d" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="answer">Answer:</label>
            <form:select path="answer" id="answer" class="form-control">
                <form:option value="a">A</form:option>
                <form:option value="b">B</form:option>
                <form:option value="c">C</form:option>
                <form:option value="d">D</form:option>
            </form:select>
        </div>
        <button type="submit" class="btn btn-primary">Save Question</button>
        <a href="${pageContext.request.contextPath}/admin/QuestionList?setId=${param.setId}" class="btn btn-secondary">Go to Question List</a>
    </form:form>
    <div>
        <font color="red">${msg}</font>
    </div>
</div>
</body>
</html>
