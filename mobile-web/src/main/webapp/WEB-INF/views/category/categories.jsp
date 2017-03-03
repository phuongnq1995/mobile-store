<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
	<div class="col-xs-4 col-md-4">
		<h3>Categories</h3>
	</div>
	<div class="col-xs-8 col-md-8">
			<div class="btn-group btn-group-justified pull-right">
				<a type="button" class="btn btn-default" href="${pageContext.request.contextPath}/product">Products</a>
				<a type="button" class="btn btn-default" href="${pageContext.request.contextPath}/categories">Categories</a>
				<a type="button" class="btn btn-default" href="${pageContext.request.contextPath}/publishers">Publishers</a>
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
	<a href="category/new"><i class="fa fa-plus-square-o"
		style="font-size: 16px">Add New Category</i></a>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Description</th>
					<th>Action</th>
				</tr>
			</thead>
			<c:forEach var="category" items="${categories}">
				<tbody>
					<tr>
						<td>${category.id}</td>
						<td>${category.name}</td>
						<td>${category.description}</td>
						<td><a href="category/${category.id}" class="btn btn-warning"
							type="button">Edit</a></td>
						<td><a role="button" class="btn btn-danger"
							data-toggle="modal" href="#myModal_${category.id}">Delete</a>
							<div class="modal fade bs-example-modal-sm"
								id="myModal_${category.id}">
								<div class="modal-dialog modal-sm">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Are You Sure?</h4>
										</div>
										<div class="modal-body">
											<p>You have to delete all products of this
												category&hellip;</p>
										</div>
										<div class="modal-footer">
											<a href="category/delete/${category.id}"
												class="btn btn-danger pull-left" type="button">Delete</a>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div></td>
					</tr>
				<tbody>
			</c:forEach>
		</table>
	</div>
</div>

