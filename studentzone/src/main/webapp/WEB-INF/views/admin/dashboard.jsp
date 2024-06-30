<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="${pageContext.request.contextPath}/bootstrap.min.css" rel="stylesheet" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 20px;
        }
        .welcome-banner {
            background-color: #ffc107;
            padding: 20px;
            text-align: center;
            margin-bottom: 20px;
            border-radius: 8px;
        }
        .welcome-banner h1 {
            color: #28a745;
            font-size: 1.8rem;
            margin: 0;
        }
        .card {
            margin-bottom: 20px;
            border-radius: 8px;
        }
        .card-body {
            text-align: center;
        }
        .btn {
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="welcome-banner">
            <h1>Welcome, ${sessionScope.adminUsername}</h1>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Add Question</h5>
                        <p class="card-text">Add a new question to the database.</p>
                        <a href="${pageContext.request.contextPath}/admin/addQuestion" class="btn btn-primary">Go to Add Question</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">View Questions</h5>
                        <p class="card-text">View the list of existing questions.</p>
                        <a href="${pageContext.request.contextPath}/admin/QuestionList" class="btn btn-primary">Go to View Questions</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Question Sets</h5>
                        <p class="card-text">Manage question sets.</p>
                        <a href="${pageContext.request.contextPath}/admin/questionSets" class="btn btn-primary">Go to Question Sets</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Logout</h5>
                        <p class="card-text">Logout from the admin panel.</p>
                        <a href="${pageContext.request.contextPath}/admin/logout" class="btn btn-primary">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/bootstrap.bundle.min.js"></script>
</body>
</html>
