package org.mobile.controller.home;

import javax.validation.Valid;
import org.mobile.user.model.User;
import org.mobile.user.service.SecurityService;
import org.mobile.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AuthenticationController {
	
	@Autowired
	UserService userService;
	
    @Autowired
    private SecurityService securityService;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("user", new User());
        return "registration";
    }

    @Transactional
    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@Valid User user, BindingResult bindingResult, Model model) {
    	if(!user.getPassword().equals(user.getPasswordConfirm())){
    		bindingResult.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
    	}
    	if(userService.findUserPresent(user.getEmail())){
    		bindingResult.rejectValue("email", "Duplicate.email");
    	}
        if (bindingResult.hasErrors()) {
            return "registration";
        }
        userService.save(user);
        securityService.autologin(user.getEmail(), user.getPasswordConfirm());
        return "redirect:/";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("ERROR_MESSAGE", "Your email and password is invalid.");
        if (logout != null)
            model.addAttribute("SUCCESS_MESSAGE", "You have been logged out successfully.");
        return "welcome";
    } 
    
	@RequestMapping(value = "/admin/members", method = RequestMethod.GET)
	public String getMembers(Model model){
		model.addAttribute("members", userService.findAllMembers());
		return "members";
	}
	
	/*@RequestMapping(value = "/admin/members/delete/{email}", method = RequestMethod.GET)
	public String deleteMembers(PathVariable("email") String email, RedirectAttributes redirectAttributes){
		if (userService.deleteByEmail(email) == "Delete success !")
			redirectAttributes.addFlashAttribute("SUCCESS_MESSAGE", productService.delete(id));
		else
			redirectAttributes.addFlashAttribute("ERROR_MESSAGE", "Delete fail !");
		return "redirect:/admin/members";
	}*/ 
	
}
