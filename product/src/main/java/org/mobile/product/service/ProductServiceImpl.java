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
	
	@Transactional
	public String save(Product product) {
		for(Price price: product.getPrices()){
			price.setCurrent(false);
		}
		product.getPrices().get(product.getPrices().size()-1).setCurrent(true);
		productRepository.save(product);
		return "Save success !";
	}

	public Product findOne(int id) {
		return productRepository.findOne(id);
	}

}
