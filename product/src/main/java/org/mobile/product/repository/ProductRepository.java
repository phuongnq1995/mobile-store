package org.mobile.product.repository;


import org.mobile.product.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
public interface ProductRepository extends JpaRepository<Product, Integer>{
	
}
