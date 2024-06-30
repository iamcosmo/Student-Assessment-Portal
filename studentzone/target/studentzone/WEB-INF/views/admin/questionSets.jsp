<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Question Sets</title>
    <link href="${pageContext.request.contextPath}/bootstrap.min.css" rel="stylesheet" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/indexStyle.css"/>
    <style>
        .add-set-button {
            position: absolute;
            top: 20px;
            left: 20px;
        }
        .return-dashboard {
            position: absolute;
            top: 20px;
            right: 20px;
        }
    </style>
</head>
<body>
<c:if test="${empty sessionScope.adminUsername}">
    <% response.sendRedirect("${pageContext.request.contextPath}/admin/login?msg=Please+login+to+continue"); %>
</c:if>
<div class="container">
    <a href="${pageContext.request.contextPath}/admin/addQuestionSet" class="btn btn-primary add-set-button">Add New Set</a>
    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-primary return-dashboard">Return to Dashboard</a>
    <h2>Question Sets</h2>
    <c:if test="${empty sets}">
        <div class="alert alert-info">No question sets available. Please add one.</div>
    </c:if>
    <div class="mt-4">
        <!-- This is optional, since the button is already positioned at the top left -->
        <!-- <a href="${pageContext.request.contextPath}/admin/addQuestionSet" class="btn btn-primary">Add New Set</a> -->
    </div>
    
    <ul class="list-group">
        <c:forEach var="set" items="${sets}">
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <span>${set.name}</span>
            <span>Total questions: ${set.questionCount}</span>
                <span>
                    <a href="${pageContext.request.contextPath}/admin/QuestionList?setId=${set.id}" class="btn btn-primary btn-sm">View Questions</a>
                    <a href="${pageContext.request.contextPath}/admin/addQuestion?setId=${set.id}" class="btn btn-success btn-sm">Add Question</a>
                    <a href="${pageContext.request.contextPath}/admin/editQuestionSet?setId=${set.id}" class="btn btn-warning btn-sm">Edit</a>
                    <a href="${pageContext.request.contextPath}/admin/deleteQuestionSet?id=${set.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this question set?')">Delete</a>
                </span>
            </li>
        </c:forEach>
    </ul>
</div>
</body>
</html>
