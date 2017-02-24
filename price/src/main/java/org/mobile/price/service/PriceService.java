package org.mobile.price.service;

import java.util.List;
import org.mobile.price.model.Price;
import org.mobile.product.model.Product;

public interface PriceService {
	
	List<Price> findByProduct(Product product);
	
	String saveAllList(List<Price> prices);
}
