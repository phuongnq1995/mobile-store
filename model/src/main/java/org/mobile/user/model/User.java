package org.mobile.user.model;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.mobile.order.model.Cart;

@Entity
@Table(name = "user")
public class User implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@NotNull
	private String email;

	@Column
	private String password;

	@Transient
	private String passwordConfirm;

	@Column(name = "fullname")
	@NotNull
	private String fullName;

	@Column
	@NotNull
	private String street;
	
	@Column
	@NotNull
	private String state;
	
	@Column
	@NotNull
	private String city;
	
	@Column
	private String phone;
	
	@ManyToMany
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "email"), inverseJoinColumns = @JoinColumn(name = "role_id"))
	@LazyCollection(LazyCollectionOption.FALSE)
	private Set<Role> roles;
	
	@OneToMany(mappedBy="user",cascade=CascadeType.ALL, fetch = FetchType.EAGER)
	private List<Cart> carts;
	
	public List<Cart> getCarts() {
		return carts;
	}

	public void setCarts(List<Cart> carts) {
		this.carts = carts;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public User() {
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddress(){
		return this.street+" - "+this.state+" - "+this.city;
	}

}
