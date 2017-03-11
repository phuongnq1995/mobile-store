package org.mobile.controller.home;

import java.util.List;
import org.mobile.product.model.Product;
import org.mobile.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;

@Controller
public class HomeController {
	
	@Autowired
	private ProductService productService;
	
	@ModelAttribute("productList")
	public List<Product> showCarousel() {
		return productService.findAll();
	}
	
	@RequestMapping(value = "/", method=RequestMethod.GET)
    public String getView(Model model) {
		model.addAttribute("searchProducts", productService.findAll());
    	return "welcome";
    }
	
	@RequestMapping(value = "/productbycategory/{id}")
	public String getProductByCategory(@PathVariable("id") int category_id,Model model){
		model.addAttribute("searchProducts", productService.findByCategoryId(category_id));
		return "welcome";
	}
	
	@RequestMapping(value = "/productbypublisher/{id}")
	public String getProductByPublisher(@PathVariable("id") int publisher_id,Model model){
		model.addAttribute("searchProducts", productService.findByPublisherId(publisher_id));
		return "welcome";
	}
}
