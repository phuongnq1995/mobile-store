package org.mobile.product.service;

import java.util.ArrayList;
import java.util.List;

import org.mobile.image.model.Image;
import org.mobile.product.model.Product;
import org.mobile.product.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductRepository productRepository;

	public List<Product> findAll() {
		return productRepository.findAll();
	}

	public String delete(int id) {
		if (productRepository.findOne(id) != null) {
			productRepository.delete(id);
			if (productRepository.findOne(id) != null)
				return "Delete fail!";
			else
				return "Deleted Susscess !";
		} else
			return "Not found !";
	}

	public Product getProduct(int id) {
		return productRepository.findOne(id);
	}

	public String save(Product product) {
		ArrayList<Image> images = (ArrayList<Image>) product.getImages();
		for (int i = images.size()-1; i >= 0 ; i--){
			if(images.get(i).getData().length <= 0)
				images.remove(i);
		}
		product.setImages(images);
		
		productRepository.save(product);
		return "Save success !";
	}

	public Product findOne(int id) {
		return productRepository.findOne(id);
	}

}
