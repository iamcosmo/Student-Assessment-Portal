<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      .header .logo h1 {
        font-size: 36px;
        margin-left: 20px;
        font-weight: 700;
        font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS",
          sans-serif;
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
      .page-title {
        color: var(--default-color);
        background-color: var(--background-color);
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        padding: 160px 0 80px 0;
        text-align: center;
        position: relative;
      }

      .page-title:before {
        content: "";
        background-color: color-mix(
          in srgb,
          var(--background-color),
          transparent 30%
        );
        position: absolute;
        inset: 0;
      }

      .page-title h1 {
        font-size: 42px;
        font-weight: 700;
        margin-bottom: 10px;
      }

      .page-title .breadcrumbs ol {
        display: flex;
        flex-wrap: wrap;
        list-style: none;
        justify-content: center;
        padding: 0;
        margin: 0;
        font-size: 16px;
        font-weight: 400;
      }

      .page-title .breadcrumbs ol a {
        color: color-mix(in srgb, var(--default-color), transparent 50%);
      }

      .page-title .breadcrumbs ol a:hover {
        color: var(--contrast-color);
      }

      .page-title .breadcrumbs ol li + li {
        padding-left: 10px;
      }

      .page-title .breadcrumbs ol li + li::before {
        content: "/";
        display: inline-block;
        padding-right: 10px;
        color: color-mix(in srgb, var(--default-color), transparent 50%);
      }
      .about .content h3 {
        font-size: 2rem;
        font-weight: 700;
      }

      .about .content ul {
        list-style: none;
        padding: 0;
      }

      .about .content ul li {
        display: flex;
        align-items: flex-start;
        margin-top: 40px;
      }

      .about .content ul i {
        flex-shrink: 0;
        font-size: 48px;
        color: var(--accent-color);
        margin-right: 20px;
        line-height: 0;
      }

      .about .content ul h5 {
        font-size: 18px;
        font-weight: 700;
      }

      .about .content ul p {
        font-size: 15px;
      }

      .about .content p:last-child {
        margin-bottom: 0;
      }

      .about .pulsating-play-btn {
        position: absolute;
        left: calc(50% - 47px);
        top: calc(50% - 47px);
      }
      .stats .stats-item {
        padding: 30px;
        width: 100%;
      }

      .stats .stats-item span {
        color: white;
        font-size: 48px;
        display: block;
        font-weight: 700;
        margin-bottom: 20px;
        padding-bottom: 20px;
        position: relative;
      }

      .stats .stats-item span:after {
        content: "";
        position: absolute;
        display: block;
        width: 25px;
        height: 3px;
        background: var(--accent-color);
        left: 0;
        right: 0;
        bottom: 0;
        margin: auto;
      }

      .stats .stats-item p {
        color: white;
        padding: 0;
        margin: 0;
        font-family: var(--heading-font);
        font-weight: 500;
      }
      .section-title {
        text-align: center;
        padding: 30px 0;
        margin-bottom: 30px;
        position: relative;
      }

      .section-title h2 {
        font-size: 32px;
        font-weight: 700;
        text-transform: uppercase;
        margin-bottom: 20px;
        padding-bottom: 0;
        position: relative;
        z-index: 2;
      }

      .section-title span {
        position: absolute;
        top: 4px;
        color: color-mix(in srgb, var(--heading-color), transparent 80%);
        left: 0;
        right: 0;
        z-index: 1;
        font-weight: 700;
        font-size: 52px;
        text-transform: uppercase;
        line-height: 1;
      }

      .section-title p {
        margin-bottom: 0;
        position: relative;
        z-index: 2;
      }

      @media (max-width: 575px) {
        .section-title h2 {
          font-size: 28px;
          margin-bottom: 15px;
        }

        .section-title span {
          font-size: 38px;
        }
      }

      .testimonials {
        padding: 80px 0;
        position: relative;
      }

      .testimonials:before {
        content: "";
        background: color-mix(
          in srgb,
          var(--background-color),
          transparent 30%
        );
        position: absolute;
        inset: 0;
        z-index: 2;
      }

      .testimonials .testimonials-bg {
        position: absolute;
        inset: 0;
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
        z-index: 1;
      }

      .testimonials .container {
        position: relative;
        z-index: 3;
      }

      .testimonials .testimonials-carousel,
      .testimonials .testimonials-slider {
        overflow: hidden;
      }

      .testimonials .testimonial-item {
        text-align: center;
      }

      .testimonials .testimonial-item .testimonial-img {
        width: 100px;
        border-radius: 50%;
        border: 6px solid
          color-mix(in srgb, var(--default-color), transparent 85%);
        margin: 0 auto;
      }

      .testimonials .testimonial-item h3 {
        font-size: 20px;
        font-weight: bold;
        margin: 10px 0 5px 0;
      }

      .testimonials .testimonial-item h4 {
        font-size: 14px;
        margin: 0 0 15px 0;
        color: color-mix(in srgb, var(--default-color), transparent 40%);
      }

      .testimonials .testimonial-item .stars {
        margin-bottom: 15px;
      }

      .testimonials .testimonial-item .stars i {
        color: #ffc107;
        margin: 0 1px;
      }

      .testimonials .testimonial-item .quote-icon-left,
      .testimonials .testimonial-item .quote-icon-right {
        color: color-mix(in srgb, var(--default-color), transparent 40%);
        font-size: 26px;
        line-height: 0;
      }

      .testimonials .testimonial-item .quote-icon-left {
        display: inline-block;
        left: -5px;
        position: relative;
      }

      .testimonials .testimonial-item .quote-icon-right {
        display: inline-block;
        right: -5px;
        position: relative;
        top: 10px;
        transform: scale(-1, -1);
      }

      .testimonials .testimonial-item p {
        font-style: italic;
        margin: 0 auto 15px auto;
      }

      .testimonials .swiper-wrapper {
        height: auto;
      }

      .testimonials .swiper-pagination {
        margin-top: 20px;
        position: relative;
      }

      .testimonials .swiper-pagination .swiper-pagination-bullet {
        width: 12px;
        height: 12px;
        background-color: color-mix(
          in srgb,
          var(--default-color),
          transparent 50%
        );
        opacity: 0.5;
      }

      .testimonials .swiper-pagination .swiper-pagination-bullet-active {
        background-color: var(--default-color);
        opacity: 1;
      }

      @media (min-width: 992px) {
        .testimonials .testimonial-item p {
          width: 80%;
        }
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
	            <li><a href="<c:url value='/about'/>" class="active">About</a></li>
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
      <!-- Page Title -->
      <div
        class="page-title dark-background"
        data-aos="fade"
        style="background-image: url(assets/img/phot03.avif)"
      >
        <div class="container position-relative">
          <h1>About</h1>
          <p>
            Discover our cutting-edge assessment portal designed to streamline
            the test creation and participation process, offering robust
            functionalities for both administrators and users.
          </p>
          <nav class="breadcrumbs">
            <ol>
              <li><a href="<c:url value='/'/>">Home</a></li>
              <li class="current">About</li>
            </ol>
          </nav>
        </div>
      </div>
      <!-- End Page Title -->

      <!-- About Section -->
      <section id="about" class="about section">
        <div class="container">
          <div class="row gy-4">
            <div
              class="col-lg-6 position-relative align-self-start order-lg-last order-first"
              data-aos="fade-up"
              data-aos-delay="200"
            >
              <img src="assets/img/hero-bg1.jpg" class="img-fluid" alt="" />
              <a
                href="https://www.youtube.com/watch?v=LXb3EKWsInQ"
                class="glightbox pulsating-play-btn"
              ></a>
            </div>

            <div
              class="col-lg-6 content order-last order-lg-first"
              data-aos="fade-up"
              data-aos-delay="100"
            >
              <h3>About StudentZone</h3>
              <p>
                Welcome to our comprehensive assessment portal, designed to
                facilitate seamless test creation and participation for both
                administrators and users. Our portal provides an intuitive
                interface and a range of functionalities to enhance your
                assessment experience.
              </p>
              <ul>
                <li>
                  <i class="bi bi-diagram-3"></i>
                  <div>
                    <h5>Admin Dashboard</h5>
                    <p>
                      Administrators can manage tests with ease, including
                      adding new tests, editing and deleting existing ones.
                    </p>
                  </div>
                </li>
                <li>
                  <i class="bi bi-fullscreen-exit"></i>
                  <div>
                    <h5>User-Friendly Test Interface</h5>
                    <p>
                      Users can register, select tests from various programming
                      languages, and take assessments in a straightforward and
                      engaging format.
                    </p>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </section>

      <!-- /About Section -->

      <!-- Stats Section -->
      <section
        id="stats"
        class="stats section"
        style="background: url(assets/img/stats-bg.jpg)"
      >
        <div class="container" data-aos="fade-up" data-aos-delay="100">
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
                  data-purecounter-end="1254"
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
            <!-- End Stats Item -->
          </div>
        </div>
      </section>
      <!-- /Stats Section -->

      <!-- Testimonials Section -->
      <section id="testimonials" class="testimonials section dark-background">
        <!-- Section Title -->
        <div class="container section-title" data-aos="fade-up">
          <span>Quotes<br /></span>
          <h2>Quotes</h2>
          <p>
            Discover the wisdom and insights from some of the greatest minds in
            history, inspiring you to pursue knowledge and excellence.
          </p>
        </div>
        <!-- End Section Title -->

        <div class="container" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper init-swiper">
            <script type="application/json" class="swiper-config">
              {
                "loop": true,
                "speed": 600,
                "autoplay": {
                  "delay": 5000
                },
                "slidesPerView": "auto",
                "pagination": {
                  "el": ".swiper-pagination",
                  "type": "bullets",
                  "clickable": true
                }
              }
            </script>
            <div class="swiper-wrapper">
              <div class="swiper-slide">
                <div class="testimonial-item">
                  <img
                    src="assets/img/testimonials/einstein11.jpg"
                    class="testimonial-img"
                    alt=""
                  />
                  <h3>Albert Einstein</h3>
                  <div class="stars">
                    <i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i>
                  </div>
                  <p>
                    <i class="bi bi-quote quote-icon-left"></i>
                    <span
                      >Education is not the learning of facts, but the training
                      of the mind to think.</span
                    >
                    <i class="bi bi-quote quote-icon-right"></i>
                  </p>
                </div>
              </div>
              <!-- End testimonial item -->

              <div class="swiper-slide">
                <div class="testimonial-item">
                  <img
                    src="assets/img/testimonials/Nelson_Mandela_1994.jpg"
                    class="testimonial-img"
                    alt=""
                  />
                  <h3>Nelson Mandela</h3>
                  <div class="stars">
                    <i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i>
                  </div>
                  <p>
                    <i class="bi bi-quote quote-icon-left"></i>
                    <span
                      >Education is the most powerful weapon which you can use
                      to change the world.</span
                    >
                    <i class="bi bi-quote quote-icon-right"></i>
                  </p>
                </div>
              </div>
              <!-- End testimonial item -->

              <div class="swiper-slide">
                <div class="testimonial-item">
                  <img
                    src="assets/img/testimonials/Malcolm_X_NYWTS_2.jpg"
                    class="testimonial-img"
                    alt=""
                  />
                  <h3>Malcolm X</h3>
                  <div class="stars">
                    <i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i>
                  </div>
                  <p>
                    <i class="bi bi-quote quote-icon-left"></i>
                    <span
                      >Education is the passport to the future, for tomorrow
                      belongs to those who prepare for it today.</span
                    >
                    <i class="bi bi-quote quote-icon-right"></i>
                  </p>
                </div>
              </div>
              <!-- End testimonial item -->

              <div class="swiper-slide">
                <div class="testimonial-item">
                  <img
                    src="assets/img/testimonials/confucius.jpg"
                    class="testimonial-img"
                    alt=""
                  />
                  <h3>Confucius</h3>
                  <div class="stars">
                    <i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i>
                  </div>
                  <p>
                    <i class="bi bi-quote quote-icon-left"></i>
                    <span
                      >The man who moves a mountain begins by carrying away
                      small stones.</span
                    >
                    <i class="bi bi-quote quote-icon-right"></i>
                  </p>
                </div>
              </div>
              <!-- End testimonial item -->

              <div class="swiper-slide">
                <div class="testimonial-item">
                  <img
                    src="assets/img/testimonials/benjaminf.jpg"
                    class="testimonial-img"
                    alt=""
                  />
                  <h3>Benjamin Franklin</h3>
                  <div class="stars">
                    <i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i
                    ><i class="bi bi-star-fill"></i>
                  </div>
                  <p>
                    <i class="bi bi-quote quote-icon-left"></i>
                    <span
                      >An investment in knowledge pays the best interest.A</span
                    >
                    <i class="bi bi-quote quote-icon-right"></i>
                  </p>
                </div>
              </div>
              <!-- End testimonial item -->
            </div>
            <div class="swiper-pagination"></div>
          </div>
        </div>
      </section>
      <!-- /Testimonials Section -->

      <!-- Team Section -->
      <section id="team" class="team section">
        <!-- Section Title -->
        <div class="container section-title" data-aos="fade-up">
          <span>Our Team<br /></span>
          <h2>Our Team</h2>
          <p>
            Meet our dedicated and talented team, committed to delivering
            excellence and innovation in every project we undertake.<br />
            Together, we strive to create meaningful impact and drive success.
          </p>
        </div>

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
