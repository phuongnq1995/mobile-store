package org.mobile.image.repository;

import org.mobile.image.model.Image;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface ImageRepository extends JpaRepository<Image, Integer>{
	
}