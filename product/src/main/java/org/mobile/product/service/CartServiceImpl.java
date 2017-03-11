package org.mobile.product.service;

import org.mobile.order.model.Cart;
import org.mobile.product.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	CartRepository orderRepository;
	
	@Transactional
	public String save(Cart order) {
		orderRepository.save(order);
		return "Save success !";
	}
	
}
