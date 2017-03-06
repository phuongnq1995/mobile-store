<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="span9">
	<div class="row-fluid">
		<div class="col-xs-4 col-md-4">
			<h3>Products List</h3>
		</div>
		<div class="col-xs-8 col-md-8">
			<div class="btn-group btn-group-justified pull-right">
				<a type="button" class="btn btn-default"
					href="${pageContext.request.contextPath}/admin/product">Products</a>
				<a type="button" class="btn btn-default"
					href="${pageContext.request.contextPath}/admin/categories">Categories</a>
				<a type="button" class="btn btn-default"
					href="${pageContext.request.contextPath}/admin/publishers">Publishers</a>
			</div>
		</div>
	</div>
	<br/>
	<div class="row-fluid">
		<br />
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
	<div class="row-fluid">
		<a href="product/new"><i class="fa fa-plus-square-o"
			style="font-size: 16px">&nbsp;Add new product...</i></a>
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
									<li><a href="product/image/${product.id}">Edit
											Images</a></li>
									<li><a href="product/price/${product.id}">Edit
											Prices</a></li>
								</ul>
							</div></td>
						<td><a role="button" class="btn btn-danger"
							data-toggle="modal" href="#myModal_${product.id}">Delete</a>
							<div class="modal fade bs-example-modal-sm"
								id="myModal_${product.id}">
								<div class="modal-dialog modal-sm">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Are You Sure?</h4>
										</div>
										<div class="modal-body">
											<p>Your data will lost&hellip;</p>
										</div>
										<div class="modal-footer">
											<a href="product/delete/${product.id}"
												class="btn btn-danger pull-left" type="button">Delete</a>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
					</tr>
				</c:forEach>
			<tbody>
		</table>
	</div>
</div>