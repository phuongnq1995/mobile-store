package org.mobile.controller.home;

import java.util.ArrayList;
import java.util.List;

import org.mobile.category.model.Category;
import org.mobile.category.service.CategoryService;
import org.mobile.publisher.model.Publisher;
import org.mobile.publisher.service.PublisherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class GlobalController {
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	PublisherService publisherService;
	
	@ModelAttribute("categories")
	public List<Category> populateCategories() {
		ArrayList<Category> categories = new ArrayList<Category>();
		categories.addAll(categoryService.findAll());
		return categories;
	}

	@ModelAttribute("publishers")
	public List<Publisher> populatePublisherList() {
		ArrayList<Publisher> publisherList = new ArrayList<Publisher>();
		publisherList.addAll(publisherService.findAll());
		return publisherList;
	}
}
