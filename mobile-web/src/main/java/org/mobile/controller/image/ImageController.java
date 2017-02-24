package org.mobile.controller.image;

import org.mobile.image.model.Image;
import org.mobile.image.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ImageController {

	@Autowired
	private ImageService imageService;

	@RequestMapping(value = "/imageShow/{id}")
	@ResponseBody
	public byte[] showImage(@PathVariable int id) {
		Image image = imageService.findOne(id);
		if (image != null) {
			System.out.println("In here");
			return image.getData();
		}
		return null;
	}
}
