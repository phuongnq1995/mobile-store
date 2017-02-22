package org.mobile.price.service;

import java.util.List;
import org.mobile.price.model.Price;

public interface PriceService {
	
	List<Price> findByProductId(int id);
	
	String saveAllList(List<Price> prices);
}
