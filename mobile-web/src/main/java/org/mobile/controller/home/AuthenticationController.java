package org.mobile.controller.home;

import javax.validation.Valid;

import org.mobile.user.model.User;
import org.mobile.user.service.SecurityService;
import org.mobile.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
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
        model.addAttribute("userForm", new User());
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm")@Valid User userForm, BindingResult bindingResult, Model model) {
    	if(!userForm.getPassword().equals(userForm.getPasswordConfirm())){
    		bindingResult.reject("passwordConfirm", "Diff.userForm.passwordConfirm");
    	}
    	if(userService.findUser(userForm.getEmail()) != null){
    		bindingResult.reject("email", "Duplicate.userForm.email");
    	}
        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getEmail(), userForm.getPasswordConfirm());
        model.addAttribute("username", userForm.getEmail());

        return "redirect:/";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your email and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "welcome";
    } 
}
