package org.mobile.image.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import org.mobile.product.model.Product;

@Entity
@Table(name="image")
public class Image implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id@GeneratedValue
	private int id;
	
	@Column(columnDefinition="longblob")
	private byte[] data;
	
	@ManyToOne
	@JoinColumn(name="product_id")
	private Product product;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Image(){}
}
