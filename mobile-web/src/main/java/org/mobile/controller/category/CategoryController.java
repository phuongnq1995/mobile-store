package org.mobile.controller.category;

import javax.validation.Valid;
import org.mobile.category.model.Category;
import org.mobile.category.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@SessionAttributes("category")
@RequestMapping("/admin")
public class CategoryController {

	@Autowired
	CategoryService categoryService;

	@RequestMapping(value = "/categories", method = RequestMethod.GET)
	String showListCategory(Model model) {
		model.addAttribute("categories", categoryService.findAll());
		return "categories";
	}

	@RequestMapping(value = "/category/new", method = RequestMethod.GET)
	String newProduct(Model model) {
		model.addAttribute("category", new Category());
		return "newcategory";
	}

	@RequestMapping(value = "/category/new", method = RequestMethod.POST)
	String createProduct(RedirectAttributes redirectAttributes, @Valid Category category, BindingResult bindingResult)
			throws Exception {
		if(categoryService.findByName(category.getName()) != null)
			bindingResult.rejectValue("name", "Duplicate.name");
		if (bindingResult.hasErrors())
			return "newcategory";
		else 
			redirectAttributes.addFlashAttribute("SUCCESS_MESSAGE", categoryService.save(category));
		return "redirect:/admin/categories";
	}

	@RequestMapping(value = "/category/{id}", method = RequestMethod.GET)
	String editProduct(Model model, @PathVariable int id) {
		model.addAttribute("category", categoryService.findOne(id));
		return "savecategory";
	}
	
	@RequestMapping(value = "/category/save", method = RequestMethod.POST)
	String updateProduct(RedirectAttributes redirectAttributes, @Valid Category category, BindingResult bindingResult)
			throws Exception {
		if (bindingResult.hasErrors())
			return "savecategory";
		else 
			redirectAttributes.addFlashAttribute("SUCCESS_MESSAGE", categoryService.save(category));
		return "redirect:/admin/categories";
	}

	@RequestMapping(value = "/category/delete/{id}", method = RequestMethod.GET)
	String deleteUser(@PathVariable int id, RedirectAttributes redirectAttributes) {
		if (categoryService.findOne(id).getProducts().isEmpty())
			redirectAttributes.addFlashAttribute("SUCCESS_MESSAGE", categoryService.delete(id));
		else
			redirectAttributes.addFlashAttribute("ERROR_MESSAGE", "You need delete all products of this category !");
		return "redirect:/admin/categories";
	}
}
