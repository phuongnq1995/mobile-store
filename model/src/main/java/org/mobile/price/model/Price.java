package org.mobile.price.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.mobile.product.model.Product;

@Entity
@Table(name="price")
public class Price implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id@GeneratedValue
	private int id;
	
	@Column
	private Long money;
	
	@Column
	private boolean current = true;
	
	@ManyToOne
	@JoinColumn(name="product_id", nullable = false)
	private Product product;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Long getMoney() {
		return money;
	}
	public void setMoney(Long money) {
		this.money = money;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Boolean getCurrent() {
		return current;
	}
	public void setCurrent(Boolean current) {
		this.current = current;
	}
	public Price(){}
	
	public Price(int id, Long money, Boolean current) {
		this.id = id;
		this.money = money;
		this.current = current;
	}
	
}
