package org.mobile.price.repository;

import java.util.List;

import org.mobile.price.model.Price;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PriceRepository extends JpaRepository<Price, Integer>{
	
	@Query("SELECT p FROM Price p WHERE product_id =:product_id")
	public List<Price> findByProductId(@Param("product_id") int id);

}
