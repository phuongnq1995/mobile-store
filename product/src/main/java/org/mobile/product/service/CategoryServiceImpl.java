package org.mobile.product.service;

import java.util.List;

import org.mobile.product.model.Category;
import org.mobile.product.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	CategoryRepository categoryRepository;

	public List<Category> findAll() {
		return categoryRepository.findAll();
	}

	public Category findOne(int id) {
		return categoryRepository.findOne(id);
	}
	
}
