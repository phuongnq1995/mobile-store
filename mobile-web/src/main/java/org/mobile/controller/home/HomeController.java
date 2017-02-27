package org.mobile.controller.home;

import org.mobile.product.model.Product;
import org.mobile.product.service.ProductService;
import org.mobile.user.model.User;
import org.mobile.user.service.SecurityService;
import org.mobile.user.service.UserService;
import org.mobile.user.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

@Controller
public class HomeController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;
    
	@Autowired
	private ProductService productService;
	
    @Autowired
    private UserValidator userValidator;
	
	@RequestMapping(value = "/", method=RequestMethod.GET)
    public String getView(Model model) {
  
    	return "welcome";
    }
	
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	String showPage(Model model) {
		
		for(Product product: productService.findAll()){
			System.out.println("image : "+product.getImages().get(0).toString());
		}
		model.addAttribute("products", productService.findAll());
		
		return "product";
	}
	@RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }
}
