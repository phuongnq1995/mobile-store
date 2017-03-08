package org.mobile.product.service;

import java.util.List;

import org.mobile.price.model.Price;
import org.mobile.product.model.Product;
import org.mobile.product.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductRepository productRepository;
	
	@Transactional
	public List<Product> findAll() {
		return productRepository.findAll();
	}

	public String delete(Long id) {
		if (productRepository.findOne(id) != null) {
			productRepository.delete(id);
			if (productRepository.findOne(id) != null)
				return "Delete fail!";
			else
				return "Deleted Susscess !";
		} else
			return "Not found !";
	}
	
	@Transactional
	public String save(Product product) {
		for(Price price: product.getPrices()){
			price.setCurrent(false);
		}
		product.getPrices().get(product.getPrices().size()-1).setCurrent(true);
		productRepository.save(product);
		return "Save success !";
	}
	
	@Transactional
	public Product findOne(Long id) {
		return productRepository.findOne(id);
	}

	public List<Product> findByCategoryId(int category_id) {
		return productRepository.findByCategoryId(category_id);
	}

	public List<Product> findByPublisherId(int publisher_id) {
		return productRepository.findByPublisherId(publisher_id);
	}

}
