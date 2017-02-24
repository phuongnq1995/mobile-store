package org.mobile.product.service;

import java.util.List;

import org.mobile.product.model.Product;
import org.springframework.transaction.annotation.Transactional;

public interface ProductService {
	
	@Transactional
	List<Product> findAll();
	
	String delete(int id);
	
	String save(Product product);
	
	@Transactional
	Product findOne(int id);
}
