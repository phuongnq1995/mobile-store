package org.mobile.converter;

import java.beans.PropertyEditorSupport;
import org.mobile.publisher.model.Publisher;

public class PublisherEditor extends PropertyEditorSupport{
	
	public void setAsText(String id) 
    {
    	Publisher publisher = null;
    	
    	publisher = new Publisher(Integer.parseInt(id), "name");
    	
    	this.setValue(publisher);
    	
    }
}
