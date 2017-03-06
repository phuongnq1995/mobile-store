package org.mobile.controller.price;

import java.util.List;
import javax.validation.Valid;
import org.mobile.price.model.Price;
import org.mobile.price.service.PriceService;
import org.mobile.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@SessionAttributes("price")
@RequestMapping("/admin")
public class PriceController {

	@Autowired
	private PriceService priceService;

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/product/price/{product_id}", method = RequestMethod.GET)
	String editPricesProduct(Model model, @PathVariable int product_id) {
		model.addAttribute("listPrices", productService.findOne(product_id).getPrices());
		Price price = new Price();
		price.setProductId(product_id);
		model.addAttribute("price", price);
		return "editpriceproduct";
	}

	@RequestMapping(value = "/product/price/update", method = RequestMethod.POST)
	String updatePricesProduct(RedirectAttributes redirectAttributes, @Valid Price price, BindingResult bindingResult)
			throws Exception {
		if (bindingResult.hasErrors()) {
			String messages = "";
			String err = "";
			for (Object object : bindingResult.getAllErrors()) {
			    if(object instanceof FieldError) {
			        FieldError fieldError = (FieldError) object;
			        err = fieldError.getField().toString() + fieldError.getDefaultMessage();
			    }

			    if(object instanceof ObjectError) {
			        ObjectError objectError = (ObjectError) object;
			        err = objectError.getObjectName()+" "+ objectError.getDefaultMessage();
			    }
		        messages = messages+" "+ err;
			}
			redirectAttributes.addFlashAttribute("ERROR_MESSAGE", messages);
			return "redirect:/admin/product/price/" + price.getProductId();
		} else {
			List<Price> prices = productService.findOne(price.getProductId()).getPrices();
			for (Price pr : prices) {
				pr.setCurrent(false);
			}
			price.setCurrent(true);
			prices.add(price);
			redirectAttributes.addFlashAttribute("SUCCESS_MESSAGE", priceService.saveAllList(prices));
		}
		return "redirect:/admin/product";
	}
}
