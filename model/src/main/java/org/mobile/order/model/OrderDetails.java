package org.mobile.order.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.mobile.product.model.Product;

@Entity
@Table(name="orderdetails")
public class OrderDetails implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@Column
	@Min(1)@Max(10)
	private int quantity;
	
	@Column(name="cart_id", nullable=true)
	private Long cartId;
	
	@ManyToOne
	@JoinColumn(name="product_id")
	@NotNull
	private Product product;
	
	@Column
	@Min(0)
	private Long price;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	public Long getCartId() {
		return cartId;
	}

	public void setCartId(Long cartId) {
		this.cartId = cartId;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public OrderDetails(int quantity, Long cartId, Product product, Long price) {
		this.quantity = quantity;
		this.cartId = cartId;
		this.product = product;
		this.price = price;
	}
	public OrderDetails(){}
	
}
