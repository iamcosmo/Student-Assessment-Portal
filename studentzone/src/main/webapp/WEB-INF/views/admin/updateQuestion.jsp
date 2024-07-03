<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Question List</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl5+5hb7ie1+9fV/p/ghsBOthOg+a9AczB7T1d2fA6" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<c:if test="${empty sessionScope.adminUsername}">
    <c:redirect url="AdminLogin.jsp?msg2=Please Login as Admin to Continue"/>
</c:if>
<div class="container mt-5">
    <div class="row justify-content-between mb-4">
        <div class="col-md-6">
            <h2>Question List</h2>
        </div>
        <div class="col-md-6 text-end">
            <a href="${pageContext.request.contextPath}/admin/questionSets" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>
    <c:if test="${not empty msg}">
        <div class="alert alert-info text-center">${msg}</div>
    </c:if>
    <div class="row justify-content-center">
        <div class="col-md-10">
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Question</th>
                        <th>Option A</th>
                        <th>Option B</th>
                        <th>Option C</th>
                        <th>Option D</th>
                        <th>Answer</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${questionList}" var="question">
                        <tr>
                            <form method="post" action="<c:url value='/admin/updateQuestion' />">
                                <input type="hidden" name="id" value="${question.id}"/>
                                <input type="hidden" name="set_id" value="${question.setId}"/>
                                <td><input type="text" name="question" value="${question.question}" class="form-control"/></td>
                                <td><input type="text" name="a" value="${question.a}" class="form-control"/></td>
                                <td><input type="text" name="b" value="${question.b}" class="form-control"/></td>
                                <td><input type="text" name="c" value="${question.c}" class="form-control"/></td>
                                <td><input type="text" name="d" value="${question.d}" class="form-control"/></td>
                                <td><input type="text" name="answer" value="${question.answer}" class="form-control"/></td>
                                <td>
                                    <button type="submit" class="btn btn-primary btn-sm">Update</button>
                                    <a href="<c:url value='/admin/deleteQuestion/${question.id}' />" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this question?')">Delete</a>
                                </td>
                            </form>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="mt-3 text-center">
                <a href="<c:url value='/admin/addQuestion' />" class="btn btn-success">Add New Question</a>
                <a href="<c:url value='/admin/logout' />" class="btn btn-secondary">Logout</a>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl5+5hb7ie1+9fV/p/ghsBOthOg+a9AczB7T1d2fA6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl5+5hb7ie1+9fV/p/ghsBOthOg+a9AczB7T1d2fA6" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js" integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl5+5hb7ie1+9fV/p/ghsBOthOg+a9AczB7T1d2fA6" crossorigin="anonymous"></script>
</body>
</html>
