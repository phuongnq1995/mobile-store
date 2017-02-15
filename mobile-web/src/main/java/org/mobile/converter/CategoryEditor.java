package org.mobile.converter;

import java.beans.PropertyEditorSupport;

import org.mobile.category.model.Category;

public class CategoryEditor extends PropertyEditorSupport{
	
	@Override
    public void setAsText(String id) 
    {
    	Category category = null;
    	
    	category = new Category(Integer.parseInt(id), "name", "description");
    	
    	this.setValue(category);
    }

}
