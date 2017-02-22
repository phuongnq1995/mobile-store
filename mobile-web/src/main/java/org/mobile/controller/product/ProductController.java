package org.mobile.controller.product;

import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;
import org.mobile.converter.CategoryEditor;
import org.mobile.converter.PriceEditor;
import org.mobile.converter.PublisherEditor;
import org.mobile.image.model.Image;
import org.mobile.image.service.ImageService;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
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

	@Autowired
	private ImageService imageService;

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

	Product newProduct() {
		Product product = new Product();
		List<Price> prices = new ArrayList<Price>();
		Price price = new Price();
		price.setProduct(product);
		prices.add(price);
		product.setPrices(prices);
		return product;
	}

	@RequestMapping(value = "/product/new", method = RequestMethod.GET)
	String newProduct(Model model) {
		model.addAttribute("product", newProduct());
		return "newproduct";
	}

	@RequestMapping(value = "/product/new", method = RequestMethod.POST)
	String createProduct(RedirectAttributes redirectAttributes, @Valid Product product, BindingResult bindingResult,
			@RequestParam CommonsMultipartFile[] fileUpload) throws Exception {
		List<Image> images = new ArrayList<Image>();
		for (CommonsMultipartFile aFile : fileUpload) {
			if (aFile.getBytes().length > 0) {
				Image image = new Image();
				image.setData(aFile.getBytes());
				image.setProduct(product);
				images.add(image);
			}
		}
		product.setImages(images);
		if (bindingResult.hasErrors())
			return "newproduct";
		else
			redirectAttributes.addFlashAttribute("message", productService.save(product));
		return "redirect:/product";
	}

	@RequestMapping(value = "/product/info/{id}", method = RequestMethod.GET)
	String editProduct(Model model, @PathVariable int id) {
		Product product = productService.findOne(id);
		model.addAttribute("product", product);
		return "editinfoproduct";
	}

	@RequestMapping(value = "/product/info/update", method = RequestMethod.POST)
	String updateProduct(RedirectAttributes redirectAttributes, @ModelAttribute Product product,
			BindingResult bindingResult) {
		if (bindingResult.hasErrors())
			return "editinfoproduct";
		else
			redirectAttributes.addFlashAttribute("message", productService.save(product));
		return "redirect:/product";
	}

	@RequestMapping(value = "/product/price/{id}", method = RequestMethod.GET)
	String editPricesProduct(Model model, @PathVariable int id) {
		Product product = productService.findOne(id);
		Price price = new Price();
		price.setProduct(product);
		product.getPrices().add(price);
		model.addAttribute("product", product);
		return "editpriceproduct";
	}

	@RequestMapping(value = "/product/price/update", method = RequestMethod.POST)
	String updatePricesProduct(RedirectAttributes redirectAttributes, @ModelAttribute Product product,
			BindingResult bindingResult) {
		for (Price price : product.getPrices()) {
			price.setCurrent(false);
		}
		if (bindingResult.hasErrors())
			return "editinfoproduct";
		else
			redirectAttributes.addFlashAttribute("message", productService.save(product));
		return "redirect:/product";
	}

	@RequestMapping(value = "/product/delete/{id}", method = RequestMethod.GET)
	String deleteUser(@PathVariable int id, RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("message", productService.delete(id));
		return "redirect:/product";
	}
	
	@RequestMapping(value = "/imageShow/{id}")
	@ResponseBody
	public byte[] showImage(@PathVariable int id) {
		Image image = imageService.findOne(id);
		if(image != null)
			return image.getData();
		return null;
	}
}