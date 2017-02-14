package org.mobile.product.service;

import java.util.List;

import org.mobile.product.model.Category;

public interface CategoryService {
	
	List<Category> findAll();
	
	Category findOne(int id);
	
}
