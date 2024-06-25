package studentzone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import studentzone.dao.UserDao;

@Controller
public class HomeController {

    @Autowired
    private UserDao userDao;

    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    @PostMapping("/registerUser")
    public String registerUser(@RequestParam("name") String name, 
                               @RequestParam("email") String email,
                               @RequestParam("dob") String dob, 
                               @RequestParam("password") String password) {
        userDao.registerUser(name, email, dob, password);
        return "redirect:/registerSuccess";
    }
    
    @GetMapping("/registerSuccess")
    public String showRegistrationSuccessPage() {
        return "registerSuccess"; // This should match the name of your JSP file
    }
}
