package org.mobile.price.service;

import java.util.List;
import org.mobile.price.model.Price;
import org.mobile.price.repository.PriceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PriceServiceImpl implements PriceService{

	@Autowired
	private PriceRepository priceRepository;

	public String saveAllList(List<Price> prices) {
		priceRepository.save(prices);
		return "Save success !";
	}

	public String deleteByProductId(Long productId) {
		priceRepository.deleteByProductId(productId);
		return "Delete success !";
	}

}
