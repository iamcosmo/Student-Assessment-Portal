package studentzone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.google.protobuf.Timestamp;

import studentzone.model.User;
import studentzone.model.UserDetails;
import studentzone.model.UserSubjectTag;
import studentzone.service.UserDetailsService;
import studentzone.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import studentzone.service.QuestionSetService;
import studentzone.service.QuestionService;
import studentzone.service.SubjectTagService;
import studentzone.service.UserSubjectTagService;
import studentzone.service.ExamService;
import studentzone.service.ResponseService;
import studentzone.model.SubjectTag;
import studentzone.model.QuestionSet;
import studentzone.model.Questions;
import studentzone.model.Exam;
import studentzone.model.Response;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
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

    @Autowired
    public AssessmentController(UserService userService,UserSubjectTagService userSubjectTagService,SubjectTagService subjectTagService, UserDetailsService userDetailsService,QuestionService questionService,ExamService examService, ResponseService responseService) {
        this.userService = userService;
        this.userSubjectTagService = userSubjectTagService;
        this.subjectTagService = subjectTagService;    	
        this.userDetailsService = userDetailsService;
        this.questionService = questionService;
        this.examService = examService;
        this.responseService = responseService;
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
    public String startAssessment(@RequestParam("setid") int setId,HttpSession session, Model model)
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
    
    @PostMapping("/submitExam1")
    public String submitUserExam(HttpSession session,
                                 @RequestParam("setid") int setid,
                                 @RequestParam("qid") int[] qids,
                                 @RequestParam("start_time") String startTimeStr,
                                 @RequestParam("finish_time") String finishTimeStr,
                                 HttpServletRequest request) {
        User user = isUserLoggedIn(session);
        if (user == null) {
            return "redirect:/login";
        }

        String email = user.getEmail();

        // Convert the timestamp strings to LocalDateTime objects
        DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE_TIME;
        LocalDateTime startTime = LocalDateTime.parse(startTimeStr, formatter);
        LocalDateTime finishTime = LocalDateTime.parse(finishTimeStr, formatter);

        // Extract the responses for each question
        Map<Integer, Character> responses = new HashMap<>();
        for (int i = 0; i < qids.length; i++) {
            String responseParam = "response" + i;
            String response = request.getParameter(responseParam);
            if (response != null && response.length() == 1) {
                responses.put(qids[i], response.charAt(0));
                
            } else {
                responses.put(qids[i], 'x'); // default value if no response
            }
            System.out.println("qid: "+qids[i]+"response: "+response.charAt(0));
        }

        // Insert the exam and responses into the database
        Exam exam = new Exam();
        exam.setEmail(email);
        exam.setQSID(setid);
        exam.setStartTime(startTime);
        exam.setFinishTime(finishTime);
        exam.setScore(0); // Initial score
        // Insert exam record and get the generated EID
        examService.saveExam(exam);
        
        int examId = examService.getEIDbySetID_Email(email, setid);
        // Insert responses
        Map<Integer , Character> answersOfSet = questionService.getAnswersBySetId(setid);
        int userScore = 0,score=0;
        for (Map.Entry<Integer, Character> entry : responses.entrySet()) {
        	score=0;
            Response response = new Response();
            response.setEID(examId);
            response.setQID(entry.getKey());
            char userResponseChar = entry.getValue();
            response.setUserResponse(String.valueOf(userResponseChar));
            if(String.valueOf(entry.getValue()).equals("x"))
            {
            	response.setMatch(false); 
                response.setMarks(0);
            }
            else if(entry.getValue().equals(answersOfSet.get(examId)))
            {
            	response.setMatch(entry.getValue().equals(answersOfSet.get(examId))); 
            	response.setMarks(4);
            }
            else
            {
            	response.setMatch(entry.getValue().equals(answersOfSet.get(examId)));
            	response.setMarks(-1);            	
            }
            userScore+=score;             
            responseService.saveResponse(response);
        }
        examService.updateTotalScore(examId, userScore);
        

        return "redirect:/student/assessment";
    }
    
    
    @PostMapping("/submitExam")
    public String printResponses(@RequestParam("setid") int setid, @RequestParam("qid") int[] qId,@RequestParam Map<String, String> allParams,@RequestParam("start_time") String startTimeStr,
            @RequestParam("finish_time") String finishTimeStr,HttpSession session) {
    	
    	User user = isUserLoggedIn(session);
    	if (user == null) {
            return "redirect:/login";
        }
    	
    	//System.out.println("Set ID: " + setid);
    	
    	// Parse start and finish times
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
                	
                    int qid = Integer.parseInt(key.substring(1)); // Extract qid from key
                    String userResponse = value;
                    //System.out.println("qid: " + qid + " response: " + userResponse);
                    
                    
//                    
                    Response response = new Response();
                    response.setEID(examId);
                    response.setQID(qId[qid]);
                    response.setUserResponse(userResponse);
                    int marks=0;
                    if(((answersOfSet.get(qId[qid])).toString()).equals("x"))
                    {
                    	response.setMarks(0);
                    	response.setMatch(false);
                    	marks=0;
                    	
                    }
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
        //System.out.println("Total score = "+totalMarks[0]);
        examService.updateTotalScore(examId, totalMarks[0]);
//        for(int i=0; i<qId.length; i++)
//        {
//        	System.out.println("qid : "+qId[i]);
//        }
        
//        System.out.println("start time: "+startTime);
//        System.out.println("Finish Time: "+finishTime);
        

        return "redirect:/student/assessment"; // You can redirect to a success page or return a response
    }

    
    
        
}
