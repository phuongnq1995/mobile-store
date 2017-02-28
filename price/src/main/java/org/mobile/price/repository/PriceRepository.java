package org.mobile.price.repository;

import org.mobile.price.model.Price;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface PriceRepository extends JpaRepository<Price, Integer> {

	@Modifying
	@Transactional
	@Query("delete from Price p where p.productId =:productId")
	void deleteByProductId(@Param("productId") int productId);
}
