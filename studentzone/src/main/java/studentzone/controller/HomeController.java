package studentzone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class HomeController {

	@RequestMapping("/register")
    public String register() {
    	System.out.println("Home directory request...");
        return "register";
    }

    
}


