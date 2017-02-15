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

}
