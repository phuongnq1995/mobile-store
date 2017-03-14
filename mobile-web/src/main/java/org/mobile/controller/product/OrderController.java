package org.mobile.controller.product;

import java.security.Principal;
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
import org.springframework.transaction.annotation.Transactional;
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

	@Transactional
	@RequestMapping(value = "/addProductToCart/{id}", method = RequestMethod.GET)
	public String addProductToCart(@PathVariable Long id, HttpSession session) throws Exception {
		Product product = productService.findOne(id);
		Cart cart = checkCart(session);
		for (OrderDetails orderDetails : cart.getListOrderDetails()) {
			if (orderDetails.getProduct().getId() == id) {
				orderDetails.setQuantity(orderDetails.getQuantity() + 1);
				return "redirect:/cart/showCart";
			}
		}
		OrderDetails orderDetails = new OrderDetails(1, cart.getId(), product, product.getCurrentPrice().getMoney());
		cart.getListOrderDetails().add(orderDetails);
		cart.setTotal(cart.sumTotal(cart.getListOrderDetails()));
		session.setAttribute("cart", cart);
		return "redirect:/cart/showCart";
	}

	@Transactional
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
	public String showCart(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
		Cart cart = checkCart(session);
		if (cart.getListOrderDetails().isEmpty()) {
			redirectAttributes.addFlashAttribute("ERROR_MESSAGE", "Your cart is empty !");
			return "redirect:/";
		} else {
			model.addAttribute("order", cart);
			return "order";
		}
	}

	@Transactional
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String updateCart(HttpSession session, @ModelAttribute("order") @Valid Cart order,
			BindingResult bindingResult, Model model, Principal principal) {
		if (bindingResult.hasErrors()) {
			return "order";
		}
		order.setTotal(order.sumTotal(order.getListOrderDetails()));
		session.setAttribute("cart", order);
		if (principal == null) {
			return "redirect:/cart/orderaddress";
		} else {
			User user = userService.findUser(principal.getName());
			ArrayList<Cart> orders = new ArrayList<Cart>();
			order.setUser(user);
			orders.add(order);
			user.setCarts(orders);
			userService.insert(user);
			model.addAttribute("user", user);
			model.addAttribute("cart", order);
			order = null;
			session.setAttribute("cart", order);
			return "orderdetails";
		}
	}

	@RequestMapping(value = "/orderaddress", method = RequestMethod.GET)
	public String getUser(Model model) {
		model.addAttribute("user", new User());
		return "orderaddress";
	}

	@Transactional
	@RequestMapping(value = "/orderaddress", method = RequestMethod.POST)
	public String orderCart(HttpSession session, @Valid User user, BindingResult bindingResult, Model model)
			throws Exception {
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null || cart.getListOrderDetails().isEmpty()) {
			return "redirect:/";
		}
		if (userService.findUserPresent(user.getEmail())) {
			bindingResult.rejectValue("email", "Duplicate.email");
		}
		if (bindingResult.hasErrors()) {
			return "orderaddress";
		}
		ArrayList<Cart> orders = new ArrayList<Cart>();
		cart.setUser(user);
		orders.add(cart);
		user.setCarts(orders);
		userService.insert(user);
		model.addAttribute("user", user);
		model.addAttribute("order", cart);
		cart = null;
		session.setAttribute("cart", cart);
		return "orderdetails";
	}

}
