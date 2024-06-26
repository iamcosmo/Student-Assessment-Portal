package studentzone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import studentzone.service.UserService;

@Controller
public class HomeController {

    @Autowired
    private UserService userService;

    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    @PostMapping("/registerUser")
    public String registerUser(@RequestParam("name") String name, 
                               @RequestParam("email") String email,
                               @RequestParam("dob") String dob, 
                               @RequestParam("password") String password,
                               Model model) {
        try {
            userService.registerUser(name, email, dob, password, 0);
            return "redirect:/registerSuccess";
        } catch (RuntimeException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "register";
        }
    }
    
    @GetMapping("/registerSuccess")
    public String showRegistrationSuccessPage() {
        return "registerSuccess";
    }
}
