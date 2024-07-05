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
			
			
  		.card {
		  background-color: #fff;
		  border-radius: 10px;
		  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		  overflow: hidden;
		}
		
		.card-header {
		  background-color: black;
		  color: #fff;
		  padding: 10px 15px;
		}
		
		.card-header .nav-tabs .nav-link {
		  color: #fff;
		  border: none;
		}
		
		.card-header .nav-tabs .nav-link.active {
		  background-color: #413543;
		  border: none;
		}
		
		.card-title {
		  color: #1A120B;
		  border-bottom: 2px solid #1A120B;
		  display: inline-block;
		  padding-bottom: 5px;
		  margin-bottom: 15px;
		}
		
		.label {
		  color: #333;
		  font-weight: bold;
		}
		
		
		.tab-content {
		  background-color: #f9f9f9;
		  border-radius: 10px;
		  padding: 20px;
		}
		
		.row {
		  margin-bottom: 10px;
		}
		
		.form-control {
		  border-radius: 5px;
		}
		
		.btn-primary {
		  background-color: #007bff;
		  border: none;
		}
		
		.btn-primary:hover {
		  background-color: #0056b3;
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
	            <li><a href="<c:url value='/'/>">Home</a></li>
	            <li><a href="<c:url value='/about'/>">About</a></li>
	            <li><a href="<c:url value='/student/assessment'/>">Assessment</a></li>
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
    <section id="hero" class="hero section" >
      <img src="${pageContext.request.contextPath}/assets/img/img_h_7.jpg" alt="hero" data-aos="fade-in" />
      <div class="container" style="color:black;margin-bottom:5%">
        <div class="row">
          <div class="col-xl-4" style="height:100%">
			  <div class="card" style="border: none; box-shadow: none;">
			    <div class="card-body profile-card pt-4 d-flex flex-column align-items-center" style="text-align: center;">
			      <h4 style="color: black; margin: 15px 0 5px; font-size: 22px;">${userDetails.fullName}</h4>
			      <p style="color: gray; font-size: 16px; margin-bottom: 10px;"> Student</p>
			      <div class="social-links mt-2" style="display: flex; justify-content: center; gap: 15px;">
			        <a href="${userDetails.gitHubProfile}" class="github" style="font-size: 20px; color: #333;"><i class="bi bi-github"></i></a>
			        <a href="${userDetails.instagramProfile}" class="instagram" style="font-size: 20px; color: #333;"><i class="bi bi-instagram"></i></a>
			        <a href="${userDetails.linkedInProfile}" class="linkedin" style="font-size: 20px; color: #333;"><i class="bi bi-linkedin"></i></a>
			      </div>
			    </div>
			  </div>
			</div>
          <div class="col-xl-8">
			  <div class="card">
			    <div class="card-header">
			      <!-- Bordered Tabs -->
			      <ul class="nav nav-tabs card-header-tabs">
			        <li class="nav-item">
			          <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">
			            Overview
			          </button>
			        </li>
			        <li class="nav-item">
			          <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">
			            Edit Profile
			          </button>
			        </li>
			        <li class="nav-item">
			          <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">
			            Change Password
			          </button>
			        </li>
			      </ul>
			    </div>
			    <div class="tab-content pt-2 card-body">
			      <div class="tab-pane fade show active profile-overview" id="profile-overview">
			        <h5 class="card-title">About</h5>
			        <p class="fst-italic" style="color: #20262E;font-size: 18px;margin-bottom: 4%;">
			          ${userDetails.about}
			        </p>
			        <h5 class="card-title">Profile Details</h5>
			        <div class="row mb-3">
			          <div class="col-lg-3 col-md-4 label">Full Name</div>
			          <div class="col-lg-9 col-md-8">${userDetails.fullName}</div>
			        </div>
			        <div class="row mb-3">
			          <div class="col-lg-3 col-md-4 label">Country</div>
			          <div class="col-lg-9 col-md-8">${userDetails.country}</div>
			        </div>
			        <div class="row mb-3">
			          <div class="col-lg-3 col-md-4 label">Address</div>
			          <div class="col-lg-9 col-md-8">${userDetails.address}</div>
			        </div>
			        <div class="row mb-3">
			          <div class="col-lg-3 col-md-4 label">Phone</div>
			          <div class="col-lg-9 col-md-8">(+91) ${userDetails.phone}</div>
			        </div>
			        <div class="row mb-3">
			          <div class="col-lg-3 col-md-4 label">Email</div>
			          <div class="col-lg-9 col-md-8">${userDetails.email}</div>
			        </div>
			        <div class="row mb-3">
			          <div class="col-lg-3 col-md-4 label">College/University</div>
			          <div class="col-lg-9 col-md-8">${userDetails.college}</div>
			        </div>
			      </div>
			      <div class="tab-pane fade profile-edit pt-3" id="profile-edit">
			        <!-- Profile Edit Form -->
			        <form action="<c:url value='/student/updateProfile'/>" method="post">
			          <div class="row mb-3">
			            <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Full Name</label>
			            <div class="col-md-8 col-lg-9">
			              <input name="fullName" type="text" class="form-control" id="fullName" placeholder="${userDetails.fullName}" />
			            </div>
			          </div>
			          <div class="row mb-3">
			            <label for="about" class="col-md-4 col-lg-3 col-form-label">About</label>
			            <div class="col-md-8 col-lg-9">
			              <textarea name="about" class="form-control" id="about" style="height: 100px; color: #686D76">${userDetails.about}</textarea>
			            </div>
			          </div>
			          <div class="row mb-3">
			            <label for="Country" class="col-md-4 col-lg-3 col-form-label">Country</label>
			            <div class="col-md-8 col-lg-9">
			              <input name="country" type="text" class="form-control" id="Country" placeholder="${userDetails.country}" />
			            </div>
			          </div>
			          <div class="row mb-3">
			            <label for="Address" class="col-md-4 col-lg-3 col-form-label">Address</label>
			            <div class="col-md-8 col-lg-9">
			              <input name="address" type="text" class="form-control" id="Address" placeholder="${userDetails.address}" />
			            </div>
			          </div>
			          <div class="row mb-3">
			            <label for="Phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
			            <div class="col-md-8 col-lg-9">
			              <input name="phone" type="text" class="form-control" id="Phone" placeholder="${userDetails.phone}" />
			            </div>
			          </div>
			          <div class="row mb-3">
			            <label for="github" class="col-md-4 col-lg-3 col-form-label">GitHub Profile</label>
			            <div class="col-md-8 col-lg-9">
			              <input name="github" type="text" class="form-control" id="github" placeholder="${userDetails.gitHubProfile}" />
			            </div>
			          </div>
			          <div class="row mb-3">
			            <label for="Instagram" class="col-md-4 col-lg-3 col-form-label">Instagram Profile</label>
			            <div class="col-md-8 col-lg-9">
			              <input name="instagram" type="text" class="form-control" id="Instagram" placeholder="${userDetails.instagramProfile}" />
			            </div>
			          </div>
			          <div class="row mb-3">
			            <label for="Linkedin" class="col-md-4 col-lg-3 col-form-label">Linkedin Profile</label>
			            <div class="col-md-8 col-lg-9">
			              <input name="linkedin" type="text" class="form-control" id="Linkedin" placeholder="${userDetails.linkedInProfile}" />
			            </div>
			          </div>
			          <div class="row mb-3">
			            <label for="college" class="col-md-4 col-lg-3 col-form-label">College</label>
			            <div class="col-md-8 col-lg-9">
			              <input name="college" type="text" class="form-control" id="college" placeholder="${userDetails.college}" />
			            </div>
			          </div>
			          <div class="text-center">
			            <button type="submit" class="btn btn-primary">Save Changes</button>
			          </div>
			        </form>
			        <!-- End Profile Edit Form -->
			      </div>
			      <div class="tab-pane fade pt-3" id="profile-change-password">
			        <!-- Change Password Form -->
			        <form action="<c:url value='/student/changePassword'/>" method="post">
			          <div class="row mb-3">
			            <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current Password</label>
			            <div class="col-md-8 col-lg-9">
			              <input name="password" type="password" class="form-control" id="currentPassword" />
			            </div>
			          </div>
			          <div class="row mb-3">
			            <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
			            <div class="col-md-8 col-lg-9">
			              <input name="newpassword" type="password" class="form-control" id="newPassword" />
			            </div>
			          </div>
			          <div class="row mb-3">
			            <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter New Password</label>
			            <div class="col-md-8 col-lg-9">
			              <input name="renewpassword" type="password" class="form-control" id="renewPassword" />
			            </div>
			          </div>
			          <div class="text-center">
			            <button type="submit" class="btn btn-primary">Change Password</button>
			          </div>
			        </form>
			        <!-- End Change Password Form -->
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
  <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/aos/aos.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/php-email-form/validate.js"></script>

  <!-- Main JS File -->
  <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>