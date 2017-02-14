package org.mobile.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.mobile.converter.CategoryEditor;
import org.mobile.product.model.Category;
import org.mobile.product.model.Product;
import org.mobile.product.service.CategoryService;
import org.mobile.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@SessionAttributes("product")
public class ProductController{
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Category.class, new CategoryEditor());
    }
    
	@RequestMapping(value="/product", method=RequestMethod.GET)
	String showPage(Model model){
		model.addAttribute("products", productService.findAll());
		return "product";
	}
	
	@ModelAttribute("categories")
    public List<Category> populateCategories()
    {
        ArrayList<Category> categories = new ArrayList<Category>();
        categories.addAll(categoryService.findAll());
        return categories;
    }
	
	@RequestMapping(value="/product/new", method = RequestMethod.GET)
	String newProduct(Model model){
		model.addAttribute("product", new Product());
		return "saveproduct";
	}
	@RequestMapping(value="/product/save", method = RequestMethod.POST)
	String createProduct(RedirectAttributes redirectAttributes, @Valid Product product, BindingResult bindingResult){
		if(bindingResult.hasErrors())
			return "saveproduct";
		else
			redirectAttributes.addFlashAttribute("message", productService.save(product));
			return "redirect:/product";
	}
	
	@RequestMapping(value="/product/{id}", method = RequestMethod.GET)
	String editProduct(Model model, @PathVariable int id){
		Product product = productService.findOne(id);
		model.addAttribute("product", product);
		return "saveproduct";
	}
	
	@RequestMapping(value = "/product/delete/{id}", method = RequestMethod.GET)
	String deleteUser(@PathVariable int id, RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("message", productService.delete(id));
		return "redirect:/product";
	}
}