package org.mobile.publisher.repository;

import org.mobile.publisher.model.Publisher;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PublisherRepository extends JpaRepository<Publisher, Integer>{

	Publisher findByName(String name);

}
