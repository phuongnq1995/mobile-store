package org.mobile.product.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.mobile.category.model.Category;
import org.mobile.price.model.Price;
import org.mobile.publisher.model.Publisher;

@Entity
@Table(name="product")
public class Product implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@NotNull
	@GeneratedValue
	private int id;
	
	@Column
	@Size(min=2, max=50)
	@NotNull
	private String name;
	
	@Column
	@Size(min=3, max=500)
	private String description;
	
	@ManyToOne @NotNull
	@JoinColumn(name="category_id", nullable = false)
	private Category category;
	
	@ManyToOne @NotNull
	@JoinColumn(name="publisher_id", nullable = false)
	private Publisher publisher;
	
	@OneToMany(mappedBy="product", fetch = FetchType.EAGER, cascade=CascadeType.ALL)
	private List<Price> prices;
	
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
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Publisher getPublisher() {
		return publisher;
	}
	public void setPublisher(Publisher publisher) {
		this.publisher = publisher;
	}
	public List<Price> getPrices() {
		return prices;
	}
	public void setPrices(List<Price> prices) {
		this.prices = prices;
	}
	public Price getCurrentPrice(){
		for(Price price: getPrices()){
			if (price.getCurrent() == true)
				return price;
		}
		return null;
	}
}
