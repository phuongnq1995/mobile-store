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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

@Controller
public class HomeController {
	
	@Autowired
	private ProductService productService;
	
	@ModelAttribute("productList")
	public List<Product> showCarousel() {
		return productService.findTop4();
	}
	
	@RequestMapping(value = "/contact")
	public String contact(){
		return "contact";
	}
	
	@RequestMapping(value = "/specialoffer")
	public String specialOffer(Model model){
		model.addAttribute("products", productService.findAll());
		return "specialoffer";
	}
	
	@RequestMapping(value = "/searchProduct", method = RequestMethod.GET)
	public String searchProducts(@RequestParam("key") String key, Model model){
		model.addAttribute("searchProducts", productService.findProductsByKeyWord(key));
		return "welcome";
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
	
	@RequestMapping(value = "/productdetails/{id}")
	public String getProductDetails(@PathVariable("id") long id, Model model){
		model.addAttribute("product", productService.findOne(id));
		return "productdetails";
	}
	
}
