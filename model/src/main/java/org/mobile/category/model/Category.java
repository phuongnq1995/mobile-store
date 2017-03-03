package org.mobile.category.model;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.mobile.product.model.Product;


@Entity
@Table(name="category")
public class Category implements Serializable{

		private static final long serialVersionUID = 1L;
		
		@Id@GeneratedValue(strategy=GenerationType.AUTO)
		private int id;
		
		@Column
		@Size(min=2, max=32)
		@Pattern(regexp="([a-zA-Z0-9-_ ]+)", message="Not contain special characters.")
		private String name;
		
		@Column
		@Size(min=3, max=500)
		private String description;
		
		public Category(int id, String name, String description) {
			super();
			this.id = id;
			this.name = name;
			this.description = description;
		}

		@OneToMany(mappedBy="category", fetch=FetchType.EAGER)
		private Set<Product> products;

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

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public Set<Product> getProducts() {
			return products;
		}

		public void setProducts(Set<Product> products) {
			this.products = products;
		}

		@Override
		public String toString() {
			return "Category [id=" + id + ", name=" + name + ", description=" + description + ", products=" + products
					+ "]";
		}
		
		public Category(){
		}
}
