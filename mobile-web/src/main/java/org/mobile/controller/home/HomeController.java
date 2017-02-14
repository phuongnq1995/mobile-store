package org.mobile.controller.home;

import org.mobile.product.model.Product;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.ui.Model;

@Controller
public class HomeController {
/*	
	@Autowired
	ProductService productService;
	*/
	
	@RequestMapping(value = "/", method=RequestMethod.GET)
    public String getView(Model model) {
    	Product pro = new Product();
    	pro.setId(1);
    	pro.setName("Iphone 4");
    	pro.setDescription("professional");
    	model.addAttribute("pro", pro);
    	
    	return "welcome";
    }
}
