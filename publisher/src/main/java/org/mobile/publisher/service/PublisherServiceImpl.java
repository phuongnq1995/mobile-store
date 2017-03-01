package org.mobile.publisher.service;

import java.util.List;

import org.mobile.publisher.model.Publisher;
import org.mobile.publisher.repository.PublisherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PublisherServiceImpl implements PublisherService{

	@Autowired
	PublisherRepository publisherRepository;
	
	public List<Publisher> findAll() {
		return publisherRepository.findAll();
	}

	public Publisher findOne(int id) {
		return publisherRepository.findOne(id);
	}
	
	public String save(Publisher publisher){
		publisherRepository.save(publisher);
		return "Save success !";
	}

	public String delete(int id) {
		publisherRepository.delete(id);
		return "Delete success !";
	}

	public Publisher findByName(String name) {
		return publisherRepository.findByName(name);
	}
	
	
}
