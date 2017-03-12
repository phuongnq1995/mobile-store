package org.mobile.product.repository;


import java.util.List;

import org.mobile.product.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
@Transactional
public interface ProductRepository extends JpaRepository<Product, Long>{
	
	@Query("select p from Product p where p.category.id = :categoryId")
	public List<Product> findByCategoryId(@Param("categoryId") int category_id);
	
	@Query("select p from Product p where p.publisher.id = :publisherId")
	public List<Product> findByPublisherId(@Param("publisherId") int publisher_id);
	
	@Query(value="SELECT * FROM product ORDER BY id DESC LIMIT 4", nativeQuery = true)
	public List<Product> findLast4Products();
}
