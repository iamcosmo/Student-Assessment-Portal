package studentzone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import studentzone.model.User;
import studentzone.model.UserDetails;
import studentzone.model.UserSubjectTag;
import studentzone.service.UserDetailsService;
import studentzone.service.UserService;
import jakarta.servlet.http.HttpSession;
import studentzone.service.QuestionSetService;
import studentzone.service.QuestionService;
import studentzone.service.SubjectTagService;
import studentzone.service.UserSubjectTagService;
import studentzone.service.ExamService;
import studentzone.service.ResponseService;
import studentzone.service.UserResultService;
import studentzone.model.SubjectTag;
import studentzone.model.QuestionSet;
import studentzone.model.Questions;
import studentzone.model.Exam;
import studentzone.model.Response;
import studentzone.model.UserResult;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/student")
public class AssessmentController {
	
	@Autowired
	private QuestionSetService questionSetService;
	private final UserService userService;
	private final UserSubjectTagService userSubjectTagService;
	private final SubjectTagService subjectTagService;
    private final UserDetailsService userDetailsService;
    private final QuestionService questionService;
    private final ExamService examService;
    private final ResponseService responseService;
    private final UserResultService userResultService;

    @Autowired
    public AssessmentController(UserService userService,
    		UserSubjectTagService userSubjectTagService,
    		SubjectTagService subjectTagService,
    		UserDetailsService userDetailsService,
    		QuestionService questionService,
    		ExamService examService, 
    		ResponseService responseService,
    		UserResultService userResultService) {
    	
        this.userService = userService;
        this.userSubjectTagService = userSubjectTagService;
        this.subjectTagService = subjectTagService;    	
        this.userDetailsService = userDetailsService;
        this.questionService = questionService;
        this.examService = examService;
        this.responseService = responseService;
        this.userResultService = userResultService;
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
        
        List<QuestionSet> questionSetListTagFiltered = questionSetService.getFilteredQuestionSetByTagIds(userSubTagList);
        for(QuestionSet set: questionSetListTagFiltered)
        {
        	set.setTags(questionSetService.getTagsForSet(set.getId()));
        }
        model.addAttribute("filteredsetswithtags",questionSetListTagFiltered);
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
    
    @PostMapping("/beginexam")
    public String startAssessment(@RequestParam("setid") int setId,HttpSession session,RedirectAttributes redirectAttributes, Model model)
    {
    	User user = isUserLoggedIn(session);
    	if(user==null)
    	{
    		return "redirect:/login";    		
    	}
    	List<Questions> questionList = questionService.getAllRecordsBySetId(setId);
    	for(Questions qes: questionList)
    	{
    		System.out.println("Question:\n "+qes.getQuestion());
    		System.out.println("Option A:\n "+qes.getA());
    		System.out.println("Option B:\n "+qes.getB());
    		System.out.println("Option C:\n "+qes.getC());
    		System.out.println("Option D:\n"+qes.getD());
    	}
    	model.addAttribute("questionlist",questionList);
    	model.addAttribute("setid",setId);
    	System.out.println("SetId fetched is: "+setId);
    	
    	int eid = examService.getEIDbySetID_Email(user.getEmail(), setId);
    	if(eid!=-1)
    	{
    		System.out.println("USer already attempted this!");
    		redirectAttributes.addFlashAttribute("same_exam_error", "You have already attempted that!!!");
            return "redirect:/student/assessment";
    	}
    	else
    	{
    		System.out.println("EDI: "+eid);
    	}
    	return "student/timer";    	
    }
    
    @GetMapping("/timer")
    public String showTimer(HttpSession session)
    {
    	User user = isUserLoggedIn(session);
    	if(user==null)
    	{
    		return "redirect:/login";
    	}   	
    	
    	return "student/timer";
    }    
    
    
    @PostMapping("/submitExam")
    public String printResponses(@RequestParam("setid") int setid, @RequestParam("qid") int[] qId,@RequestParam Map<String, String> allParams,@RequestParam("start_time") String startTimeStr,
            @RequestParam("finish_time") String finishTimeStr,HttpSession session) {
    	
    	User user = isUserLoggedIn(session);
    	if (user == null) {
            return "redirect:/login";
        }
        LocalDateTime startTime = null;
        LocalDateTime finishTime = null;
        DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE_TIME;
        try {
            startTime = LocalDateTime.parse(startTimeStr, formatter);
            finishTime = LocalDateTime.parse(finishTimeStr, formatter);
        } catch (DateTimeParseException e) {
            System.err.println("Invalid date format: " + e.getMessage());
        }
        
        Exam exam = new Exam();
        exam.setEmail(user.getEmail());
        exam.setQSID(setid);
        exam.setStartTime(startTime);
        exam.setFinishTime(finishTime);
        exam.setScore(0); 
        examService.saveExam(exam);
        
        int examId = examService.getEIDbySetID_Email(user.getEmail(), setid);
        Map<Integer , Character> answersOfSet = questionService.getAnswersBySetId(setid);
        final int[] totalMarks = {0};
        allParams.forEach((key, value) -> {
            if (key.startsWith("q")&& !key.equals("qid")) {
                try {
                	
                    int qid = Integer.parseInt(key.substring(1)); 
                    String userResponse = value;
                    Response response = new Response();
                    response.setEID(examId);
                    response.setQID(qId[qid]);
                    response.setUserResponse(userResponse);
                    int marks=0;
                    
                    if(((answersOfSet.get(qId[qid])).toString()).equals(userResponse))
                    {
                    	response.setMarks(4);
                    	response.setMatch(true); 
                    	marks=4;
                    }
                    if(!((answersOfSet.get(qId[qid])).toString()).equals(userResponse))
                    {
                    	response.setMarks(-1);
                    	response.setMatch(false);
                    	marks=-1;
                    }
                    
                    totalMarks[0] += marks;
                    responseService.saveResponse(response);
                } catch (NumberFormatException e) {
                    System.err.println("Invalid number format for key: " + key);
                }
            }
        });
        
        examService.updateTotalScore(examId, totalMarks[0]);        

        return "redirect:/student/assessment"; 
    }

    @GetMapping("results")
    public String fetchResult(HttpSession session,Model model)
    {
    	User user = isUserLoggedIn(session);
    	if(user==null)
    	{
    		return "redirect:/login";
    	}
    	System.out.println("Here in results");
    	
    	List<Exam> examList =examService.getUsersAllExams(user.getEmail());
    	
    	if(examList.isEmpty())
    	{
    		model.addAttribute("no_result","Sorry You dont have any Results to see. Attempt one exam");
    		return "student/result";
    	}
    	
    	List<UserResult> userResultList = new ArrayList<>();
    	userResultList = userResultService.getAllUserResultsByEmail(user.getEmail());
    	
    	
    	Map<Integer,Integer> eidQsid = userResultService.getEID_QSIDByEmail(user.getEmail());
    	    	
    	    	
    	Map<Integer,List<String>> tagSetMap = new HashMap<>();
    	
    	
    	for(Exam exam: examList)
    	{
    		if(eidQsid.get(exam.getEID())==null)
    		{
	    		UserResult userResult = new UserResult();
	    		QuestionSet questionSet = questionSetService.getSetById(exam.getQSID());
	    		userResult.setEid(exam.getEID());
	    		userResult.setEmail(user.getEmail());
	    		userResult.setQsid(exam.getQSID());
	    		userResult.setSetName(questionSet.getName());
	    		userResult.setTotalScore(questionSet.getQuestionCount()*4);
	    		userResult.setUserScore(exam.getScore());
	    		
	    		userResultService.addUserResult(userResult);
	    		
	    		userResultList.add(userResult);
    		}
    		tagSetMap.put(exam.getQSID(),questionSetService.getTagsForSet(exam.getQSID()));
    	}    	 	
    	
    	model.addAttribute("tagsetmap",tagSetMap);
    	model.addAttribute("resultlist",userResultList);
    	
    	
    	
    	return "student/result";
    }
    
    
        
}
