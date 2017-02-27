package org.mobile.price.repository;

import org.mobile.price.model.Price;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PriceRepository extends JpaRepository<Price, Integer>{
	
}
