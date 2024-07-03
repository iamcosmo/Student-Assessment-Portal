<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Exam Page</title>
    <!-- Include necessary CSS and JS files -->
    <link href="<c:url value='/assets/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" />
    <link href="<c:url value='/assets/css/main.css'/>" rel="stylesheet" />
    <style>
        /* Custom CSS for the exam page */
        .exam-container {
            display: flex;
            justify-content: space-between;
        }
        .question-container {
            width: 70%; /* Adjust as needed */
        }
        .progress-container {
            width: 30%; /* Adjust as needed */
        }
        .progress {
            height: 20px;
        }
        .progress-bar {
            transition: width 0.3s ease-in-out;
        }
        .question {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container exam-container">
        <div class="question-container">
            <h2>Exam Questions</h2>
            <div id="questionProgress">
                <!-- Progress bar will be inserted here dynamically -->
            </div>
            <div id="questionContent">
                <!-- Question content will be loaded dynamically -->
            </div>
        </div>
        <div class="progress-container">
            <h3>Progress</h3>
            <div class="progress">
                <div id="progressBar" class="progress-bar bg-success" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
            </div>
            <h3>Timer</h3>
            <div id="timer"></div>
        </div>
    </div>

    <!-- Include necessary JS files -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="<c:url value='/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
    <script>
        $(document).ready(function () {
            const totalQuestions = ${questions.size()}; // Assuming questions are already loaded in the model
            const examDuration = 5 * 60 * 60; // 5 hours in seconds
            let currentTime = 0;
            let timerInterval;

            function startTimer() {
                timerInterval = setInterval(function () {
                    currentTime++;
                    let hours = Math.floor(currentTime / 3600);
                    let minutes = Math.floor((currentTime % 3600) / 60);
                    let seconds = currentTime % 60;
                    $("#timer").text(
                        `Time: ${hours.toString().padStart(2, "0")}:${minutes.toString().padStart(2, "0")}:${seconds.toString().padStart(2, "0")} / 05:00:00`
                    );
                }, 1000);
            }

            function updateProgressBar() {
                let progress = Math.floor(($(".question.selected").length / totalQuestions) * 100);
                $("#progressBar").css("width", progress + "%").attr("aria-valuenow", progress).text(progress + "%");
            }

            function loadQuestion(index) {
                let question = ${questionList.get(index)}; // Assuming questions are loaded in the model as a List<Question>
                let questionHtml = `
                    <div class="question selected" id="question${index}">
                        <h4>Question ${index + 1}</h4>
                        <p>${question.question}</p>
                        <label class="form-check-label">
                            <input class="form-check-input" type="radio" name="selectedOption_${question.id}" value="a"> ${question.a}
                        </label><br/>
                        <label class="form-check-label">
                            <input class="form-check-input" type="radio" name="selectedOption_${question.id}" value="b"> ${question.b}
                        </label><br/>
                        <label class="form-check-label">
                            <input class="form-check-input" type="radio" name="selectedOption_${question.id}" value="c"> ${question.c}
                        </label><br/>
                        <label class="form-check-label">
                            <input class="form-check-input" type="radio" name="selectedOption_${question.id}" value="d"> ${question.d}
                        </label><br/>
                    </div>
                `;
                $("#questionContent").html(questionHtml);
                updateProgressBar();
            }

            // Start exam on page load
            loadQuestion(0); // Load the first question
            startTimer();

            // Handle radio button change event
            $(document).on("change", "input[type='radio']", function () {
                $(".question").removeClass("selected");
                $(this).closest(".question").addClass("selected");
                updateProgressBar();
            });
        });
    </script>
</body>
</html>
