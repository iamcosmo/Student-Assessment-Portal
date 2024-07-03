<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Question List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #007bff;
            color: #fff;
        }
        .btn-primary, .btn-secondary {
            margin: 0 5px;
        }
        .alert {
            margin-top: 20px;
        }
        .table thead {
            background-color: #007bff;
            color: #fff;
        }
    </style>
</head>
<body>
<c:if test="${empty sessionScope.adminUsername}">
    <% response.sendRedirect("AdminLogin.jsp?msg2=Please Login as Admin to Continue"); %>
</c:if>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">
                <div class="card-header text-center">
                    <h2>Question List</h2>
                          <span class="d-flex justify-content-between align-items-center mb-3">
                <a href="${pageContext.request.contextPath}/admin/questionSets" class="btn btn-secondary">Back to Dashboard</a>
                 </span>
                </div>
                <div class="card-body">
                    <c:if test="${not empty msg}">
                        <div class="alert alert-info text-center">${msg}</div>
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
                                <c:choose>
                                    <c:when test="${param.editId == question.id}">
                                        <form method="post" action="${pageContext.request.contextPath}/admin/updateQuestion">
                                            <input type="hidden" name="setId" value="${param.setId}"/>
                                            <tr>
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
                                                    <button type="submit" class="btn btn-primary btn-sm">Update</button>
                                                    <a href="${pageContext.request.contextPath}/admin/QuestionList?setId=${param.setId}" class="btn btn-secondary btn-sm">Cancel</a>
                                                </td>
                                            </tr>
                                        </form>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td>${question.question}</td>
                                            <td>${question.a}</td>
                                            <td>${question.b}</td>
                                            <td>${question.c}</td>
                                            <td>${question.d}</td>
                                            <td>${question.answer}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/admin/QuestionList?setId=${param.setId}&editId=${question.id}" class="btn btn-primary btn-sm">Edit</a>
                                                <a href="${pageContext.request.contextPath}/admin/deleteQuestion/${question.id}?setId=${param.setId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this question?')">Delete</a>
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="d-flex justify-content-between">
                        <a href="${pageContext.request.contextPath}/admin/addQuestion?setId=${param.setId}" class="btn btn-success">Add New Question</a>
                        <a href="${pageContext.request.contextPath}/admin/questionSets" class="btn btn-secondary">Back to Question Sets</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
