package studentzone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import studentzone.model.SubjectInterest;
import studentzone.model.User;
import studentzone.model.UserDetails;
import studentzone.service.SubjectInterestService;
import studentzone.service.UserDetailsService;
import studentzone.service.UserService;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/student")
public class AssessmentController {

	private final UserService userService;
    private final SubjectInterestService subjectInterestService;
    private final UserDetailsService userDetailsService;

    @Autowired
    public AssessmentController(UserService userService, SubjectInterestService subjectInterestService, UserDetailsService userDetailsService) {
        this.userService = userService;
    	this.subjectInterestService = subjectInterestService;
        this.userDetailsService = userDetailsService;
    }
    
    public User isUserLoggedIn(HttpSession session)
    {    	
    	return (User) session.getAttribute("user");
    }
    
    @GetMapping("/assessment")
    public String showAssessmentPage(HttpSession session, Model model) {
        // Check if user is logged in
        User user = isUserLoggedIn(session);
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


        return "student/assessment";
    }

    @GetMapping("/subjectform")
    public String showSubjectForm() {
        return "student/subjectform";
    }

    @PostMapping("/submitSubjectForm")
    public String submitSubjectForm(@RequestParam("subjects") String[] subjects,
                                    HttpSession session) {
        
        User user = isUserLoggedIn(session);
        if (user != null) {
            String userEmail = user.getEmail();
            subjectInterestService.saveSubjectInterests(userEmail, subjects);
        }else
        {
        	return "redirect:/login";
        }
        return "redirect:/student/assessment";
    }
    
    @GetMapping("/profile")
    public String profile(HttpSession session, Model model) {
    	
        User user = isUserLoggedIn(session);
        if (user == null) {
            return "redirect:/login";
        }
        
        UserDetails userDetails = (UserDetails) session.getAttribute("userProfile");
        
        if(userDetails==null)
        {
	        userDetails = userDetailsService.findByEmail(user.getEmail()); 
	        if(userDetails==null)
	        {
	        	System.out.println("user Not found in Profile Page");
	        	userDetailsService.createUserProfile(user.getEmail(),user.getName());
	        	System.out.println("User Profile Created");
	        	userDetails = userDetailsService.findByEmail(user.getEmail());
	        }
        }
       
        model.addAttribute("userDetails", userDetails);
        return "profile";
    }
    
    @PostMapping("/updateProfile")
    public String updateUserProfile(@RequestParam("fullName") String fullName, 
    		@RequestParam("country") String country,
    		@RequestParam("college") String college,
    		@RequestParam("phone") String phone,
    		@RequestParam("about") String about,
    		@RequestParam("github") String gitHubProfile,
    		@RequestParam("instagram") String igProfile,
    		@RequestParam("linkedin") String linkedInProfile,
    		@RequestParam("address") String address,
            HttpSession session)
    {
    	System.out.println("Name: "+fullName+"country: "+country+" college: "+college+" phone: "+phone+" about: "+about+" gitHubProfile: "+gitHubProfile+" linkedin: "+linkedInProfile+" address: "+address+" ig: "+igProfile);
    	User user = isUserLoggedIn(session);
    	if(user==null)
    	{
    		return "redirect:/login";
    	}
    	
    	UserDetails userDeatails = userDetailsService.updateUserProfile(user.getEmail(),fullName, country, college, phone, about, gitHubProfile, igProfile, linkedInProfile, address);
    	
    	session.removeAttribute("userProfile");
    	session.setAttribute("userProfile", userDeatails);
    	return "redirect:/student/profile";
    }
    
    @PostMapping("/changePassword")
    public String changePassword(@RequestParam("password") String currPassword, 
                                 @RequestParam("newpassword") String newPassword, 
                                 @RequestParam("renewpassword") String reNewPassword, 
                                 HttpSession session, Model model) {
        User user = isUserLoggedIn(session);
        if (!userService.validateUserPassword(user.getEmail(), currPassword)) {
            model.addAttribute("errorMessage", "Current password doesn't match!!");
        } else if (!newPassword.equals(reNewPassword)) {
            model.addAttribute("errorMessage", "New password and Re-entered new password don't match!!");
        } else {
            String updateMessage = userService.changeUserPassword(user.getEmail(), newPassword);
            if ("updated".equals(updateMessage)) {
                model.addAttribute("successMessage", "Password Updated");
            } else {
                model.addAttribute("errorMessage", updateMessage);
            }
        }
        System.out.println("Redirecting back to Profile page!");
        UserDetails userDetails = userDetailsService.findByEmail(user.getEmail());        
        session.setAttribute("userProfile", userDetails);
        return "redirect:/student/profile";
    }
    
        
}
