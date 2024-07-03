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
  
      .form-control {
        border: 1px solid lightblue;
        margin-left: 3%;
        cursor: pointer;
      }
      .widget-26 {
        color: #3c4142;
        font-weight: 400;
      }

      .widget-26 tr:first-child td {
        border: 0;
      }

      .widget-26 .widget-26-slno {
        font-weight: 700;
      }

      .widget-26 .widget-26-test {
        min-width: 200px;
        font-weight: 500;
        line-height: 1.5;
      }

      .widget-26 .widget-26-test:hover {
        color: red;
        text-decoration: none;
        cursor: pointer;
      }

      .widget-26 .widget-26-total-mark {
        min-width: 100px;
        font-weight: 500;
      }

      .widget-26 .widget-26-mark-obtained {
        min-width: 70px;
        font-weight: 500;
        color: green; /*if pass-->green, fail-->red*/
      }

      .widget-26 .widget-26-sub-category {
        padding: 0.5rem;
        display: inline-flex;
        white-space: nowrap;
        border-radius: 10px;
      }

      .widget-26 .widget-26-sub-category span {
        color: #3c4142;
        font-weight: 600;
      }
      
      
      .bg-soft-base {
        background-color: hsl(185, 80%, 86%);
      }
      .bg-soft-warning {
        background-color: hsl(38, 100%, 88%);
      }
      .bg-soft-success {
        background-color: hsl(174, 92%, 85%);
      }
      .bg-soft-danger {
        background-color: hwb(354 78% 0%);
      }
      .bg-soft-info {
        background-color: #bde4fd;
      }      
      
      @media (min-width: 768px) and (max-width: 991.98px) {
        .search-body .search-filters {
          display: flex;
        }
        .search-body .search-filters .filter-list {
          margin-right: 1rem;
        }
      }

      .card-margin {
        margin-bottom: 1.875rem;
      }

      @media (min-width: 992px) {
        .col-lg-2 {
          flex: 0 0 16.66667%;
          max-width: 16.66667%;
        }
      }

      .card-margin {
        margin-bottom: 1.875rem;
      }
      .card {
        border: 0;
        box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
        -webkit-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
        -moz-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
        -ms-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
      }
      .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #ffffff;
        background-clip: border-box;
        border: 1px solid #e6e4e9;
        border-radius: 8px;
        margin-top: -3%;
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
	            <li><a href="<c:url value='/exam'/>">About</a></li>
	            <li><a href="<c:url value='/student/assessment'/>">Assessment</a></li>
	            <li><a href="<c:url value='/result'/>" class="active">Results</a></li>
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
	        <img
	          src="assets/img/photo1.avif"
	          alt="hero"
	          data-aos="fade-in"
	        />
	        <div class="container">
	          <div class="row">
	            <div class="col-12">
	              <div class="card card-margin">
	                <div class="card-body">
	                  <div class="row search-body">
	                    <div class="col-lg-12">
	                      <div class="search-result">
	                        <div class="result-header">
	                          <div class="row">
	                            <div class="col-lg-8">
	                              <div>
	                                <h3
	                                  style="
	                                    color: black;
	                                    font-family: Georgia, 'Times New Roman',
	                                      Times, serif;
	                                  "
	                                >
	                                  Results:
	                                </h3>
	                              </div>
	                            </div>
	                            <div class="col-lg-4" style="text-align: right">
	                              <div class="records">
	                                Showing: <b id="start-record">1</b>-
	                                <b id="end-record">5</b> of
	                                <b id="total-records">10</b> results
	                              </div>
	                            </div>
	                          </div>
	                        </div>
	                        <div class="result-body">
	                          <div class="table-responsive">
	                            <table
	                              class="table widget-26 table-striped table-hover text-center"
	                            >
	                              <thead class="table-dark">
	                                <tr>
	                                  <th>Serial No.</th>
	                                  <th>Tests Appeared</th>
	                                  <th>Total Marks</th>
	                                  <th>Marks Obtained</th>
	                                  <th>Subject Tags</th>
	                                </tr>
	                              </thead>
	                              <tbody
                                class="table-group-divider"
                                id="results-tbody"
                              >
                                <tr>
                                  <td>
                                    <div class="widget-26-slno">1</div>
                                  </td>
                                  <td>
                                    <div class="widget-26-test">Java</div>
                                  </td>
                                  <td>
                                    <div class="widget-26-total-mark">100</div>
                                  </td>
                                  <td>
                                    <div class="widget-26-mark-obtained">
                                      50
                                    </div>
                                  </td>
                                  <td>
                                    <div
                                      class="widget-26-sub-category bg-soft-base"
                                    >
                                      <span>Java</span>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>
                                    <div class="widget-26-slno">2</div>
                                  </td>
                                  <td>
                                    <div class="widget-26-test">C++/C</div>
                                  </td>
                                  <td>
                                    <div class="widget-26-total-mark">100</div>
                                  </td>
                                  <td>
                                    <div class="widget-26-mark-obtained">
                                      60
                                    </div>
                                  </td>
                                  <td>
                                    <div
                                      class="widget-26-sub-category bg-soft-warning"
                                    >
                                      <span>C/C++</span>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>
                                    <div class="widget-26-slno">3</div>
                                  </td>
                                  <td>
                                    <div class="widget-26-test">Pyhton</div>
                                  </td>
                                  <td>
                                    <div class="widget-26-total-mark">100</div>
                                  </td>
                                  <td>
                                    <div class="widget-26-mark-obtained">
                                      60
                                    </div>
                                  </td>
                                  <td>
                                    <div
                                      class="widget-26-sub-category bg-soft-success"
                                    >
                                      Python
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>
                                    <div class="widget-26-slno">4</div>
                                  </td>
                                  <td>
                                    <div class="widget-26-test">SQL</div>
                                  </td>
                                  <td>
                                    <div class="widget-26-total-mark">100</div>
                                  </td>
                                  <td>
                                    <div class="widget-26-mark-obtained">
                                      80
                                    </div>
                                  </td>
                                  <td>
                                    <div
                                      class="widget-26-sub-category bg-soft-danger"
                                    >
                                      SQL
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>
                                    <div class="widget-26-slno">5</div>
                                  </td>
                                  <td>
                                    <div class="widget-26-test">
                                      Data Analyst
                                    </div>
                                  </td>
                                  <td>
                                    <div class="widget-26-total-mark">100</div>
                                  </td>
                                  <td>
                                    <div class="widget-26-mark-obtained">
                                      75
                                    </div>
                                  </td>
                                  <td>
                                    <div
                                      class="widget-26-sub-category bg-soft-info widget-26-total-mark"
                                    >
                                      <div>Python SQL</div>
                                    </div>
                                  </td>
                                </tr>
                              </tbody>
	                            </table>
	                          </div>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                  <nav class="d-flex justify-content-between">
	                    <div class="result-paging">
	                      <button id="prev-page" class="btn btn-primary">
	                        Previous
	                      </button>
	                    </div>
	                    <div class="result-paging">
	                      <button id="next-page" class="btn btn-primary">
	                        Next
	                      </button>
	                    </div>
	                  </nav>
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
