<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="span9">
	<ul class="breadcrumb">
		<li><a href="index.html">Home</a> <span class="divider">/</span></li>
		<li class="active">SHOPPING CART</li>
	</ul>
	<h3>
		SHOPPING CART [ <small>3 Item(s) </small>]<a href="products.html"
			class="btn btn-large pull-right"><i class="icon-arrow-left"></i>
			Continue Shopping </a>
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
			<form:form modelAttribute="cart" action="save">
				<c:forEach varStatus="vs" items="${cart.getListOrderDetails()}"
					var="listOrderDetails">
					<tr>
						<td><img width="60"
							src="${pageContext.request.contextPath}/imageShow/${listOrderDetails.getProduct().getImages().get(0).getId()}"
							alt="" /></td>
						<td>MASSA AST<br />Color : black, Material : metal
						</td>
						<td>
							<div class="input-append">
								<form:input path="listOrderDetails[${vs.index}].quantity"
									type="number" placeholder="1" class="span1"
									style="max-width: 34px" />
								<form:errors path="listOrderDetails[${vs.index}].quantity" />

								<button class="btn" type="button">
									<i class="icon-minus"></i>
								</button>
								<button class="btn" type="button">
									<i class="icon-plus"></i>
								</button>
								<button class="btn btn-danger" type="button">
									<i class="icon-remove icon-white"></i>
								</button>
							</div>
						</td>
						<td>$${listOrderDetails.getPrice()}.00</td>
						<td>$0.00</td>
						<td>$0.00</td>
						<td>$${listOrderDetails.price * listOrderDetails.quantity}.00</td>
					</tr>
				</c:forEach>
			</form:form>
			<tr>
				<td colspan="6" style="text-align: right"><strong>TOTAL
						($228 - $50 + $31) =</strong></td>
				<td class="label label-important" style="display: block"><strong>
						$155.00 </strong></td>
			</tr>
		</tbody>
	</table>
	<a href="products.html" class="btn btn-large"><i
		class="icon-arrow-left"></i> Continue Shopping </a> <a href="login.html"
		class="btn btn-large pull-right">Next <i class="icon-arrow-right"></i></a>
</div>
