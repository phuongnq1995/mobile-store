package org.mobile.publisher.service;

import java.util.List;
import org.mobile.publisher.model.Publisher;

public interface PublisherService {
	
	List<Publisher> findAll();

	Publisher findOne(int id);
	
	String save(Publisher publisher);

	String delete(int id);

	Publisher findByName(String name);
}
