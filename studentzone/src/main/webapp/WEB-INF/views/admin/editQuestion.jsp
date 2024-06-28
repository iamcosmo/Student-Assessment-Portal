<!-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Question</title>
    <link href="bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
    <h2>Edit Question</h2>
    <form action="${pageContext.request.contextPath}/admin/updateQuestion" method="post">
        <input type="hidden" name="id" value="${question.id}">
        <div class="form-group">
            <label for="question">Question:</label>
            <input type="text" class="form-control" id="question" name="question" value="${question.question}">
        </div>
        <div class="form-group">
            <label for="a">Option A:</label>
            <input type="text" class="form-control" id="a" name="a" value="${question.a}">
        </div>
        <div class="form-group">
            <label for="b">Option B:</label>
            <input type="text" class="form-control" id="b" name="b" value="${question.b}">
        </div>
        <div class="form-group">
            <label for="c">Option C:</label>
            <input type="text" class="form-control" id="c" name="c" value="${question.c}">
        </div>
        <div class="form-group">
            <label for="d">Option D:</label>
            <input type="text" class="form-control" id="d" name="d" value="${question.d}">
        </div>
        <div class="form-group">
            <label for="answer">Answer:</label>
            <input type="text" class="form-control" id="answer" name="answer" value="${question.answer}">
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>
</body>
</html> -->
