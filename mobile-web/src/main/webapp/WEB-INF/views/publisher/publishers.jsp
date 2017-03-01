<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
	<h3 class="col-sm-5">Publisher List</h3>
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
<a href="publisher/new"><i class="fa fa-plus-square-o"
	style="font-size: 16px">Add New Publisher</i></a>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Action</th>
		</thead>
		<tbody>
			<c:forEach var="publisher" items="${publishers}">
				<tr>
					<td>${publisher.id}</td>
					<td>${publisher.name}</td>
					<td><a href="publisher/${publisher.id}"
						class="btn btn-warning" type="button">Edit</a></td>
					<td><a href="publisher/delete/${publisher.id}"
						class="btn btn-danger" type="button">Delete</a></td>
				</tr>
			</c:forEach>
		<tbody>
	</table>
</div>
