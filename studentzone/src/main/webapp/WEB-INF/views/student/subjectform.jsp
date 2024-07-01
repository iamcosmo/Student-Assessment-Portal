<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta content="width=device-width, initial-scale=1.0" name="viewport" />
  <title>Student Zone</title>
  <meta content="" name="description" />
  <meta content="" name="keywords" />

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect" />
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin />
  <link
    href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
    rel="stylesheet" />

  <!-- Vendor CSS Files -->
  <link href="<c:url value='/assets/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" />
  <link href="<c:url value='/assets/vendor/bootstrap-icons/bootstrap-icons.css'/>" rel="stylesheet" />
<link href="<c:url value='/assets/vendor/aos/aos.css'/>" rel="stylesheet" />
<link href="<c:url value='/assets/vendor/glightbox/css/glightbox.min.css'/>" rel="stylesheet" />
<link href="<c:url value='/assets/vendor/swiper/swiper-bundle.min.css'/>" rel="stylesheet" />

  <!-- Main CSS File -->
  <link href="<c:url value='/assets/css/main.css'/>" rel="stylesheet" />
  
  <style>
  	.subject-row {
	  display: flex;
	  align-items: center;
	  margin-bottom: 10px;
	}
	
	.subject-number {
	  width: 30px;
	  text-align: right;
	  padding-right: 10px;
	}
	
	.form-control {
	  flex: 1;
	  margin-right: 10px; /* Add some space between the dropdown and the delete button */
	}
	
	.btn-danger {
	  padding: 0.5rem;
	}
  	
  </style>
  
</head>

<body class="index-page">
  <header id="header" class="header d-flex align-items-center fixed-top">
		<div class="container-fluid position-relative d-flex align-items-center justify-content-between">
	        <a
	          href="index.jsp"
	          class="logo d-flex align-items-center me-auto me-xl-0"
	        >
	          <h1 class="sitename">StudentZone</h1>
	          <span></span>
	        </a>

	        <nav id="navmenu" class="navmenu">
	          <ul>
	            <li><a href="<c:url value='/'/>" class="active">Home</a></li>
	            <li><a href="about.jsp">About</a></li>
	            <li><a href="<c:url value='/student/assessment'/>">Assessment</a></li>
	            <li><a href="results.jsp">Results</a></li>
	            <li><a href="analyze.jsp">Analyze</a></li>
	            <c:choose>
	                <c:when test="${not empty sessionScope.user}">
	                    <li><a href="<c:url value='/logout'/>">Logout</a></li>
	                </c:when>
	                <c:otherwise>
	                    <li><a href="<c:url value='/login'/>">Login</a></li>
	                    <li><a href="<c:url value='/register'/>">Register</a></li>
	                </c:otherwise>
	            </c:choose>
	          </ul>
	          <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
	        </nav> 
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
    </header>

  <main class="main">
    <!-- Hero Section -->
    <section id="hero" class="hero section">
      <img src="<c:url value='/assets/img/features-light-2.jpg'/>" alt="hero" data-aos="fade-in" />
      <div class="container" style="color:black">
        <div class="row justify-content-center">
          <div class="col-xl-6 p-4" style="background-color: white">
            <h4 data-aos="fade-up" data-aos-delay="100" style="margin-bottom: 20px;margin-top: 10px; color:black">
              Fill the form
            </h4>
            <c:if test="${not empty errorMessage}">
              <p style="color: red">${errorMessage}</p>
            </c:if>
            <form action="${pageContext.request.contextPath}/student/submitSubjectForm" method="post">
		      <!-- <div class="mb-3">
		        <label for="inputEmail" class="form-label">Email:</label>
		        <input type="email" id="inputEmail" class="form-control" aria-describedby="emailHelpBlock" required />
		      </div> -->
		      <div class="mb-3">
		        <label for="inputSubject" class="form-label">Subjects interested:</label>
		        <button type="button" class="btn btn-secondary ms-2" onclick="addSubjectField()">
		            <i class="bi bi-plus"></i>
		          </button>
		      </div>
		      <div id="subjectFields">
				  <div class="subject-row" id="subjectRow1">
				    <span class="subject-number">1.</span>
				    <select id="inputSubject1" name="subjects" class="form-control" required>
				      <option value="" disabled selected>Select a subject</option>
				      <option value="Mathematics">Mathematics</option>
				      <option value="Science">Science</option>
			          <option value="History">History</option>
			          <option value="Literature">Literature</option>
			          <option value="Art">Art</option>
			          <option value="Music">Music</option>
			          <option value="Physical Education">Physical Education</option>
			          <option value="Computer Science">Computer Science</option>
			          <option value="Economics">Economics</option>
			       	</select>
		        </div>
		      </div>
		      <div class="text-center">
		        <button type="submit" class="btn btn-primary">Submit</button>
		      </div>
		    </form>
          </div>
        </div>
      </div>
    </section>
    <!-- /Hero Section -->
  </main>

  <!-- Footer Section -->
  <footer id="footer" class="footer position-relative">
    <div class="container footer-top">
      <div class="row gy-4">
        <div class="col-lg-5 col-md-12 footer-about">
          <a href="index.html" class="logo d-flex align-items-center">
            <span class="sitename">StudentZone</span>
          </a>
          <p>
            ExamPrep Portal is dedicated to helping students achieve their
            academic goals with high-quality resources and support.
          </p>

          <div class="social-links d-flex mt-4">
            <a href=""><i class="bi bi-twitter-x"></i></a>
            <a href=""><i class="bi bi-facebook"></i></a>
            <a href=""><i class="bi bi-instagram"></i></a>
            <a href=""><i class="bi bi-linkedin"></i></a>
          </div>
        </div>

        <div class="col-lg-2 col-6 footer-links">
          <h4>Useful Links</h4>
          <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">About us</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Terms of service</a></li>
            <li><a href="#">Privacy policy</a></li>
          </ul>
        </div>

        <div class="col-lg-2 col-6 footer-links">
          <h4>Our Services</h4>
          <ul>
            <li><a href="#">Web Design</a></li>
            <li><a href="#">Web Development</a></li>
            <li><a href="#">Product Management</a></li>
            <li><a href="#">Marketing</a></li>
            <li><a href="#">Graphic Design</a></li>
          </ul>
        </div>

        <div class="col-lg-3 col-md-12 footer-contact text-center text-md-start">
          <h4>Contact Us</h4>
          <p>Silicon University</p>
          <p>Bhubaneswar, Odisha</p>
          <p>751010</p>
          <p class="mt-4">
            <strong>Phone:</strong> <span>+91 1234567809</span>
          </p>
          <p><strong>Email:</strong> <span>info@example.com</span></p>
        </div>
      </div>
    </div>
  </footer>
  <!-- /Footer Section -->

  <!-- Scroll to Top -->
  <a href="#" class="scroll-top d-flex align-items-center justify-content-center">
    <i class="bi bi-arrow-up-short"></i>
  </a>

  <!-- Vendor JS Files -->
	<script src="<c:url value='/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/assets/vendor/aos/aos.js'/>"></script>
	<script src="<c:url value='/assets/vendor/glightbox/js/glightbox.min.js'/>"></script>
	<script src="<c:url value='/assets/vendor/purecounter/purecounter_vanilla.js'/>"></script>
	<script src="<c:url value='/assets/vendor/swiper/swiper-bundle.min.js'/>"></script>
	<script src="<c:url value='/assets/vendor/isotope-layout/isotope.pkgd.min.js'/>"></script>
	<script src="<c:url value='/assets/vendor/php-email-form/validate.js'/>"></script>
	
	<script>
	    let subjectCount = 1;
	    
	    function addSubjectField() {
	      subjectCount++;
	      const container = document.getElementById('subjectFields');
	      const div = document.createElement('div');
	      div.className = 'subject-row';
	      div.setAttribute('id', 'subjectRow' + subjectCount);
	      
	      const number = document.createElement('span');
	      number.className = 'subject-number';
	      number.textContent = subjectCount + '. ';
	      
	      
	      const select = document.createElement('select');
	      select.name = 'subjects';
	      select.className = 'form-control';
	      select.required = true;
	      
	      const options = ['Mathematics', 'Science', 'History', 'Literature', 'Art', 'Music', 'Physical Education', 'Computer Science', 'Economics'];
	      options.forEach(function(optionText) {
	        const option = document.createElement('option');
	        option.value = optionText;
	        option.textContent = optionText;
	        select.appendChild(option);
	      });
	      
	      const removeButton = document.createElement('button');
	      removeButton.type = 'button';
	      removeButton.className = 'btn btn-danger ms-2';
	      removeButton.onclick = function() {
	        removeSubjectField('subjectRow' + subjectCount);
	      };
	      removeButton.innerHTML = '<i class="bi bi-trash"></i>';
	      
	      div.appendChild(number);
	      div.appendChild(select);
	      div.appendChild(removeButton);
	      container.appendChild(div);
	    }
	    
	    function removeSubjectField(id) {
	      const field = document.getElementById(id);
	      if (field) {
	        field.remove();
	        subjectCount--;
	        updateSubjectNumbers();
	      }
	    }
	    
	    function updateSubjectNumbers() {
	      const rows = document.getElementsByClassName('subject-row');
	      for (let i = 0; i < rows.length; i++) {
	        const number = rows[i].getElementsByClassName('subject-number')[0];
	        number.textContent = (i + 1) + '.';
	      }
	    }
	  </script>
  
<!-- Main JS File -->
	<script src="<c:url value='/assets/js/main.js'/>"></script>

</body>
</html>
