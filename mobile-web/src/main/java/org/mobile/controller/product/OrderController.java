package org.mobile.controller.product;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.mobile.order.model.Order;
import org.mobile.order.model.OrderDetails;
import org.mobile.product.model.Product;
import org.mobile.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/cart")
@SessionAttributes("order")
public class OrderController {

	@Autowired
	ProductService productService;

	private Order checkCart(HttpSession session) {
		Order cart = (Order) session.getAttribute("cart");
		if (cart == null) {
			cart = new Order((long) 0, new ArrayList<OrderDetails>());
		}
		return cart;
	}
	
	@RequestMapping(value = "/addProductToCart/{id}", method = RequestMethod.GET)
	public String addProductToCart(@PathVariable Long id, HttpSession session) throws Exception {
		Product product = productService.findOne(id);
		Order cart = checkCart(session);
		OrderDetails orderDetails = new OrderDetails(1, cart.getId(), product, product.getCurrentPrice().getMoney());
		cart.getListOrderDetails().add(orderDetails);
		cart.setTotal(cart.sumTotal(cart.getListOrderDetails()));
		session.setAttribute("cart", cart);
		return "redirect:/";
	}

	@RequestMapping(value = "/showCart", method = RequestMethod.GET)
	public String showCart(HttpSession session, Model model) {
		Order cart = checkCart(session);
		model.addAttribute("order", cart);
		return "order";
	}

	@RequestMapping(value = "/remove/{index}", method = RequestMethod.GET)
	public String removeFormCart(@PathVariable int index, HttpSession session) {
		Order cart = checkCart(session);
		OrderDetails orderDetails = cart.getListOrderDetails().get(index);
		cart.getListOrderDetails().remove(orderDetails);
		cart.setTotal(cart.sumTotal(cart.getListOrderDetails()));
		session.setAttribute("cart", cart);
		return "redirect:/cart/showCart";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String updateCart(HttpSession session, @Valid Order order, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "order";
		}
		order.setTotal(order.sumTotal(order.getListOrderDetails()));
		session.setAttribute("cart", order);
		return "redirect:/";
	}

}
