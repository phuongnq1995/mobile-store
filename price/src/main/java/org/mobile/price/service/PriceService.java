package org.mobile.price.service;

import java.util.List;
import org.mobile.price.model.Price;
import org.springframework.transaction.annotation.Transactional;
@Transactional
public interface PriceService {
	
	String saveAllList(List<Price> prices);

	String deleteByProductId(Long productId);
}
