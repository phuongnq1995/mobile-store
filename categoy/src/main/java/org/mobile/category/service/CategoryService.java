package org.mobile.category.service;

import java.util.List;

import org.mobile.category.model.Category;

public interface CategoryService {
	
	List<Category> findAll();

	String save(Category category);

	String delete(int id);
	
	Category findOne(int id);

	Category findByName(String name);
	
}
