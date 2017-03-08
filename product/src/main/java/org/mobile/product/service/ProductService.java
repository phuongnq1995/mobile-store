package org.mobile.product.service;

import java.util.List;

import org.mobile.product.model.Product;
public interface ProductService {
	
	List<Product> findAll();
	
	String delete(Long id);
	String save(Product product);
	
	Product findOne(Long id);

	List<Product> findByCategoryId(int category_id);

	List<Product> findByPublisherId(int publisher_id);
}
