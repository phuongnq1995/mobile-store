<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="span9">
	<form:form modelAttribute="order" action="save">
		<ul class="breadcrumb">
			<li><a href="index.html">Home</a> <span class="divider">/</span></li>
			<li class="active">SHOPPING CART</li>
		</ul>
		<h3>
			SHOPPING CART [ <small>${order.getListOrderDetails().size()}
				Item(s) </small>]<a href="products.html" class="btn btn-large pull-right"><i
				class="fa fa-long-arrow-left"></i> Continue Shopping </a>
		</h3>
		<hr class="soft" />
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Product</th>
					<th>Description</th>
					<th>Quantity/Update</th>
					<th>Price</th>
					<th>Discount</th>
					<th>Tax</th>
					<th>Total</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach varStatus="vs" items="${order.getListOrderDetails()}"
					var="orderDetails">
					<tr>
						<td><img width="60"
							src="${pageContext.request.contextPath}/imageShow/${orderDetails.getProduct().getImages().get(0).getId()}"
							alt="" /></td>
						<td>MASSA AST<br />Color : black, Material : metal
						</td>
						<td>
							<div class="input-append">
								<form:input path="listOrderDetails[${vs.index}].quantity"
									type="number" placeholder="1" class="span1"
									style="max-width: 34px" min="1" />
								<form:errors path="listOrderDetails[${vs.index}].quantity" />
								<form:errors path="listOrderDetails[${vs.index}].cartId" />
								<form:errors path="listOrderDetails[${vs.index}].product" />
								<form:errors path="listOrderDetails[${vs.index}].price" />
								<button class="btn" type="button">
									<i class="fa fa-minus"></i>
								</button>
								<button class="btn" type="button">
									<i class="fa fa-plus"></i>
								</button>
								<a
									href="${pageContext.request.contextPath}/cart/remove/${vs.index}"
									class="btn btn-danger" type="button"> <i
									class="fa fa-remove"></i>
								</a>
							</div>
						</td>
						<td>$${orderDetails.getPrice()}.00</td>
						<td>$0.00</td>
						<td>$0.00</td>
						<td>$${orderDetails.price * orderDetails.quantity}.00</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="6" style="text-align: right"><strong>TOTAL
					</strong></td>
					<td class="label label-important" style="display: block"><strong>
							$${order.total}.00 </strong></td>
				</tr>
			</tbody>
		</table>
		<a href="products.html" class="btn btn-large"><i
			class="fa fa-long-arrow-left"></i> Continue Shopping </a>
		<input type="submit" value="Next"
			class="btn btn-large pull-right btn-success" type="button">
	</form:form>
</div>
