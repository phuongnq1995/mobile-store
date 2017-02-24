package org.mobile.image.service;

import org.mobile.image.model.Image;
import org.springframework.transaction.annotation.Transactional;

public interface ImageService {
	
	@Transactional
	Image findOne(int id);
}
