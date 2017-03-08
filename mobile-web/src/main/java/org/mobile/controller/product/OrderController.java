package org.mobile.controller.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mobile.order.model.Order;
import org.mobile.order.model.OrderDetails;
import org.mobile.product.model.Product;
import org.mobile.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/cart")
public class OrderController {

	@Autowired
	ProductService productService;

	@RequestMapping(value = "/addProductToCart/{id}", method = RequestMethod.GET)
	public String addProductToCart(@PathVariable Long id, HttpSession session, Model model) throws Exception{
		Product product = productService.findOne(id);
		Order cart = new Order((long) 0, new ArrayList<OrderDetails>());
		OrderDetails orderDetails = new OrderDetails(1, cart.getId(), product, product.getCurrentPrice().getMoney());
		System.out.println("so luong: "+orderDetails.getQuantity());
		System.out.println("gia : "+orderDetails.getPrice());
		cart.getListOrderDetails().add(orderDetails);
		model.addAttribute("cart", cart);
		return "order";
	}
}
