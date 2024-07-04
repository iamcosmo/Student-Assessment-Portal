<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body,
        html {
            margin: 0;
            padding: 0;
            font-family: 'Nunito', sans-serif;
            overflow: hidden;
        }

        .container-fluid {
            display: flex;
            height: 100vh;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: #fff;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            padding: 20px;
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            overflow-y: auto;
        }

        .brand {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            color: #ff5a5f;
        }

        .menu ul {
            list-style: none;
            padding: 0;
        }

        .menu li a {
            text-decoration: none;
            color: #333;
            display: flex;
            align-items: center;
            padding: 10px;
            background-color: #fff;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        .menu li a:hover{
            background-color: #007bff;
            color: #fff;
        }

        .menu li {
            margin: 20px 0;
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            background-color: #f9f9f9;
            padding: 20px;
            margin-left: 270px;
            margin-right: 270px;
            overflow-y: auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .header .title {
            font-size: 32px;
            font-weight: bold;
        }

        .header .date-picker {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .header .user-settings {
            display: flex;
            align-items: center;
        }

        .header .theme-toggle {
            width: 40px;
            height: 40px;
            background-color: #ff5a5f;
            border-radius: 50%;
            margin-right: 20px;
        }

        .header .user-info {
            text-align: right;
        }

        .header .user-info span {
            display: block;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin-bottom: 20px;
        }

        .card {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .card-body {
            text-align: center;
        }

        .card .btn {
            margin: 5px 0;
        }

        .right-sidebar {
            width: 270px;
            background-color: #fff;
            box-shadow: -2px 0 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            position: fixed;
            top: 0;
            bottom: 0;
            right: 0;
            overflow-y: auto;
        }

        .recent-update,
        .analytics {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .section-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .recent-update ul {
            list-style: none;
            padding: 0;
        }

        .recent-update li {
            padding: 10px;
            border-bottom: 1px solid #eee;
        }

        .analytics-cards {
            display: flex;
            gap: 20px;
        }

        .analytics .card {
            flex: 1;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .analytics .card-body {
            text-align: center;
        }

        a,
        u {
            text-decoration: none;
        }
    </style>
</head>

<body>
    <c:if test="${empty sessionScope.adminUsername}">
        <% response.sendRedirect("${pageContext.request.contextPath}/admin/login?msg=Please+login+to+continue"); %>
    </c:if>
    <div class="container-fluid">
        <aside class="sidebar">
            <div class="brand">
                <h3>Welcome, ${sessionScope.adminUsername}</h3>
            </div>
            <nav class="menu">
                <ul>
                    <li class="active"><a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-primary return-dashboard">Dashboard</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/addQuestionSet" class="btn btn-primary add-set-button">Add Questionset</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/subjectTags" class="btn btn-primary">Manage Subject Tags</a></li>
                  
                    <li><a href="${pageContext.request.contextPath}/admin/logout" class="btn btn-primary">Logout</a></li>
                </ul>
            </nav>
        </aside>
        <main class="main-content">
            <header class="header">
                <div class="title">Dashboard</div>
                <div class="date-picker">
                    <fmt:formatDate value="<%= new java.util.Date() %>" pattern="MM/dd/yyyy" />
                </div>
                <div class="user-settings">
                    <div class="theme-toggle"></div>
                    <div class="user-info">
                        <span>${sessionScope.adminUsername}</span>
                    </div>
                </div>
            </header>
            <section class="cards">
                <c:forEach var="set" items="${sets}">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">${set.name}</h5>
                            <span class="card-text">Questions: ${set.questionCount}</span>
                            <p class="card-text">
                                Tags:
                                <c:forEach var="tag" items="${set.tags}" varStatus="status">
                                    ${tag}<c:if test="${!status.last}">, </c:if>
                                </c:forEach>
                            </p>
                            <a href="${pageContext.request.contextPath}/admin/editQuestionSet?setId=${set.id}" class="btn btn-primary">Edit</a>
                            <a href="${pageContext.request.contextPath}/admin/deleteQuestionSet?id=${set.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this question set?')">Delete</a>
                            <a href="${pageContext.request.contextPath}/admin/QuestionList?setId=${set.id}" class="btn btn-secondary">Question List</a>
                            <a href="${pageContext.request.contextPath}/admin/addQuestion?setId=${set.id}" class="btn btn-success">Add Question</a>
                        </div>
                    </div>
                </c:forEach>
            </section>
            <c:if test="${empty sets}">
                <div class="alert alert-info">No question sets available. Please add one.</div>
            </c:if>
            <a href="${pageContext.request.contextPath}/admin/addQuestionSet" class="btn btn-primary add-set-button">Add New Set</a>
        </main>
        <aside class="right-sidebar">
             <section class="recent-update">
                <div class="section-title">Recent Update</div>
                <ul>
                    <c:forEach var="update" items="${recentUpdates}">
                        <li>${update.message} - <fmt:formatDate value="${update.date}" pattern="MM/dd/yyyy HH:mm" /></li>
                    </c:forEach>
                </ul>
            </section>
        </aside>
    </div>
</body>
</html>
