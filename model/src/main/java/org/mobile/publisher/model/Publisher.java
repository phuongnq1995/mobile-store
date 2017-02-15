package org.mobile.publisher.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.mobile.product.model.Product;


@Entity
@Table(name="publisher")
public class Publisher implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id@GeneratedValue
	private int id;
	
	@Column
	private String name;
	
	@OneToMany(mappedBy="publisher", fetch=FetchType.EAGER)
	Set<Product> products;
	
	public Publisher(){
	}
	
	public Publisher(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Product> getProducts() {
		return products;
	}

	
}
