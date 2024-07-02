package studentzone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import studentzone.model.User;
import studentzone.model.UserDetails;
import studentzone.model.UserSubjectTag;
import studentzone.service.UserDetailsService;
import studentzone.service.UserService;
import jakarta.servlet.http.HttpSession;
import studentzone.service.QuestionSetService;
import studentzone.service.SubjectTagService;
import studentzone.service.UserSubjectTagService;
import studentzone.model.SubjectTag;
import studentzone.model.QuestionSet;
import java.util.List;

@Controller
@RequestMapping("/student")
public class AssessmentController {
	
	@Autowired
	private QuestionSetService questionSetService;
	private final UserService userService;
	private final UserSubjectTagService userSubjectTagService;
	private final SubjectTagService subjectTagService;
    private final UserDetailsService userDetailsService;

    @Autowired
    public AssessmentController(UserService userService,UserSubjectTagService userSubjectTagService,SubjectTagService subjectTagService, UserDetailsService userDetailsService) {
        this.userService = userService;
        this.userSubjectTagService = userSubjectTagService;
        this.subjectTagService = subjectTagService;
    	
        this.userDetailsService = userDetailsService;
    }
    
    public User isUserLoggedIn(HttpSession session)
    {    	
    	return (User) session.getAttribute("user");
    }
    
    @GetMapping("/assessment")
    public String showAssessmentPage(HttpSession session, Model model) {
        
        User user = isUserLoggedIn(session);
        if (user == null) {
            return "redirect:/login";
        }
        String userEmail = user.getEmail();
        
        List<UserSubjectTag> userSubTagList = userSubjectTagService.findUserTags(userEmail);
        if (userSubTagList == null||userSubTagList.size()==0) {
            return "redirect:/student/subjectform";
        }
        
        model.addAttribute("userEmail", userEmail);
        model.addAttribute("subjectInterest", userSubTagList);
        
        List<QuestionSet> questionSetList = questionSetService.getAllSets();
        for (QuestionSet set : questionSetList) {
            set.setTags(questionSetService.getTagsForSet(set.getId()));
        }
        model.addAttribute("setswithtags", questionSetList);
        return "student/assessment";
    }

    @GetMapping("/subjectform")
    public String showSubjectForm(Model model) {
    	List<SubjectTag> allSubjectTags = subjectTagService.getAllSubjectTags();
    	model.addAttribute("subtags",allSubjectTags);
        return "student/subjectform";
    }

    @PostMapping("/submitSubjectForm")
    public String submitSubjectForm(@RequestParam("subjects") int[] subjectIds,
                                    HttpSession session) {
        for(int i=0; i<subjectIds.length; i++)  
        {
        	System.out.println("subject id: "+subjectIds[i]);
        }
        User user = isUserLoggedIn(session);
        if (user != null) {
            String userEmail = user.getEmail();
            userSubjectTagService.saveUserSubjectTags(userEmail, subjectIds);
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
