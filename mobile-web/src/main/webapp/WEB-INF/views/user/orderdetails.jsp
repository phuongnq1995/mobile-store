<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="span9">
	<hr class="soften">
	<h1>Order Details</h1>
	<hr class="soften" />
	<div class="row-fluid">
		<div class="span3">
			<h4>Customer Details</h4>
			<h5>Address</h5>
			<p>${user.getStreet()},${user.getState()}, ${user.getCity()}</p>
			<h5>Contact</h5>
			<p>Name: ${user.getFullName()}</p>
			<p>Email: ${user.getEmail()}</p>
			<p>﻿Phone: ${user.getPhone()}</p>
		</div>

		<div class="span3">
			<h4>Time Ship</h4>
			<h5>Three day ago</h5>
			<p>09:00am - 09:00pm</p>
		</div>
		<div class="span3">
			<h4>Your cart</h4>
			<c:forEach items="${order.getListOrderDetails()}" var="orderDetails">
				<img width="100" height="80"
					src="${pageContext.request.contextPath}/imageShow/${orderDetails.getProduct().getImages().get(0).getId()}"
					alt="" />
				<h4>${orderDetails.getProduct().getName()}</h4>
				<h5>Quantity: ${orderDetails.getProduct().getQuantity()}</h5>
				<h5>Price: $${orderDetails.price * orderDetails.quantity}.00</h5>
			</c:forEach>
			<h3>Total: $${order.getTotal()}.00</h3>
		</div>
	</div>
	<a href="${pageContext.request.contextPath}/" class="btn btn-large"><i
		class="fa fa-long-arrow-left"></i> Continue Shopping </a>
</div>