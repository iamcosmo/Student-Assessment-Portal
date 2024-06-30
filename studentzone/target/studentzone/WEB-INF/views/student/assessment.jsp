<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Assessment</title>
</head>
<body>
    <h1>Welcome to the Assessment Page</h1>
    <c:if test="${not empty user}">
        <p>Hello, ${user.name}</p>
    </c:if>
    
     <!-- Link to go back to index.jsp -->
    <p><a href="${pageContext.request.contextPath}/index.jsp">Go back to Home</a></p>
    
    <!-- Display question sets here -->
    <!-- Display question sets here -->
</body>
</html>
