package org.mobile.product.service;

import org.mobile.order.model.Cart;

public interface CartService {

	String save(Cart order);

	Cart findOne(long id);
	
}
