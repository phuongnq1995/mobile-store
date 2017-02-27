package org.mobile.price.service;

import java.util.List;
import org.mobile.price.model.Price;

public interface PriceService {
	
	String saveAllList(List<Price> prices);
}
