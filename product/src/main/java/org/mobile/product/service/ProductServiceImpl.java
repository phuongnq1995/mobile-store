package org.mobile.product.service;

import java.util.List;

import org.mobile.product.model.Category;
import org.mobile.product.model.Product;
import org.mobile.product.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionService;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductRepository productRepository;
	
	@Autowired
	ConversionService conversionService;
	
	public List<Product> findAll() {
		return productRepository.findAll();
	}

	public String delete(int id) {
		if (productRepository.findOne(id) != null){
			productRepository.delete(id);
			if (productRepository.findOne(id) != null)
				return "Delete fail!";
			else
				return "Deleted Susscess !";
			}
		else 
			return "Not found !";
	}

	public Product getProduct(int id) {
			return productRepository.findOne(id);
	}

	public String save(Product product) {
		conversionService.convert(product.getCategory(), Category.class);
		productRepository.save(product);
		return "Save success !";
	}

	public Product findOne(int id) {
		return productRepository.findOne(id);
	}
	
}
