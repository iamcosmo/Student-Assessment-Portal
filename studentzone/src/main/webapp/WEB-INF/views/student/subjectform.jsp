<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Student Zone</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
    />
    <link rel="stylesheet" href="/style.css">
  </head>
<body>
	<header class="fixed-top">
      <nav class="navbar navbar-expand-lg bg-body-tertiary p-0 mb-2">
        <div class="container-fluid" style="background-color: white">
          <a
            class="navbar-brand"
            href="#"
            style="margin-left: 5%; font-weight: 500; font-size: xx-large"
            >StudentZone</a
          >
          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="margin-left: 20%">
	            <li class="nav-item"><a href="index.jsp" class="nav-link active" aria-current="page">Home</a></li>
	            <li class="nav-item"><a href="about.jsp" class="nav-link active" aria-current="page">About</a></li>
	            <li class="nav-item"><a href="<c:url value='/student/assessment'/>" class="nav-link active" aria-current="page">Assessment</a></li>
	            <li class="nav-item"><a href="results.jsp" class="nav-link active" aria-current="page">Results</a></li>
	            <li class="nav-item"><a href="analyze.jsp" class="nav-link active" aria-current="page">Analyze</a></li>
	            <c:choose>
	                <c:when test="${not empty sessionScope.user}">
	                    <li class="nav-item"><a href="<c:url value='/logout'/>" class="nav-link active" aria-current="page">Logout</a></li>
	                </c:when>
	                <c:otherwise>
	                    <li class="nav-item"><a href="<c:url value='/login'/>" class="nav-link active" aria-current="page">Login</a></li>
	                    <li class="nav-item"><a href="<c:url value='/register'/>" class="nav-link active" aria-current="page">Register</a></li>
	                </c:otherwise>
	            </c:choose>
	          </ul>
            <c:choose>
	                <c:when test="${not empty sessionScope.user}">
	                    <div class="dropdown">
						  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="border: none">
						  		<i class="bi bi-person-circle" 
	                    			style="font-size: 1.5rem;
	    							cursor: pointer;
	    							color: black;">
	    						</i>
						  </button>
						  <ul class="dropdown-menu">
						    <li><a class="dropdown-item" href="<c:url value='/student/profile'/>">Profile</a></li>
						    <li><a class="dropdown-item" href="#">Another action</a></li>
						  </ul>
						</div>   
	                </c:when>
	                <c:otherwise>
						<a class="btn-getstarted" href="<c:url value='/register'/>">Register</a>
	                </c:otherwise>
	        </c:choose>
          </div>
        </div>
      </nav>
    </header>
    <main style="background-color: #F3F7EC">
      <div class="container overflow-hidden">
        <div class="row gx-5" style="margin-top: 10%; margin-left: 3%">
        	<h1>Select Your Subjects of Interest</h1>
		    <form action="<c:url value='/student/submitSubjectForm'/>" method="post">
		        <!-- Add subject checkboxes here -->
		        <input type="checkbox" name="subjects" value="Math"> JAVA Adbvance<br>
		        <input type="checkbox" name="subjects" value="Science"> JavaScript<br>
		        <input type="checkbox" name="subjects" value="History"> C++/C Programming Core<br>
		        <input type="submit" value="Submit">
		    </form>
        </div>
      </div>
    </main>
</body>
</html>
