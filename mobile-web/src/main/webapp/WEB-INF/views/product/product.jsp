<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>Products List</h1>
<p>${message}</p>
<div class="container">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Description</th>
				<th>Category</th>
				<th>Publisher</th>
				<th>Price</th>
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
					<td>${product.getCurrentPrice().money}</td>
					<td><c:forEach var="image" items="${product.getImages()}">
							<img src="${pageContext.request.contextPath}/imageShow/${image.id}"
								class="img-thumbnail" width="50px" height="50px" />
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
					<td><a href="product/delete/${product.id}" class="btn btn-danger" type="button">Delete</a></td>
				</tr>
			</c:forEach>
		<tbody>
	</table>
</div>
<a href="product/new">Add New Product</a>
