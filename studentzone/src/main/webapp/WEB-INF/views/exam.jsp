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
      href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900&display=swap"
      rel="stylesheet"
    />

    <!-- Vendor CSS Files -->
  <link href="<c:url value='/assets/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" />
  <link href="<c:url value='/assets/vendor/bootstrap-icons/bootstrap-icons.css'/>" rel="stylesheet" />
<link href="<c:url value='/assets/vendor/aos/aos.css'/>" rel="stylesheet" />
<link href="<c:url value='/assets/vendor/glightbox/css/glightbox.min.css'/>" rel="stylesheet" />
<link href="<c:url value='/assets/vendor/swiper/swiper-bundle.min.css'/>" rel="stylesheet" />

  <!-- Main CSS File -->
  <link href="<c:url value='/assets/css/main.css'/>" rel="stylesheet" />
  

    <style>
      /* Custom CSS for the quiz welcome section */
      .start-screen {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 80%;
        text-align: center;
        background-color: #f8f9fa;
        margin-top: -3%;
        width: 80%;
        margin-left: 10%;
      }

      .start-screen img {
        position: relative;
        width: 30%;
        height: 50%;
      }

      .start-screen h1 {
        font-size: 2.5rem;
        font-weight: 700;
        color: black;
      }

      .start-screen p {
        font-size: 1.25rem;
        margin: 20px 0;
        color: rgb(87, 87, 87);
      }

      .start-screen .btn-start {
        font-size: 1.25rem;
        padding: 10px 30px;
        margin-bottom: 5%;
      }

      #questions-container {
        padding: 20px;
      }

      .question {
        margin-bottom: 20px;
      }

      #question-navigator {
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #fff; /* Ensure navigator background is distinct */
        position: sticky;
        top: 70px; /* Adjust according to your navbar height */
        z-index: 100; /* Ensure it's above other content */
      }

      #question-navigator .legend {
        display: flex;
        justify-content: space-between;
        margin-bottom: 10px;
      }

      #question-navigator .legend span {
        display: inline-block;
        padding: 5px 10px;
        border-radius: 5px;
      }

      #question-navigator .legend .answered {
        background-color: #001f3f;
        color: white;
      }

      #question-navigator .legend .unanswered {
        background-color: #ff4136;
        color: white;
      }

      #question-buttons {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 10px;
      }

      #question-buttons .btn {
        width: 100%;
        padding: 10px;
      }

      #question-buttons .btn.answered {
        background-color: #001f3f;
        color: white;
      }

      #question-buttons .btn.unanswered {
        background-color: #ff4136;
        color: white;
      }
      #submission-message {
        text-align: center;
        padding: 20px;
      }
      .submission-message {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 80%;
        text-align: center;
        background-color: #f8f9fa;
        margin-top: -3%;
        width: 80%;
        margin-left: 10%;
      }

      .submission-message img {
        position: relative;
        width: 30%;
        height: 50%;
      }

      .submission-message h1 {
        font-size: 2.5rem;
        font-weight: 700;
        color: black;
      }

      .submission-message p {
        font-size: 1.25rem;
        margin: 20px 0;
        color: rgb(87, 87, 87);
      }

      .submission-message .btn-start {
        font-size: 1.25rem;
        padding: 10px 30px;
        margin-bottom: 5%;
      }

      .hero img {
        z-index: 2;
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
        <img
          src="./assets/img/features-light-2.jpg"
          alt="hero"
        />
        <div class="container">
          <div class="row-xl-12">
            <div class="start-screen" id="start-screen">
              <img
                src="https://codescandy.com/geeks-bootstrap-5/assets/images/svg/survey-img.svg"
                alt="Welcome to Quiz"
              />
              <h1>Welcome to Quiz</h1>
              <p>
                Engage live or asynchronously with quiz and poll questions that
                participants complete at their own pace.
              </p>
              <div id="start-container">
                <button id="start-button" class="btn-start btn btn-primary">
                  Start Exam
                </button>
              </div>
            </div>
            <div
              id="exam-screen"
              class="container-fluid exam-mode d-none p-0"
              style="margin-top: -5%"
            >
              <nav
                class="navbar navbar-expand-lg navbar-light m-0 p-4 fixed-top"
                style="background-color: black; color: white"
              >
                <span class="navbar-brand" style="color: white">Test Name</span>
                <div style="margin-left: 64%">
                  <span id="timer" style="margin-right: 30px"
                    >Time: 00:00 / 05:00:00</span
                  >
                  <button id="finish-button" class="btn btn-danger">
                    Finish Test
                  </button>
                </div>
              </nav>
              <div class="row">
                <div
                  class="col-md-9"
                  id="questions-container"
                  style="color: black"
                >
                  <!-- Questions will be inserted here dynamically -->
                </div>
                <div class="col-md-3">
                  <div id="question-navigator" class="sticky-top">
                    <h4 style="color: black">Questions Navigator</h4>
                    <div class="legend">
                      <span class="answered">Answered</span>
                      <span class="unanswered">Unanswered</span>
                    </div>
                    <div id="question-buttons" class="btn-group-vertical">
                      <!-- Navigator buttons will be inserted here dynamically -->
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div id="submission-message" class="submission-message d-none">
              <img
                src="https://www.pngall.com/wp-content/uploads/9/Green-Tick-No-Background.png"
                alt="Success"
              />
              <h1>Success!!!</h1>
              <p>
                Test Submitted Successfully. Click on Continue to check your
                Result.
              </p>
              <button id="btn-continue" class="btn-continue btn btn-primary">
                Continue
              </button>
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
    </footer>
    <!-- /Footer Section -->

    <!-- Scroll to Top -->
    <a
      href="#"
      class="scroll-top d-flex align-items-center justify-content-center"
    >
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
	    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	
  
<!-- Main JS File -->
	<script src="<c:url value='/assets/js/main.js'/>"></script>

    <script>
      $(document).ready(function () {
        const totalQuestions = 20;
        const examDuration = 5 * 60 * 60; // 5 hours in seconds
        let currentTime = 0;
        let timerInterval;

        function startExam() {
          $("#header").addClass("d-none");
          $("#footer").addClass("d-none");
          $("#start-screen").addClass("d-none");
          $("#exam-screen").removeClass("d-none");
          $("body").addClass("exam-mode");
          openFullscreen();
          startTimer();
          renderQuestions();
          renderNavigator();
        }
        function finishExam() {
          if (confirm("Are you sure you want to finish the exam?")) {
            closeFullscreen();
            $("body").removeClass("exam-mode");
            $("#exam-screen").addClass("d-none"); // Hide exam screen
            $("#submission-message").removeClass("d-none").fadeIn(); // Show submission message
          }
        }

        function startTimer() {
          timerInterval = setInterval(function () {
            currentTime++;
            let hours = Math.floor(currentTime / 3600);
            let minutes = Math.floor((currentTime % 3600) / 60);
            let seconds = currentTime % 60;
            $("#timer").text(
              `Time: ${hours.toString().padStart(2, "0")}:${minutes
                .toString()
                .padStart(2, "0")}:${seconds
                .toString()
                .padStart(2, "0")} / 05:00:00`
            );
            if (currentTime >= examDuration) {
              finishExam();
            }
          }, 1000);
        }

        function openFullscreen() {
          if (document.documentElement.requestFullscreen) {
            document.documentElement.requestFullscreen();
          } else if (document.documentElement.mozRequestFullScreen) {
            /* Firefox */
            document.documentElement.mozRequestFullScreen();
          } else if (document.documentElement.webkitRequestFullscreen) {
            /* Chrome, Safari and Opera */
            document.documentElement.webkitRequestFullscreen();
          } else if (document.documentElement.msRequestFullscreen) {
            /* IE/Edge */
            document.documentElement.msRequestFullscreen();
          }
        }

        function closeFullscreen() {
          if (document.exitFullscreen) {
            document.exitFullscreen();
          } else if (document.mozCancelFullScreen) {
            /* Firefox */
            document.mozCancelFullScreen();
          } else if (document.webkitExitFullscreen) {
            /* Chrome, Safari and Opera */
            document.webkitExitFullscreen();
          } else if (document.msExitFullscreen) {
            /* IE/Edge */
            document.msExitFullscreen();
          }
        }

        function renderQuestions() {
          let questionsContainer = $("#questions-container");
          for (let i = 1; i <= totalQuestions; i++) {
            let questionHtml = `
          <div class="question" style="color:black">
              <h5 style="color:black">Question ${i}</h5>
              <p style="color:black">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
              <div class="form-check">
                  <input class="form-check-input" style="background-color: #FFF8DB; border-color: purple;" type="radio" name="question${i}" id="q${i}a" onchange="updateNavigator(${i})">
                  <label class="form-check-label" for="q${i}a">Option A</label>
              </div>
              <div class="form-check">
                  <input class="form-check-input" style="background-color: #FFF8DB; border-color: purple;" type="radio" name="question${i}" id="q${i}b" onchange="updateNavigator(${i})">
                  <label class="form-check-label" for="q${i}b">Option B</label>
              </div>
              <div class="form-check">
                  <input class="form-check-input" style="background-color: #FFF8DB; border-color: purple;" type="radio" name="question${i}" id="q${i}c" onchange="updateNavigator(${i})">
                  <label class="form-check-label" for="q${i}c">Option C</label>
              </div>
              <div class="form-check">
                  <input class="form-check-input" style="background-color: #FFF8DB; border-color: purple;" type="radio" name="question${i}" id="q${i}d" onchange="updateNavigator(${i})">
                  <label class="form-check-label" for="q${i}d">Option D</label>
              </div>
          </div>
      `;
            questionsContainer.append(questionHtml);
          }
        }

        function renderNavigator() {
          let questionButtons = $("#question-buttons");
          for (let i = 1; i <= totalQuestions; i++) {
            let buttonHtml = `<button id="nav-btn-${i}" class="btn btn-secondary unanswered" onclick="scrollToQuestion(${i})">${i}</button>`;
            questionButtons.append(buttonHtml);
          }
        }

        window.scrollToQuestion = function (questionNumber) {
          let questionPosition = $(
            `#questions-container .question:nth-child(${questionNumber})`
          ).offset().top;
          $("html, body").animate({ scrollTop: questionPosition }, 500);
        };

        window.updateNavigator = function (questionNumber) {
          $(`#nav-btn-${questionNumber}`)
            .removeClass("unanswered")
            .addClass("answered");
        };

        $("#start-button").on("click", startExam);
        $("#finish-button").on("click", finishExam);
      });
    </script>
  </body>
</html>
    