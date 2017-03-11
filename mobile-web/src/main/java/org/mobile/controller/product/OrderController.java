package org.mobile.controller.product;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.mobile.order.model.Cart;
import org.mobile.order.model.OrderDetails;
import org.mobile.product.model.Product;
import org.mobile.product.service.CartService;
import org.mobile.product.service.ProductService;
import org.mobile.user.model.User;
import org.mobile.user.service.UserService;
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
@RequestMapping("/cart")
@SessionAttributes("order")
public class OrderController {

	@Autowired
	ProductService productService;

	@Autowired
	CartService orderService;

	@Autowired
	UserService userService;

	private Cart checkCart(HttpSession session) {
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart((long) 0, new ArrayList<OrderDetails>());
		}
		return cart;
	}

	@RequestMapping(value = "/addProductToCart/{id}", method = RequestMethod.GET)
	public String addProductToCart(@PathVariable Long id, HttpSession session) throws Exception {
		Product product = productService.findOne(id);
		Cart cart = checkCart(session);
		OrderDetails orderDetails = new OrderDetails(1, cart.getId(), product, product.getCurrentPrice().getMoney());
		cart.getListOrderDetails().add(orderDetails);
		cart.setTotal(cart.sumTotal(cart.getListOrderDetails()));
		session.setAttribute("cart", cart);
		return "redirect:/";
	}

	@RequestMapping(value = "/remove/{index}", method = RequestMethod.GET)
	public String removeFormCart(@PathVariable int index, HttpSession session) {
		Cart cart = checkCart(session);
		OrderDetails orderDetails = cart.getListOrderDetails().get(index);
		cart.getListOrderDetails().remove(orderDetails);
		cart.setTotal(cart.sumTotal(cart.getListOrderDetails()));
		session.setAttribute("cart", cart);
		return "redirect:/cart/showCart";
	}
	
	@RequestMapping(value = "/showCart", method = RequestMethod.GET)
	public String showCart(HttpSession session, Model model) {
		Cart cart = checkCart(session);
		model.addAttribute("order", cart);
		return "order";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String updateCart(HttpSession session, @ModelAttribute("order") @Valid Cart order, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "order";
		}
		order.setTotal(order.sumTotal(order.getListOrderDetails()));
		session.setAttribute("cart", order);
		return "redirect:/cart/orderaddress";
	}
	
	@RequestMapping(value="/orderaddress", method = RequestMethod.GET)
	public String getUser(Model model){
		model.addAttribute("user", new User());
		return "orderaddress";
	}

	@RequestMapping(value = "/orderaddress", method = RequestMethod.POST)
	public String orderCart(RedirectAttributes redirectAttributes, HttpSession session, @Valid User user,
			BindingResult bindingResult)throws Exception {
		Cart cart = (Cart) session.getAttribute("cart");
		System.out.println("cart :"+ cart.getTotal());
		
		if (cart.getListOrderDetails().isEmpty()) {
			return "redirect:/";
		}
		if (bindingResult.hasErrors()) {
			return "orderaddress";
		}
			ArrayList<Cart> orders = new ArrayList<Cart>();
			cart.setUser(user);
			orders.add(cart);
			user.setCarts(orders);
			userService.save(user);
			cart = null;
			session.setAttribute("cart", cart);
		return "redirect:/";
	}
}
