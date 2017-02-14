package org.mobile.converter;

import org.mobile.product.model.Category;
import org.mobile.product.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

final public class StringToCategoryConverter implements Converter<String, Category>{
	
	@Autowired
	CategoryService categoryService;
	
	public Category convert(String id) {
	    Category category = categoryService.findOne(Integer.parseInt(id));
	    // Put your conversion logic here
	    return category;
	}
}
