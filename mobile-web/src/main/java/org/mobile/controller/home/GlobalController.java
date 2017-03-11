package org.mobile.controller.home;

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
		return categoryService.findAll();
	}

	@ModelAttribute("publishers")
	public List<Publisher> populatePublisherList() {
		return publisherService.findAll();
	}

}
