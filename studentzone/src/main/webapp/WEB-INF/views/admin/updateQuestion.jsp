<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Question List</title>
    <link href="bootstrap.min.css" rel="stylesheet" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="indexStyle.css"/>
</head>
<body>
<c:if test="${empty sessionScope.adminUsername}">
    <% response.sendRedirect("AdminLogin.jsp?msg2=Please Login as Admin to Continue"); %>
</c:if>
<div class="container">
    <h2>Question List</h2>
    <c:if test="${not empty msg}">
        <div class="alert alert-info">${msg}</div>
    </c:if>
    <table class="table table-striped">
        <thead>
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
                    <form method="post" action="${pageContext.request.contextPath}/admin/updateQuestion">
                        <td>
                            <input type="hidden" name="id" value="${question.id}"/>
                            <input type="text" name="question" value="${question.question}" class="form-control"/>
                        </td>
                        <td><input type="text" name="a" value="${question.a}" class="form-control"/></td>
                        <td><input type="text" name="b" value="${question.b}" class="form-control"/></td>
                        <td><input type="text" name="c" value="${question.c}" class="form-control"/></td>
                        <td><input type="text" name="d" value="${question.d}" class="form-control"/></td>
                        <td><input type="text" name="answer" value="${question.answer}" class="form-control"/></td>
                        <td>
                            <button type="submit" class="btn btn-primary">Update</button>
                            <a href="${pageContext.request.contextPath}/admin/deleteQuestion/${question.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this question?')">Delete</a>
                        </td>
                    </form>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/admin/addQuestion" class="btn btn-primary">Add New Question</a>
    <a href="${pageContext.request.contextPath}/admin/logout" class="btn btn-secondary">Logout</a>
</div>
</body>
</html>
