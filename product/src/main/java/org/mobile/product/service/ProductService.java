package org.mobile.product.service;

import java.util.List;

import org.mobile.product.model.Product;

public interface ProductService {
	
	List<Product> findAll();
	
	String delete(int id);
	
	String save(Product product);
	
	Product findOne(int id);
}
