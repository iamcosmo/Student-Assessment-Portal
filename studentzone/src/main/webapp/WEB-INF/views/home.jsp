<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      rel="stylesheet"
    />

    <!-- Vendor CSS Files -->
    <link
      href="assets/vendor/bootstrap/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
    <link
      href="assets/vendor/glightbox/css/glightbox.min.css"
      rel="stylesheet"
    />
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Main CSS File -->
    <link href="assets/css/main.css" rel="stylesheet" />
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
	            <li><a href="<c:url value='/'/>" class="active">Home</a></li>
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
	    							color: black;
	    							text-shadow: 0px 0px 8px white;
	    							">
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
        <img src="assets/img/hero-bg.jpg" alt="hero" data-aos="fade-in" />
        <div class="container">
          <div class="row">
            <div class="col-lg-10">
              <h2 data-aos="fade-up" data-aos-delay="100">
                Welcome to ExamPrep Portal
              </h2>
              <p data-aos="fade-up" data-aos-delay="200">
                Your gateway to academic success. Prepare for exams with our
                comprehensive resources.
              </p>
            </div>
            
          </div>
        </div>
      </section>
      <!-- /Hero Section -->
      <!-- About Section -->
      <section id="about" class="about section">
        <div class="container" data-aos="fade-up" data-aos-delay="100">
          <div class="row align-items-xl-center gy-5">
            <div class="col-xl-5 content">
              <h3>About Us</h3>
              <h2>StudentZone</h2>
              <p>
                ExamPrep Portal is a comprehensive platform designed to help
                students excel in their exams. Our resources cover a wide range
                of subjects and provide valuable practice and insights.
              </p>
              <a href="<c:url value='/about'/>" class="read-more"
                ><span>Read More</span><i class="bi bi-arrow-right"></i
              ></a>
            </div>
          </div>
        </div>
      </section>
      <!-- /About Section -->

      <!-- Stats Section -->
      <section id="stats" class="stats section">
        <img src="assets/img/stats-bg.jpg" alt="" data-aos="fade-in" />

        <div
          class="container position-relative"
          data-aos="fade-up"
          data-aos-delay="100"
        >
          <div class="row gy-4">
            <div class="col-lg-3 col-md-6">
              <div class="stats-item text-center w-100 h-100">
                <span
                  data-purecounter-start="0"
                  data-purecounter-end="15"
                  data-purecounter-duration="1"
                  class="purecounter"
                ></span>
                <p>Subjects</p>
              </div>
            </div>
            <!-- End Stats Item -->

            <div class="col-lg-3 col-md-6">
              <div class="stats-item text-center w-100 h-100">
                <span
                  data-purecounter-start="0"
                  data-purecounter-end="521"
                  data-purecounter-duration="1"
                  class="purecounter"
                ></span>
                <p>Students</p>
              </div>
            </div>
            <!-- End Stats Item -->

            <div class="col-lg-3 col-md-6">
              <div class="stats-item text-center w-100 h-100">
                <span
                  data-purecounter-start="0"
                  data-purecounter-end="1453"
                  data-purecounter-duration="1"
                  class="purecounter"
                ></span>
                <p>Hours Of Study</p>
              </div>
            </div>
            <!-- End Stats Item -->

            <div class="col-lg-3 col-md-6">
              <div class="stats-item text-center w-100 h-100">
                <span
                  data-purecounter-start="0"
                  data-purecounter-end="32"
                  data-purecounter-duration="1"
                  class="purecounter"
                ></span>
                <p>Teachers</p>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- /Stats Section -->

      <!-- Services Section -->
      <section id="services" class="services section">
        <!-- Section Title -->
        <div class="container section-title" data-aos="fade-up">
          <h2>Services</h2>
          <p>
            We provide a range of services to support your exam preparation:
          </p>
        </div>
        <!-- End Section Title -->

        <div class="container">
          <div class="row gy-3">
            <div class="col-lg-6" data-aos="fade-up" data-aos-delay="100">
              <div class="service-item d-flex">
                <div class="icon flex-shrink-0">
                  <i class="bi bi-briefcase"></i>
                </div>
                <div>
                  <h4 class="title">Subject-wise Practice Tests</h4>
                </div>
              </div>
            </div>
            <!-- End Service Item -->

            <div class="col-lg-6" data-aos="fade-up" data-aos-delay="200">
              <div class="service-item d-flex">
                <div class="icon flex-shrink-0">
                  <i class="bi bi-card-checklist"></i>
                </div>
                <div>
                  <h4 class="title">Profile View</h4>
                </div>
              </div>
            </div>
            <!-- End Service Item -->

            <div class="col-lg-6" data-aos="fade-up" data-aos-delay="300">
              <div class="service-item d-flex">
                <div class="icon flex-shrink-0">
                  <i class="bi bi-bar-chart"></i>
                </div>
                <div>
                  <h4 class="title">Result</h4>
                </div>
              </div>
            </div>
            <!-- End Service Item -->
          </div>
        </div>
      </section>
      <!-- /Services Section -->

      <!-- Features Section -->
      <section id="features" class="features section">
        <!-- Section Title -->
        <div class="container section-title" data-aos="fade-up">
          <h2>Features</h2>
        </div>
        <!-- End Section Title -->

        <div class="container">
          <div
            class="row gy-4 align-items-stretch justify-content-between features-item"
          >
            <div
              class="col-lg-5 d-flex justify-content-center flex-column"
              data-aos="fade-up"
            >
              <p>Discover how ExamPrep Portal can boost your exam readiness:</p>
              <ul>
                <li>
                  <i class="bi bi-check"></i>
                  <span>Extensive Question Bank</span>
                </li>
                <li>
                  <i class="bi bi-check"></i
                  ><span> Real-time Performance Analytics</span>
                </li>
                <li>
                  <i class="bi bi-check"></i>
                  <span>Interactive Quizzes and Mock Tests</span>.
                </li>
              </ul>
            </div>
          </div>
          <!-- Features Item -->
        </div>
      </section>
      <!-- /Features Section -->

      <!-- Team Section -->
      <section id="team" class="team section">
        <!-- Section Title -->
        <div class="container section-title" data-aos="fade-up">
          <h2>Team</h2>
        </div>
        <!-- End Section Title -->

        <div class="container">
          <div class="row gy-5">
            <div
              class="col-lg-4 col-md-6 member"
              data-aos="fade-up"
              data-aos-delay="100"
            >
              <div class="member-img">
                <img
                  src="assets/img/team/team-1.jpg"
                  class="img-fluid"
                  alt=""
                />
                <div class="social">
                  <a target="_blank" href="https://github.com/RojySamal"
                    ><i class="bi bi-github"></i>
                  </a>
                  <a
                    target="_blank"
                    href="https://www.instagram.com/_.rosy._9?igsh=MTRkdWJ3ZzQ0bDZ6Mw=="
                    ><i class="bi bi-instagram"></i
                  ></a>
                  <a
                    target="_blank"
                    href="https://www.linkedin.com/in/rojy-samal-24274823b"
                    ><i class="bi bi-linkedin"></i
                  ></a>
                </div>
              </div>
              <div class="member-info text-center">
                <h5>Rojy Samal</h5>
              </div>
            </div>
            <!-- End Team Member -->

            <div
              class="col-lg-4 col-md-6 member"
              data-aos="fade-up"
              data-aos-delay="200"
            >
              <div class="member-img">
                <img
                  src="assets/img/team/team-2.jpg"
                  class="img-fluid"
                  alt=""
                />
                <div class="social">
                  <a target="_blank" href="https://github.com/iamcosmo"
                    ><i class="bi bi-github"></i>
                  </a>
                  <a target="_blank" href="https://www.instagram.com/cosmos22_/"
                    ><i class="bi bi-instagram"></i
                  ></a>
                  <a
                    target="_blank"
                    href="https://www.linkedin.com/in/chandanckp/"
                    ><i class="bi bi-linkedin"></i
                  ></a>
                </div>
              </div>
              <div class="member-info text-center">
                <h5>Chandan Kumar Pandey</h5>
              </div>
            </div>
            <!-- End Team Member -->

            <div
              class="col-lg-4 col-md-6 member"
              data-aos="fade-up"
              data-aos-delay="300"
            >
              <div class="member-img">
                <img
                  src="assets/img/team/team-3.jpg"
                  class="img-fluid"
                  alt=""
                />
                <div class="social">
                  <a target="_blank" href="https://github.com/Psaikishanrao"
                    ><i class="bi bi-github"></i>
                  </a>
                  <a
                    target="_blank"
                    href="https://www.instagram.com/sai_kishan_rao?igsh=MWhxZnNxdDhqYjl0dw=="
                    ><i class="bi bi-instagram"></i
                  ></a>
                  <a
                    target="_blank"
                    href="https://www.linkedin.com/in/sai-kishan-58b444247/"
                    ><i class="bi bi-linkedin"></i
                  ></a>
                </div>
              </div>
              <div class="member-info text-center">
                <h5>Sai Kishan Rao</h5>
              </div>
            </div>
            <!-- End Team Member -->
          </div>
        </div>
      </section>
      <!-- /Team Section -->

      <!--Feedback Section -->
      <section id="call-to-action" class="call-to-action section">
        <img
          src="assets/img/cta-bg.jpg"
          alt=""
          style="
            width: 100%;
            height: 100%;
            position: absolute;
            z-index: -1;
            opacity: 0.5;
          "
        />

        <div class="container">
          <div
            class="row justify-content-center"
            data-aos="zoom-in"
            data-aos-delay="100"
          >
            <div class="col-xl-10">
              <div class="text-center">
                <h3 style="color: #fff; font-weight: bold; margin-bottom: 20px">
                  Feedback
                </h3>
                <div class="form-floating">
                  <form
                    action="forms/contact.php"
                    method="post"
                    class="php-email-form"
                    data-aos="fade-up"
                    data-aos-delay="200"
                  >
                    <div class="row gy-4">
                      <div class="col-md-6">
                        <input
                          type="text"
                          name="name"
                          class="form-control"
                          placeholder="Your Name"
                          required=""
                        />
                      </div>

                      <div class="col-md-6">
                        <input
                          type="email"
                          class="form-control"
                          name="email"
                          placeholder="Your Email"
                          required=""
                        />
                      </div>

                      <div class="col-md-12">
                        <input
                          type="text"
                          class="form-control"
                          name="subject"
                          placeholder="Subject"
                          required=""
                        />
                      </div>

                      <div class="col-md-12">
                        <textarea
                          class="form-control"
                          name="message"
                          rows="6"
                          placeholder="Message"
                          required=""
                        ></textarea>
                      </div>
                    </div>
                  </form>
                  <button
                    type="button"
                    class="btn btn-outline-light"
                    style="
                      margin-top: 25px;
                      padding: 10px 20px;
                      font-size: 16px;
                      border: 2px solid #fff;
                      border-radius: 50px;
                      transition: background-color 0.3s ease;
                    "
                    onmouseover="this.style.backgroundColor='#fff'; this.style.color='#000';"
                  >
                    Submit Feedback
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- /Feedback Section -->

      <!-- Contact Section -->
      <section id="contact" class="contact section">
        <!-- Section Title -->
        <div class="container section-title" data-aos="fade-up">
          <h2>Contact</h2>
        </div>
        <!-- End Section Title -->

        <div class="container" data-aos="fade-up" data-aos-delay="100" >
          <div class="row gy-4 justify-content-center">
            <div class="col-md-4">
              <div class="info-item" data-aos="fade" data-aos-delay="200">
                <i class="bi bi-geo-alt"></i>
                <h3>Address</h3>
                <p>Silicon University</p>
                <p>Bhubaneswar, India 751010</p>
              </div>
            </div>
            <!-- End Info Item -->

            <div class="col-md-4">
              <div class="info-item" data-aos="fade" data-aos-delay="300">
                <i class="bi bi-telephone"></i>
                <h3>Call Us</h3>
                <p>+91 1234567899</p>
                <p>+91 1234567809</p>
                
              </div>
            </div>
            <!-- End Info Item -->

            <div class="col-md-4">
              <div class="info-item" data-aos="fade" data-aos-delay="400">
                <i class="bi bi-envelope"></i>
                <h3>Email Us</h3>
                <p>info@example.com</p>
                <p>contact@example.com</p>
              </div>
            </div>
            <!-- End Info Item -->
          </div>
        </div>
      </section>
      <!-- /Contact Section -->
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

          <div
            class="col-lg-3 col-md-12 footer-contact text-center text-md-start"
          >
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

      <div class="container copyright text-center mt-4">
        <p>
          � <span>Copyright</span> <strong class="sitename">StudentZone</strong>
          <span>All Rights Reserved</span>
        </p>
      </div>
    </footer>
    <!-- /Footer Section -->

    <!-- Scroll Top -->
    <a
      href="#"
      id="scroll-top"
      class="scroll-top d-flex align-items-center justify-content-center"
      ><i class="bi bi-arrow-up-short"></i
    ></a>

    <!-- Preloader -->
    <div id="preloader"></div>

    <!-- Vendor JS Files -->
    <!-- script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>
    <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
    <script src="assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
    <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

    <!-- Main JS File -->
    <script src="assets/js/main.js"></script>
  </body>
</html>