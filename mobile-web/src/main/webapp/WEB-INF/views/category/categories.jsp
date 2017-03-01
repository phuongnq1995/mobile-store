<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
	<h3 class="col-sm-5">Category List</h3>
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
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Description</th>
				<th>Action</th>
		</thead>
		<tbody>
			<c:forEach var="category" items="${categories}">
				<tr>
					<td>${category.id}</td>
					<td>${category.name}</td>
					<td>${category.description}</td>
					<td><a href="category/${category.id}"
						class="btn btn-warning" type="button">Edit</a></td>
					<td><a href="category/delete/${category.id}"
						class="btn btn-danger" type="button" >Delete</a></td>
				</tr>
			</c:forEach>
		<tbody>
	</table>
</div>

