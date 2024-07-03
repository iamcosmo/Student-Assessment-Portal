<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Subject Tag List</title>
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
            <a href="${pageContext.request.contextPath}/admin/questionSets" class="btn btn-secondary">Back to Dashboard</a>
            <div class="card">
                <div class="card-header text-center">
                    <h2>Subject Tag List</h2>
                </div>
                <div class="card-body">
                    <!-- Display alert messages -->
                    <c:if test="${not empty msg}">
                        <div class="alert alert-danger text-center">
                            <p>${msg}</p>
                        </div>
                    </c:if>
                    <div class="mb-3">
                        <form method="post" action="${pageContext.request.contextPath}/admin/addSubjectTag">
                            <div class="input-group">
                                <input type="text" name="name" class="form-control" placeholder="New Subject Tag" required>
                                <button type="submit" class="btn btn-success">Add</button>
                            </div>
                        </form>
                    </div>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${subjectTags}" var="tag">
                                <c:choose>
                                    <c:when test="${param.editId == tag.id}">
                                        <form method="post" action="${pageContext.request.contextPath}/admin/editSubjectTag">
                                            <tr>
                                                <td>
                                                    <input type="hidden" name="id" value="${tag.id}"/>
                                                    <input type="text" name="name" value="${tag.name}" class="form-control" required/>
                                                </td>
                                                <td>
                                                    <button type="submit" class="btn btn-primary btn-sm">Update</button>
                                                    <a href="${pageContext.request.contextPath}/admin/subjectTags" class="btn btn-secondary btn-sm">Cancel</a>
                                                </td>
                                            </tr>
                                        </form>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td>${tag.name}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/admin/subjectTags?editId=${tag.id}" class="btn btn-primary btn-sm">Edit</a>
                                                <a href="${pageContext.request.contextPath}/admin/deleteSubjectTag?id=${tag.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this subject tag?')">Delete</a>
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
