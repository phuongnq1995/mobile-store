package org.mobile.order.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.Valid;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name="order")
public class Order implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@Column(nullable=true)
	private String email;
	
	@Column
	private Long total;
	
	@OneToMany(cascade=CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name="order_id")
	@Valid
	private List<OrderDetails> listOrderDetails;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

	public List<OrderDetails> getListOrderDetails() {
		return listOrderDetails;
	}

	public void setListOrderDetails(List<OrderDetails> listOrderDetails) {
		this.listOrderDetails = listOrderDetails;
	}

	public Order(Long total, List<OrderDetails> listOrderDetails) {
		this.total = total;
		this.listOrderDetails = listOrderDetails;
	}
	public Order(){}
	
	public Long sumTotal(List<OrderDetails> listOrderDetails){
		long sum = 0;
		for (OrderDetails orderDetails : listOrderDetails) {
			sum += (orderDetails.getPrice() * orderDetails.getQuantity());
		}
		return sum;
	}
}
