package org.mobile.image.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.mobile.product.model.Product;

@Entity
@Table(name="image",indexes = { @Index(columnList = "id",    unique = true) })
public class Image implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id@GeneratedValue
	private int id;
	
	@Lob
	@Column(nullable=false, updatable=true)
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

}
