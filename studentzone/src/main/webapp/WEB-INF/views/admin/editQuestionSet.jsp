<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Question Set</title>
    <link href="${pageContext.request.contextPath}/bootstrap.min.css" rel="stylesheet" type="text/css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #007bff;
            color: #fff;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header text-center">
                    <h2>Edit Question Set</h2>
                </div>
                <div class="card-body">
                    <form:form action="${pageContext.request.contextPath}/admin/updateSet" method="post" modelAttribute="set">
                        <form:hidden path="id" value="${set.id}"/>
                        <div class="mb-3">
                            <label for="name" class="form-label">Set Name:</label>
                            <form:input path="name" id="name" class="form-control"/>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary me-2">Update Set</button>
                            <a href="${pageContext.request.contextPath}/admin/questionSets" class="btn btn-secondary">Cancel</a>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
