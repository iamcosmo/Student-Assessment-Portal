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
import studentzone.model.QuestionSet;
import studentzone.model.Questions;
import studentzone.service.QuestionService;
import studentzone.service.QuestionSetService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private QuestionService questionService;

    @Autowired
    private QuestionSetService questionSetService;

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
    public String showAddQuestionForm(HttpSession session, Model model, @RequestParam("setId") int setId) {
        if (!isAdminLoggedIn(session)) {
            return "redirect:/login";
        }
        Questions question = new Questions();
        question.setSetId(setId);
        model.addAttribute("question", question);
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
        return "redirect:/admin/QuestionList?setId=" + question.getSetId();
    }

    @GetMapping("/QuestionList")
    public String viewAllQuestions(HttpSession session, Model model, @RequestParam(value = "setId", required = false) Integer setId) {
        if (!isAdminLoggedIn(session)) {
            return "redirect:/login";
        }
        List<Questions> questionList;
        if (setId != null) {
            questionList = questionService.getAllRecordsBySetId(setId);
        } else {
            questionList = questionService.getAllRecords();
        }
        model.addAttribute("questionList", questionList);
        return "admin/QuestionList";
    }
    @PostMapping("/updateQuestion")
    public String updateQuestion(@RequestParam("id") int id,
                                 @RequestParam("question") String question,
                                 @RequestParam("a") String a,
                                 @RequestParam("b") String b,
                                 @RequestParam("c") String c,
                                 @RequestParam("d") String d,
                                 @RequestParam("answer") String answer,
                                 @RequestParam("setId") int setId,
                                 HttpSession session,
                                 RedirectAttributes redirectAttributes) {
        if (!isAdminLoggedIn(session)) {
            return "redirect:/login";
        }
        int status = questionService.updateQuestion(id, question, a, b, c, d, answer, setId);
        if (status == 1) {
            redirectAttributes.addFlashAttribute("msg", "Question Updated Successfully!");
        } else {
            redirectAttributes.addFlashAttribute("msg", "Failed to Update Question!");
        }
        return "redirect:/admin/QuestionList?setId=" + setId;
    }
    


    @GetMapping("/deleteQuestion/{qid}")
    public String deleteQuestion(@PathVariable("qid") int qid, @RequestParam(value = "setId", required = false) Integer setId, HttpSession session, RedirectAttributes redirectAttributes) {
        if (!isAdminLoggedIn(session)) {
            return "redirect:/login";
        }
        int status = questionService.deleteRecord(qid);
        if (status == 1) {
            redirectAttributes.addFlashAttribute("msg", "Question Deleted Successfully!");
        } else {
            redirectAttributes.addFlashAttribute("msg", "Failed to Delete Question!");
        }
            return "redirect:/admin/QuestionList?setId=" + setId;
        
    
    }
    @GetMapping("/questionSets")
    public String showQuestionSets(Model model) {
        List<QuestionSet> sets = questionSetService.getAllSets();
        model.addAttribute("sets", sets);
        return "admin/questionSets";
    }

  
    @GetMapping("/deleteQuestionSet")
    public String deleteQuestionSet(@RequestParam("id") int id, RedirectAttributes redirectAttributes) {
        boolean status = questionSetService.deleteSet(id);
        if (status) {
            redirectAttributes.addFlashAttribute("msg", "Set Deleted Successfully!");
        } else {
            redirectAttributes.addFlashAttribute("msg", "Failed to Delete Set!");
        }
        return "redirect:/admin/questionSets";
    }

    @GetMapping("/editQuestionSet")
    public String editQuestionSet(@RequestParam("setId") int setId, Model model, HttpSession session) {
        if (!isAdminLoggedIn(session)) {
            return "redirect:/admin/login";
        }
        QuestionSet set = questionSetService.getSetById(setId);
        model.addAttribute("set", set);
        return "admin/editQuestionSet";
    }
    

    @PostMapping("/updateSet")
    public String updateQuestionSet(@RequestParam("id") int id, @RequestParam("name") String name, RedirectAttributes redirectAttributes) {
        QuestionSet set = new QuestionSet();
        set.setId(id);
        set.setName(name);
        boolean status = questionSetService.updateSet(set);
        if (status) {
            redirectAttributes.addFlashAttribute("msg", "Set Updated Successfully!");
        } else {
            redirectAttributes.addFlashAttribute("msg", "Failed to Update Set!");
        }
        return "redirect:/admin/questionSets";
    }
    @GetMapping("/addQuestionSet")
    public String showAddQuestionSetFormPage(Model model) {
        model.addAttribute("questionSet", new QuestionSet());
        return "admin/addQuestionSet";
    }

    @PostMapping("/addQuestionSet")
    public String addQuestionSet(@RequestParam("name") String name, RedirectAttributes redirectAttributes) {
        QuestionSet set = new QuestionSet();
        set.setName(name);
        boolean status = questionSetService.addSet(set);
        if (status) {
            redirectAttributes.addFlashAttribute("msg", "Set Added Successfully!");
        } else {
            redirectAttributes.addFlashAttribute("msg", "Failed to Add Set!");
        }
        return "redirect:/admin/questionSets";
    }

}
