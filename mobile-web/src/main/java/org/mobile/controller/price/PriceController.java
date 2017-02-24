/*package org.mobile.controller.price;

import javax.transaction.Transactional;

import org.mobile.price.model.Price;
import org.mobile.price.service.PriceService;
import org.mobile.product.model.Product;
import org.mobile.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@SessionAttributes("price")
public class PriceController {
	
	@Autowired
	private PriceService priceService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/product/price/{product_id}", method = RequestMethod.GET)
	String editPricesProduct(Model model, @PathVariable int product_id) {
		Product product = productService.findOne(product_id);
		model.addAttribute("listPrices", priceService.findByProduct(product));
		Price price = new Price();
		price.setProduct(product);
		model.addAttribute("price", price);
		return "editpriceproduct";
	}

	@Transactional
	@RequestMapping(value = "/product/price/update", method = RequestMethod.POST)
	String updatePricesProduct(RedirectAttributes redirectAttributes, @ModelAttribute Price price,
			BindingResult bindingResult) {
		for(Price pr: price.getProduct().getPrices()){
			pr.setCurrent(false);
		}
		price.getProduct().getPrices().add(price);
		if (bindingResult.hasErrors())
			return "editinfoproduct";
		else
			redirectAttributes.addFlashAttribute("message", priceService.saveAllList(price.getProduct().getPrices()));
		return "redirect:/product";
	}
}
*/