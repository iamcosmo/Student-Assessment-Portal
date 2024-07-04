<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
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
        body {
        font-family: Arial, sans-serif;
        display: flex;
        flex-direction: column;
        height: 100vh;
        margin: 0;
        background-color: #f8f9fa;
	      }
	      .start-screen {
	        width: 100%;
	        max-width: 900px;
	        margin-left:20%;
	        margin-top:1.5%;
	      }
	
	      .card {
	        border: none;
	        box-shadow: -5px 5px 10px black;
	      }
	
	      .card-title {
	        font-weight: bold;
	        margin-bottom: 1.5rem;
	      }
	
	      .list-group-item {
	        border: none;
	        padding: 0.75rem 1.25rem;
	      }
	
	      .lead {
	        font-weight: bold;
	        margin-left: 2%;
	      }
        .timer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 2px solid #ccc;
        }
        .container {
            display: flex;
            flex: 1;
        }
        .left-section {
            flex: 2;
            padding: 20px;
            background-color: #ffffff;
        }
        .right-section {
            flex: 1;
            padding: 20px;
            background-color: #e9e9e9;
            display: flex;
            flex-direction: column;
        }
        .question {
            margin-bottom: 20px;
        }
        .options {
            margin-bottom: 15px;
        }
        .buttons {
            text-align: center;
            margin-top:2%
        }
        .buttons button {
            padding: 10px 20px;
            margin: 5px;
            border-radius: 20px;
        }
        .progress-box {
            flex: 1;
            overflow-y: auto;
        }
        .progress-bar {
            height: 30px;
            margin: 5px 0;
            background-color: #ccc;
            cursor: pointer;
            text-align: center;
            line-height: 30px;
        }
        .progress-bar.marked {
            background-color: #4caf50;
        }
        

      .custom-btn:hover {
        background-color: #0056b3;
        border-color: #004085;
        color: #e2e6ea;
      }

      .custom-btn:focus,
      .custom-btn:active {
        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5);
      }
    </style>
</head>
<body>
<div class="index-page">

	<div class="start-screen" id="start-screen">
          <div class="card">
            <div class="card-body">
              <h5
                class="card-title text-center"
                style="margin-left: 2%; font-weight: 800; font-size: larger"
              >
                INSTRUCTION FOR THE TEST
              </h5>
              <ol class="list-group list-group-flush">
                <li class="list-group-item">
                  1. Read the instructions carefully before starting the test.
                </li>
                <li class="list-group-item">
                  2. The test contains a total of 20 questions.
                </li>
                <li class="list-group-item">
                  3. Do not use Dictionaries, Calculators: No calculator (separate
                  or with watch), Log tables or any other printed/online
                  reference material during the test.
                </li>
                <li class="list-group-item">
                  4. Do not Close/ Refresh/ LogOut the browser window once you have
                  started the test.
                </li>
                <li class="list-group-item">
                  5. There will be negative marking in this examination.
                </li>
                <li class="list-group-item">
                  6. Marking Scheme:
                  <ul>
                    <li>+4 each correct answer.</li>
                    <li>-1 for each negative answer.</li>
                    <li>0 for skip.</li>
                  </ul>
                </li>
                <li class="list-group-item">7. Select only one answer.</li>
              </ol>
              <div class="text-center ">
                <p class="lead">Best of Luck for your Exam</p>
                <div id="start-container ">
                  <a
                    class="btn btn-primary custom-btn"
                    href="<c:url value='/student/assessment'/>"
                    style="width: 100px"
                  >
                    Back
                  </a>
                  <button
                    id="start-button"
                    class="btn-start btn btn-primary custom-btn"
                  >
                    Start Exam
                  </button>
                </div>
              </div>
            </div>
          </div>
      </div>
	<div id="exam-screen"
              class="container-fluid exam-mode d-none p-0">
	    <div class="timer" style="background-color: black; color: white">
	        <h1 style="margin-left: 20px; color: white">Exam</h1>
	        <span style="margin-left: 76%; font-weight: 600">Time:</span>
	        <div id="countdown">Loading...</div>
	        <button id="finish-button" class="btn btn-danger" type="button" onclick="finishExam()">Finish</button>
	    </div>
	    <div class="container" >
	        <div class="left-section">
	            <form id="questionForm" action="<c:url value='/student/submitExam'/>" method="post" class="p-4" style="border: 3px solid black; border-radius: 10px; box-shadow: -5px 5px 10px black">
	            	<input type="hidden" name="start_time" id="start_time" />
    				<input type="hidden" name="finish_time" id="finish_time" />
	            	<input type="hidden" name="setid" value="${setid}" />
	                <c:forEach var="question" items="${questionlist}" varStatus="status">
	                    <div class="question" id="question-${status.index}" style="display: none;">
	                    	<input type="hidden" name="qid" value="${question.id}" />
	                        <h2>Question ${status.index + 1}:</h2>
	                        <p>${question.question}</p>
	                        <div class="options" >
	                        	
	                            <label><input type="radio" name="q${status.index}" value="a" onclick="markQuestion(${status.index})"> ${question.a}</label><br>
	                            <label><input type="radio" name="q${status.index}" value="b" onclick="markQuestion(${status.index})"> ${question.b}</label><br>
	                            <label><input type="radio" name="q${status.index}" value="c" onclick="markQuestion(${status.index})"> ${question.c}</label><br>
	                            <label><input type="radio" name="q${status.index}" value="d" onclick="markQuestion(${status.index})"> ${question.d}</label>
	                        </div>
	                        <button class="btn  btn-secondary" style="border-radius: 20px; margin-bottom: -2%" type="button" onclick="unselectOption(${status.index})">Unselect Option</button>
	                    </div>
	                </c:forEach>
	            </form>
	            <div class="buttons">
	                <button class="btn  btn-outline-dark" type="button" id="prevBtn" onclick="showPreviousQuestion()" style="border: 3px solid black; font-weight:600; float: left; box-shadow: -5px 5px 10px black">Previous</button>
	                <button class="btn  btn-outline-dark" type="button" id="nextBtn" onclick="showNextQuestion()" style="border: 3px solid black; font-weight:600; float: right; box-shadow: -5px 5px 10px black">Next</button>
	            </div>
	        </div>
	        <div class="right-section" style="background-color: #373A40">
	            <div class="progress-box">
	                <c:forEach var="question" items="${questionlist}" varStatus="status">
	                    <div class="progress-bar m-3" id="progress-${status.index}" onclick="jumpToQuestion(${status.index})" style="box-shadow: -5px 5px 10px black">
	                        Question ${status.index + 1}
	                    </div>
	                </c:forEach>
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
              <button id="btn-continue" class="btn-continue btn btn-primary" href="<c:url value='/student/assessment'/>">
                Continue
              </button>
    </div>
</div>

<!-- Vendor JS Files -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="<c:url value='/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/assets/vendor/aos/aos.js'/>"></script>
	<script src="<c:url value='/assets/vendor/glightbox/js/glightbox.min.js'/>"></script>
	<script src="<c:url value='/assets/vendor/purecounter/purecounter_vanilla.js'/>"></script>
	<script src="<c:url value='/assets/vendor/swiper/swiper-bundle.min.js'/>"></script>
	<script src="<c:url value='/assets/vendor/isotope-layout/isotope.pkgd.min.js'/>"></script>
	<script src="<c:url value='/assets/vendor/php-email-form/validate.js'/>"></script>
	
	
	
    <script>
         // 5 minutes in seconds
        let currentQuestionIndex = 0;
        const totalQuestions = ${questionlist.size()};
        let timerDuration = 60 * 1.5*totalQuestions;
        let startTime;
        
        $(document).ready(function () {
            // Function to start the exam
            function startExam() {
            	
            	// Set the start time
                startTime = new Date().toISOString();
                document.getElementById('start_time').value = startTime;

                
                // Enter full-screen mode
                if (document.documentElement.requestFullscreen) {
                    document.documentElement.requestFullscreen();
                } else if (document.documentElement.mozRequestFullScreen) { /* Firefox */
                    document.documentElement.mozRequestFullScreen();
                } else if (document.documentElement.webkitRequestFullscreen) { /* Chrome, Safari and Opera */
                    document.documentElement.webkitRequestFullscreen();
                } else if (document.documentElement.msRequestFullscreen) { /* IE/Edge */
                    document.documentElement.msRequestFullscreen();
                }

                // Start the countdown timer
                const display = document.querySelector('#countdown');
                startTimer(timerDuration, display);
                showQuestion(currentQuestionIndex);

                // Disable key strokes during exam
                window.addEventListener('keydown', preventKeyStrokes);
            }

            // Event listener for start exam button click
            $("#start-button").on("click", function() {
                startExam();
                $("#start-screen").addClass("d-none"); // Hide start screen
                $("#exam-screen").removeClass("d-none"); // Show exam screen
                $("body").addClass("exam-mode");
            });

            // Function to finish the exam
            function finishExam() {
            	
            	
                if (confirm("Are you sure you want to finish the exam?")) {
                	
                	// Set the finish time
                    let finishTime = new Date().toISOString();
                    document.getElementById('finish_time').value = finishTime;
                    // Exit full-screen mode
                    if (document.exitFullscreen) {
                        document.exitFullscreen();
                    } else if (document.mozCancelFullScreen) { 
                        document.mozCancelFullScreen();
                    } else if (document.webkitExitFullscreen) { 
                        document.webkitExitFullscreen();
                    } else if (document.msExitFullscreen) { 
                        document.msExitFullscreen();
                    }

                    // Redirect to assessment page
                    document.getElementById('questionForm').submit();
                }
            }

            // Event listener for finish exam button click
            $("#finish-button").on("click", finishExam);
            
            // Function to prevent key strokes during exam
            function preventKeyStrokes(event) {
            	
                    event.preventDefault();
           
            }
        });
		
        $(document).on('keydown',function(e){
        	  e.preventDefault();
        	});

        function startTimer(duration, display) {
            let timer = duration, minutes, seconds;
            setInterval(function () {
                minutes = parseInt(timer / 60, 10);
                seconds = parseInt(timer % 60, 10);

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                display.textContent = minutes + ":" + seconds;

                if (--timer < 0) {
                    timer = 0;
                    alert("Time's up!");
                    // You can add form submission here if needed
                    finishExam();
                }
            }, 1000);
        }

        function showQuestion(index) {
            const questions = document.querySelectorAll('.question');
            questions.forEach((question, idx) => {
                question.style.display = idx === index ? 'block' : 'none';
            });
        }

        function showNextQuestion() {
            if (currentQuestionIndex < totalQuestions - 1) {
                currentQuestionIndex++;
                showQuestion(currentQuestionIndex);
            }
        }

        function showPreviousQuestion() {
            if (currentQuestionIndex > 0) {
                currentQuestionIndex--;
                showQuestion(currentQuestionIndex);
            }
        }

        function jumpToQuestion(index) {
            currentQuestionIndex = index;
            showQuestion(currentQuestionIndex);
        }

        function markQuestion(index) {      	
        	
        	
        	let str = "progress-"+index;
        	       	
            const progressBar = document.getElementById(str);
            if (progressBar) {
                progressBar.classList.add('marked');
            } else {
                console.log(`progress bar not fetched for index ${index}!!`);
            }
            
        }

        function unselectOption(index) {
        	let opt = "q"+index;
        	let str = "progress-"+index;
            const options = document.getElementsByName(opt);
            options.forEach(option => {
                option.checked = false;
            });
            const progressBar = document.getElementById(str);
            if (progressBar) {
                progressBar.classList.remove('marked');
            } else {
                console.log(`progress bar not fetched for index ${index}!!`);
            }
        }

        /**function finishExam() {
            if (document.exitFullscreen) {
                document.exitFullscreen();
            } else if (document.mozCancelFullScreen) { 
                document.mozCancelFullScreen();
            } else if (document.webkitExitFullscreen) { 
                document.webkitExitFullscreen();
            } else if (document.msExitFullscreen) { 
                document.msExitFullscreen();
            }
            //Redirect to assessment page
            window.location.href = 'student/assessment.jsp';
        }**/

        

        //window.onload = 
        /**function startExam() {
            

        	// Enter full-screen mode
            if (document.documentElement.requestFullscreen) {
                document.documentElement.requestFullscreen();
            } else if (document.documentElement.mozRequestFullScreen) { 
                document.documentElement.mozRequestFullScreen();
            } else if (document.documentElement.webkitRequestFullscreen) { 
                document.documentElement.webkitRequestFullscreen();
            } else if (document.documentElement.msRequestFullscreen) { /
                document.documentElement.msRequestFullscreen();
            }
                // Start the countdown timer
                const display = document.querySelector('#countdown');
                startTimer(timerDuration, display);
                showQuestion(currentQuestionIndex);

                // Disable key strokes
                window.addEventListener('keydown', preventKeyStrokes);                
            });

           
        };**/
    </script>
</body>
</html>
