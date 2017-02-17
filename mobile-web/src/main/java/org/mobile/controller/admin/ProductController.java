package org.mobile.controller.admin;

import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;
import org.mobile.converter.CategoryEditor;
import org.mobile.converter.PriceEditor;
import org.mobile.converter.PublisherEditor;
import org.mobile.price.model.Price;
import org.mobile.category.model.Category;
import org.mobile.product.model.Product;
import org.mobile.category.service.CategoryService;
import org.mobile.product.service.ProductService;
import org.mobile.publisher.model.Publisher;
import org.mobile.publisher.service.PublisherService;
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
public class ProductController {

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private PublisherService publisherService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Category.class, new CategoryEditor());
		binder.registerCustomEditor(Publisher.class, new PublisherEditor());
		binder.registerCustomEditor(Price.class, new PriceEditor());
	}

	@RequestMapping(value = "/product", method = RequestMethod.GET)
	String showPage(Model model) {
		model.addAttribute("products", productService.findAll());
		return "product";
	}

	@ModelAttribute("categories")
	public List<Category> populateCategories() {
		ArrayList<Category> categories = new ArrayList<Category>();
		categories.addAll(categoryService.findAll());
		return categories;
	}

	@ModelAttribute("publisherList")
	public List<Publisher> populatePublisherList() {
		ArrayList<Publisher> publisherList = new ArrayList<Publisher>();
		publisherList.addAll(publisherService.findAll());
		return publisherList;
	}

	@RequestMapping(value = "/product/new", method = RequestMethod.GET)
	String newProduct(Model model) {
		Product product = new Product();
		List<Price> prices = new ArrayList<Price>();
		Price price = new Price();
		price.setProduct(product);
		prices.add(price);
		product.setPrices(prices);
		model.addAttribute("product", product);
		return "newproduct";
	}

	@RequestMapping(value = "/product/save", method = RequestMethod.POST)
	String createProduct(RedirectAttributes redirectAttributes, @Valid Product product, BindingResult bindingResult) {
		if (bindingResult.hasErrors())
			return "saveproduct";
		else
			redirectAttributes.addFlashAttribute("message", productService.save(product));
		return "redirect:/product";
	}

	@RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
	String editProduct(Model model, @PathVariable int id) {
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