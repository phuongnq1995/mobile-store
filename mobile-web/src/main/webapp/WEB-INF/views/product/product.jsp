<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
	<div class="col-xs-9 col-md-7">
		<h3>Products List</h3>
	</div>
	<div class="col-xs-3 col-md-5">
		<div class="dropdown pull-right">
			<div class="btn-group">
				<button type="button" class="btn btn-primary btn-lg dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					Admins Manager <span class="caret"></span>
				</button>
				<ul class="dropdown-menu dropdown-menu-right">
					<li><a href="categories">Manager category <i
							style="font-size: 24px" class="fa">&#xf1d1;</i></a></li>
					<li><a href="publishers">Manager publisher <i
							style="font-size: 16px" class="fa">&#xf0f9;</i></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="row container">
	<c:if test="${SUCCESS_MESSAGE != null}">
		<div class="col-sm-5 alert alert-success">
			<strong>${SUCCESS_MESSAGE}</strong>
		</div>
	</c:if>
	<c:if test="${ERROR_MESSAGE != null}">
		<div class="col-sm-5 alert alert-danger">
			<strong>${ERROR_MESSAGE}</strong>
		</div>
	</c:if>
</div>
<div class="container">
	<a href="product/new"><i class="fa fa-plus-square-o"
		style="font-size: 16px">Add New Product</i></a>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Description</th>
				<th>Category</th>
				<th>Publisher</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Images</th>
				<th>Actions</th>
		</thead>
		<tbody>
			<c:forEach var="product" items="${products}">
				<tr>
					<td>${product.id}</td>
					<td>${product.name}</td>
					<td>${product.description}</td>
					<td>${product.category.name}</td>
					<td>${product.publisher.name}</td>
					<td>${product.getCurrentPrice().money}$</td>
					<td>${product.getQuantity()}</td>
					<td><c:forEach var="image" items="${product.getImages()}">
							<img
								src="${pageContext.request.contextPath}/imageShow/${image.getId()}"
								width="50px" height="50px" />
						</c:forEach></td>
					<td><div class="dropdown">
							<button class="btn btn-warning dropdown-toggle" type="button"
								data-toggle="dropdown">
								Edit <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="product/info/${product.id}">Edit
										Information</a></li>
								<li><a href="product/image/${product.id}">Edit Images</a></li>
								<li><a href="product/price/${product.id}">Edit Prices</a></li>
							</ul>
						</div></td>
					<td><a href="product/delete/${product.id}"
						class="btn btn-danger" type="button">Delete</a></td>
				</tr>
			</c:forEach>
		<tbody>
	</table>
</div>

