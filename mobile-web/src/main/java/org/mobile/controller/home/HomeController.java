package org.mobile.controller.home;

import org.mobile.product.model.Product;
import org.mobile.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.ui.Model;

@Controller
public class HomeController {
	
	@Autowired
	private ProductService productService;
	
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
}
