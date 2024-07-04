package studentzone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import studentzone.model.User;
import studentzone.model.UserDetails;
import studentzone.service.UserDetailsService;
import studentzone.service.UserService;

@Controller
public class HomeController {
	
	private final UserService userService;
	private final UserDetailsService userDetailsService;

    @Autowired
    public HomeController(UserService userService, UserDetailsService userDetailsService) {
        this.userService = userService;
        this.userDetailsService = userDetailsService;
    }

    @RequestMapping("/register")
    public String register() {
        return "register";
    }
    
    @RequestMapping("/")
    public String home()
    {
    	return "home";
    }

    @PostMapping("/registerUser")
    public String registerUser(@RequestParam("name") String name, 
                               @RequestParam("email") String email,
                               @RequestParam("dob") String dob, 
                               @RequestParam("password") String password,
                               Model model) {
        try {
            userService.registerUser(name, email, dob, password, 0);
            return "redirect:/login";
        } catch (RuntimeException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "register";
        }
    }
    
    @GetMapping("/TrialsJSP")
    public String showTrialsJSPPage()
    {
    	return "TrialsJSP";
    }
    
    @GetMapping("/registerSuccess")
    public String showRegistrationSuccessPage() {
        return "registerSuccess";
    }
    
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/loginUser")
    public String loginUser(@RequestParam("email") String email, 
                            @RequestParam("password") String password, 
                            @RequestParam("usertype") int userType,
                            HttpServletRequest request, Model model) {
        User user = userService.validateUser(email, password, userType);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            if (userType == 1) 
            {
                session.setAttribute("adminUsername", user.getEmail());
                return "redirect:/admin/questionSets";
            } else 
            {            	
            	UserDetails userDetails = userDetailsService.findByEmail(user.getEmail());
            	if(userDetails!=null)
            	{
            		session.setAttribute("userProfile", userDetails);
            	}
                return "redirect:/";
            }
        } else {
            model.addAttribute("errorMessage", "Invalid email, password, or user type.");
            return "login";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
    
    @GetMapping("/result")
    public String result() {
        return "result";
    }
    
    @GetMapping("/exam")
    public String exam() {
        return "student/exam";
    }
    
    @GetMapping("/about")
    public String about() {
        return "about";
    }
}
