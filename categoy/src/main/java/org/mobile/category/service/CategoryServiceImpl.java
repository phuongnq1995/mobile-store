package org.mobile.category.service;

import java.util.List;

import org.mobile.category.model.Category;
import org.mobile.category.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	CategoryRepository categoryRepository;
	
	public List<Category> findAll() {
		return categoryRepository.findAll();
	}

	public String save(Category category) {
		categoryRepository.save(category);
		return "Save success !";
	}

	public String delete(int id) {
		categoryRepository.delete(id);
		return "Delete susscess !";
	}

	public Category findOne(int id) {
		return categoryRepository.findOne(id);
	}

	public Category findByName(String name) {
		return categoryRepository.findByName(name);
	}
}
