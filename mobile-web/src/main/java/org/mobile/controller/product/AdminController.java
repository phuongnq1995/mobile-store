package org.mobile.controller.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;
import org.mobile.converter.CategoryEditor;
import org.mobile.converter.PublisherEditor;
import org.mobile.image.model.Image;
import org.mobile.price.model.Price;
import org.mobile.price.service.PriceService;
import org.mobile.category.model.Category;
import org.mobile.product.model.Product;
import org.mobile.product.service.ProductService;
import org.mobile.publisher.model.Publisher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@SessionAttributes("product")
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private ProductService productService;

	@Autowired
	private PriceService priceService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Category.class, new CategoryEditor());
		binder.registerCustomEditor(Publisher.class, new PublisherEditor());
	}

	public Product newProduct() {
		Product product = new Product();
		List<Price> prices = new ArrayList<Price>();
		Price price = new Price();
		prices.add(price);
		product.setPrices(prices);
		System.out.println(product.getId());
		return product;
	}

	@RequestMapping(value = "/product", method = RequestMethod.GET)
	String showPage(Model model) {
		List<Product> products = productService.findAll();
		model.addAttribute("products", products);
		return "product";
	}

	@RequestMapping(value = "/product/new", method = RequestMethod.GET)
	String newProduct(Model model) {
		model.addAttribute("product", newProduct());
		return "newproduct";
	}

	@RequestMapping(value = "/product/new", method = RequestMethod.POST)
	String createProduct(RedirectAttributes redirectAttributes, @Valid Product product, BindingResult bindingResult,
			@RequestParam("fileUpload") MultipartFile[] fileUpload) throws IOException{
		List<Image> images = new ArrayList<Image>();
		for (MultipartFile aFile : fileUpload) {
			if (!aFile.isEmpty()) {
				Image image = new Image();
				image.setData(aFile.getBytes());
				image.setProduct(product);
				images.add(image);
			}
		}
		product.setImages(images);
		if (bindingResult.hasErrors()) 
			return "newproduct";
		else {
			redirectAttributes.addFlashAttribute("SUCCESS_MESSAGE", productService.save(product));
		}
		return "redirect:/admin/product";
	}

	@RequestMapping(value = "/product/info/{id}", method = RequestMethod.GET)
	String editProduct(Model model, @PathVariable Long id) {
		model.addAttribute("product", productService.findOne(id));
		return "editinfoproduct";
	}

	@RequestMapping(value = "product/info/update", method = RequestMethod.POST)
	String updateProduct(RedirectAttributes redirectAttributes, @Valid Product product, BindingResult bindingResult) {
		if (bindingResult.hasErrors())
			return "editinfoproduct";
		else
			redirectAttributes.addFlashAttribute("SUCCESS_MESSAGE", productService.save(product));
		return "redirect:/admin/product";
	}

	@RequestMapping(value = "/product/delete/{id}", method = RequestMethod.GET)
	String deleteUser(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		if (priceService.deleteByProductId(id) == "Delete success !")
			redirectAttributes.addFlashAttribute("SUCCESS_MESSAGE", productService.delete(id));
		else
			redirectAttributes.addFlashAttribute("ERROR_MESSAGE", "Delete fail !");
		return "redirect:/admin/product";
	}

}