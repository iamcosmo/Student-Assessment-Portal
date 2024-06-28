package studentzone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import studentzone.model.Questions;
import studentzone.service.QuestionService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private QuestionService questionService;

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login?msg=Logged Out Successfully!";
    }

    private boolean isAdminLoggedIn(HttpSession session) {
        return session.getAttribute("adminUsername") != null;
    }

    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        if (!isAdminLoggedIn(session)) {
            return "redirect:/login";
        }
        return "admin/dashboard";
    }

    @GetMapping("/addQuestion")
    public String showAddQuestionForm(HttpSession session, Model model) {
        if (!isAdminLoggedIn(session)) {
            return "redirect:/login";
        }
        model.addAttribute("question", new Questions());
        return "admin/addQuestion";
    }

    @PostMapping("/addQuestion")
    public String addQuestion(@ModelAttribute Questions question, HttpSession session, RedirectAttributes redirectAttributes) {
        if (!isAdminLoggedIn(session)) {
            return "redirect:/login";
        }
        boolean status = questionService.insertQuestion(question);
        if (status) {
            redirectAttributes.addFlashAttribute("msg", "Question Added Successfully!");
        } else {
            redirectAttributes.addFlashAttribute("msg", "Failed to Add Question!");
        }
        return "redirect:/admin/QuestionList";
    }

    @GetMapping("/QuestionList")
    public String viewAllQuestions(HttpSession session, Model model, @RequestParam(value = "editId", required = false) Integer editId) {
        if (!isAdminLoggedIn(session)) {
            return "redirect:/login";
        }
        List<Questions> questionList = questionService.getAllRecords();
        model.addAttribute("questionList", questionList);
        model.addAttribute("editId", editId); 
        return "admin/QuestionList";
    }

    @PostMapping("/updateQuestion")
    public String updateQuestion(@RequestParam("id") int id, @RequestParam("question") String question, 
                                 @RequestParam("a") String a, @RequestParam("b") String b, 
                                 @RequestParam("c") String c, @RequestParam("d") String d, 
                                 @RequestParam("answer") String answer, HttpSession session, 
                                 RedirectAttributes redirectAttributes) {
        if (!isAdminLoggedIn(session)) {
            return "redirect:/login";
        }
        int status = questionService.updateQuestion(id, question, a, b, c, d, answer);
        if (status == 1) {
            redirectAttributes.addFlashAttribute("msg", "Question Updated Successfully!");
        } else {
            redirectAttributes.addFlashAttribute("msg", "Failed to Update Question!");
        }
        return "redirect:/admin/QuestionList";
    }

    // @GetMapping("/editQuestion/{qid}")
    // public String showEditQuestionForm(@PathVariable("qid") int qid, HttpSession session, Model model) {
    //     if (!isAdminLoggedIn(session)) {
    //         return "redirect:/login";
    //     }
    //     Questions question = questionService.getRecordById(qid);
    //     model.addAttribute("question", question);
    //     return "admin/editQuestion"; 
    // }

    @GetMapping("/deleteQuestion/{qid}")
    public String deleteQuestion(@PathVariable("qid") int qid, HttpSession session, RedirectAttributes redirectAttributes) {
        if (!isAdminLoggedIn(session)) {
            return "redirect:/login";
        }
        int status = questionService.deleteRecord(qid);
        if (status == 1) {
            redirectAttributes.addFlashAttribute("msg", "Question Deleted Successfully!");
        } else {
            redirectAttributes.addFlashAttribute("msg", "Failed to Delete Question!");
        }
        return "redirect:/admin/QuestionList";
    }
}
