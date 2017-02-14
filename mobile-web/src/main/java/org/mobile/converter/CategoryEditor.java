package org.mobile.converter;

import java.beans.PropertyEditorSupport;

import org.mobile.product.model.Category;
import org.mobile.product.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;

public class CategoryEditor extends PropertyEditorSupport{
	
	@Autowired
	CategoryService categoryService;
	
	@Override
    public void setAsText(String id) 
    {
    	Category category = null;
    	
    	category = categoryService.findOne(Integer.parseInt(id));
    	
    	this.setValue(category);
    }

}
