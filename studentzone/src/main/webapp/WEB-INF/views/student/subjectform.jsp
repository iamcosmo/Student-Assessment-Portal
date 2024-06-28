<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Subject Form</title>
</head>
<body>
    <h1>Select Your Subjects of Interest</h1>
    <form action="<c:url value='/student/submitSubjectForm'/>" method="post">
        <!-- Add subject checkboxes here -->
        <input type="checkbox" name="subjects" value="Math"> JAVA Adbvance<br>
        <input type="checkbox" name="subjects" value="Science"> JavaScript<br>
        <input type="checkbox" name="subjects" value="History"> C++/C Programming Core<br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
