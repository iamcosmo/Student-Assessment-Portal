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
  		:root {
    	  --nav-font: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande",
    	  "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
    	  }
    	  .header .logo h1 {
			  font-size: 36px;
			  margin-left: 20px;
			  font-weight: 700;
			  font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
			  color: var(--heading-color);
			  text-shadow: 3px 1px 2px white;
		   }
		   .header .btn-getstarted,
			.header .btn-getstarted:focus {
			  color: var(--contrast-color);
			  background: var(--accent-color);
			  font-size: 14px;
			  padding: 8px 26px;
			  margin-right: 30px;
			  border-radius: 4px;
			  transition: 0.3s;
			}
			/* Index Page Header
			------------------------------*/
			.index-page .header {
			  --background-color: rgba(255, 255, 255, 0);
			  --heading-color: #121212;
			  --nav-color: white;
			  --nav-hover-color: #ff1010;
			}
			
			/* Index Page Header on Scroll
			------------------------------*/
			.index-page.scrolled .header {
			  --background-color: #ffffff;
			  --heading-color: #e84545;
			  --nav-color: #020bff;
			  --nav-hover-color: #e84545;
			}
			.navmenu ul {
    			margin-right: 100px;
    		}
			.navmenu a,
			.navmenu a:focus {
			  color: var(--nav-color);
			  padding: 18px 15px;
			  font-size: 18px;
			  font-family: var(--nav-font);
			  font-weight: 500;
			  display: flex;
			  align-items: center;
			  justify-content: space-between;
			  white-space: nowrap;
			  transition: 0.3s;
			}
  		
      .custom-column {
        background-image: url(https://plus.unsplash.com/premium_photo-1673795754011-de6766149646?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1pbi1zYW1lLXNlcmllc3wzfHx8ZW58MHx8fHx8); /* Background image */
        background-size: cover; /* Ensure the image covers the entire area */
        background-position: center; /* Center the image */
        color: black; /* White text */
        text-align: center; /* Centered text */
        padding: 20px; /* Padding */
        border-radius: 10px; /* Rounded corners */
        position: relative; /* Needed for overlay */
        font-family: Georgia, "Times New Roman", Times, serif, Times, serif;
        box-shadow: -5px 5px 10px black;
      }
      .custom-column:hover {
        transform: translateY(-10px); /* Lift effect on hover */
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Deeper shadow on hover */
      }
      .custom-column .content {
        position: relative; /* Position content above overlay */
        z-index: 2; /* Ensure content is above overlay */
      }
      .custom-column .title {
        font-size: 1.5rem;
        margin-bottom: 10px;
        font-weight: 700;
        text-align: left;
      }
      .custom-column .subtitle {
        font-size: 1rem;
        margin-bottom: 20px;
        font-weight: 500;
        text-align: left;
        font-style: oblique;
      }
      .custom-column .start-btn {
        background-color: white; /* Button background color */
        color: black; /* Button text color */
        border: none; /* Remove border */
        padding: 5px 10px; /* Button padding */
        border-radius: 5px; /* Rounded button corners */
        text-decoration: none; /* Remove underline */
        float: right;
        font-weight: 600;
        box-shadow: -2px 2px 5px black;
      }
    </style>
  
</head>

<body class="index-page">
  <header id="header" class="header d-flex align-items-center fixed-top">
		<div class="container-fluid position-relative d-flex align-items-center justify-content-between">
	        <a
	          href="<c:url value='/'/>"
	          class="logo d-flex align-items-center me-auto me-xl-0"
	        >
	          <h1 class="sitename">StudentZone</h1>
	          <span></span>
	        </a>

	        <nav id="navmenu" class="navmenu">
	          <ul>
	            <li><a href="<c:url value='/'/>" >Home</a></li>
	            <li><a href="<c:url value='/about'/>">About</a></li>
	            <li><a href="<c:url value='/student/assessment'/>" class="active">Assessment</a></li>
	            <li><a href="<c:url value='/student/results'/>">Results</a></li>
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
	                    			style="font-size: 2rem;
	    							cursor: pointer;
	    							color: black;">
	    						</i>
						  </button>
						  <ul class="dropdown-menu">
						    <li><a class="dropdown-item" href="<c:url value='/student/profile'/>">Profile</a></li>
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
      <img src="<c:url value='/assets/img/photo1.avif'/>" alt="hero" data-aos="fade-in" />
      <div class="container" style="margin-top: -3%">
          <div class="row">
            <div class="col-lg-12">
            <!-- Check if there is an error message -->
            <c:if test="${not empty same_exam_error}">
              <p style="color: red">${same_exam_error}</p>
            </c:if>
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                  <button
                    class="nav-link active"
                    id="home-tab"
                    data-bs-toggle="tab"
                    data-bs-target="#home-tab-pane"
                    type="button"
                    role="tab"
                    aria-controls="home-tab-pane"
                    aria-selected="true"
                    style="
                      font-weight: 800;
                      font-family: Georgia, Times, serif;
                      color: black;
                    "
                  >
                    All Sets
                  </button>
                </li>
                <li class="nav-item" role="presentation">
                  <button
                    class="nav-link"
                    id="profile-tab"
                    data-bs-toggle="tab"
                    data-bs-target="#profile-tab-pane"
                    type="button"
                    role="tab"
                    aria-controls="profile-tab-pane"
                    aria-selected="false"
                    style="
                      font-weight: 800;
                      font-family: Georgia, Times, serif;
                      color: black;
                    "
                  >
                    Your Subject Sets
                  </button>
                </li>
              </ul>
              <div class="tab-content" id="myTabContent" style="margin-top: 3%">
                <div
                  class="tab-pane fade show active"
                  id="home-tab-pane"
                  role="tabpanel"
                  aria-labelledby="home-tab"
                  tabindex="0"
                >
                  <div class="container">
                    <div class="row g-4">
                    <c:forEach var="set" items="${setswithtags}">
                      <div class="col-6">
                        <div class="p-4 custom-column">
                          <div class="title">${set.getName()}</div>
                          <div class="subtitle">Total Questions: ${set.questionCount}</div>
                          <div class="subtitle">
                            Subject Tags: <c:forEach var="tag" items="${set.getTags()}"><span class="badge bg-primary me-2">${tag}</span>
</c:forEach>
                            <form action="<c:url value='/student/beginexam'/>" method="post" class="mb-6">
                              <input type="hidden" name="setid" value="${set.id}" />
                              <button type="submit" class="start-btn">Start</button>
                            </form>
                          </div>
                        </div>
                      </div>
                      </c:forEach>
                    </div>
                  </div>
                </div>
                <div
                  class="tab-pane fade"
                  id="profile-tab-pane"
                  role="tabpanel"
                  aria-labelledby="profile-tab"
                  tabindex="0"
                >
                  <div class="container">
                    <div class="row g-4">
                    <c:forEach var="set" items="${filteredsetswithtags}">
                      <div class="col-6">
                        <div class="p-4 custom-column">
                          <div class="title">${set.getName()}</div>
                          <div class="subtitle">Total Questions: ${set.questionCount}</div>
                          <div class="subtitle">
                            Subject Tags: <c:forEach var="tag" items="${set.getTags()}"><span class="badge bg-primary me-2">${tag}</span>
</c:forEach>
                            <form action="<c:url value='/student/beginexam'/>" method="post" class="mb-6">
                              <input type="hidden" name="setid" value="${set.id}" />
                              <button type="submit" class="start-btn">Start Learning</button>
                            </form>
                          </div>
                        </div>
                      </div>
                      </c:forEach>
                    </div>
                  </div>
                </div>
              </div>
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
<!-- Main JS File -->
	<script src="<c:url value='/assets/js/main.js'/>"></script>

</body>
</html>
