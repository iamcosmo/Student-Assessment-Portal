let questions = []; // Array to store questions and options (can be loaded dynamically)

let currentQuestionIndex = 0;
let responses = [];

function startExam() {
    // Load questions dynamically (you can implement this based on your backend logic)
    // Example:
    questions = [
        { question: "Question 1?", options: ["Option A", "Option B", "Option C", "Option D"] },
        { question: "Question 2?", options: ["Option A", "Option B", "Option C", "Option D"] },
        // Add more questions as needed
    ];

    showQuestion();
    startTimer();
    updateProgress();
}

function showQuestion() {
    let currentQuestion = questions[currentQuestionIndex];
    document.getElementById("question").innerText = currentQuestion.question;

    let optionsHtml = "";
    for (let i = 0; i < currentQuestion.options.length; i++) {
        optionsHtml += `<input type="radio" name="option" value="${i}" id="option${i}">
                        <label for="option${i}">${currentQuestion.options[i]}</label><br>`;
    }
    document.getElementById("options").innerHTML = optionsHtml;
}

function nextQuestion() {
    saveResponse();
    currentQuestionIndex++;
    if (currentQuestionIndex >= questions.length) {
        currentQuestionIndex = questions.length - 1;
    }
    showQuestion();
    updateProgress();
}

function prevQuestion() {
    saveResponse();
    currentQuestionIndex--;
    if (currentQuestionIndex < 0) {
        currentQuestionIndex = 0;
    }
    showQuestion();
    updateProgress();
}

function saveResponse() {
    let selectedOption = document.querySelector('input[name="option"]:checked');
    if (selectedOption) {
        responses[currentQuestionIndex] = selectedOption.value;
    } else {
        responses[currentQuestionIndex] = 'x'; // Default response 'x' if no option selected
    }
}

function updateProgress() {
    let progressHtml = "";
    for (let i = 0; i < questions.length; i++) {
        let colorClass = responses[i] ? "answered" : "not-answered";
        progressHtml += `<div class="progress-item ${colorClass}"></div>`;
    }
    document.getElementById("progress").innerHTML = progressHtml;
}

function startTimer() {
    let totalTime = questions.length * 1.5 * 60; // Total time in seconds
    let timerElement = document.getElementById("timer");

    let timer = setInterval(function() {
        if (totalTime <= 0) {
            clearInterval(timer);
            finishExam();
        } else {
            let minutes = Math.floor(totalTime / 60);
            let seconds = totalTime % 60;
            timerElement.innerText = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
            totalTime--;
        }
    }, 1000);
}

function finishExam() {
    // Handle finishing exam logic, send responses, etc.
    // Example: submit responses to backend via AJAX
    console.log("Exam finished!");
    // Redirect or show results page after finishing
}
