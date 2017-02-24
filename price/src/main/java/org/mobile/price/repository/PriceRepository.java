package org.mobile.price.repository;

import java.util.List;

import org.mobile.price.model.Price;
import org.mobile.product.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PriceRepository extends JpaRepository<Price, Integer>{
	
	public List<Price> findByProduct(Product product);

}
