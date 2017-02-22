package org.mobile.price.service;

import java.util.List;
import org.mobile.price.model.Price;
import org.mobile.price.repository.PriceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PriceServiceImpl implements PriceService{

	@Autowired
	private PriceRepository priceRepository;

	public List<Price> findByProductId(int id) {
		return priceRepository.findByProductId(id);
	}
	
	@Transactional
	public String saveAllList(List<Price> prices) {
		priceRepository.save(prices);
		return "Save success !";
	}

}
