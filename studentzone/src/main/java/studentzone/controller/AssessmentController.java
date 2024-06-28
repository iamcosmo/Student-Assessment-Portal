package studentzone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import studentzone.model.SubjectInterest;
import studentzone.model.User;
import studentzone.service.SubjectInterestService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/student")
public class AssessmentController {

    private final SubjectInterestService subjectInterestService;

    @Autowired
    public AssessmentController(SubjectInterestService subjectInterestService) {
        this.subjectInterestService = subjectInterestService;
    }

    @GetMapping("/assessment")
    public String showAssessmentPage(HttpSession session, Model model) {
        // Check if user is logged in
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // Redirect to login if not logged in
            return "redirect:/login";
        }

        // Retrieve user email
        String userEmail = user.getEmail();

        // Check if user has filled subject interests
        SubjectInterest subjectInterest = subjectInterestService.findByEmail(userEmail);
        if (subjectInterest == null) {
            // Redirect to subject form if subjects not filled
            return "redirect:/student/subjectform";
        }

        // Populate model attributes for the assessment page
        model.addAttribute("userEmail", userEmail);
        model.addAttribute("subjectInterest", subjectInterest);

        // Return assessment.jsp view
        return "student/assessment";
    }

    @GetMapping("/subjectform")
    public String showSubjectForm() {
        return "student/subjectform";
    }

    @PostMapping("/submitSubjectForm")
    public String submitSubjectForm(@RequestParam("subjects") String[] subjects,
                                    HttpSession session) {
        // Assuming you have a method to save subject interests in SubjectInterestService
        User user = (User) session.getAttribute("user");
        if (user != null) {
            String userEmail = user.getEmail();
            subjectInterestService.saveSubjectInterests(userEmail, subjects);
        }else
        {
        	return "redirect:/login";
        }
        return "redirect:/student/assessment";
    }

    // Additional methods for handling subject form submission and other functionalities can be added here
}
