<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="span9">
	<h3>Edit Product</h3>
	<c:forEach var="image" items="${product.getImages()}">
		<img
			src="${pageContext.request.contextPath}/imageShow/${image.getId()}"
			width="50px" height="50px" />
	</c:forEach>
	<form:form method="POST" modelAttribute="product" action="update">
		<form:hidden path="id" />
		<div class="form-group">
			<form:label path="name" class="control-label col-sm-2">Name:</form:label>
			<div class="col-sm-5">
				<form:input path="name" class="form-control" />
			</div>
			<span class="error text-danger" style="color: red;"><form:errors
					path="name" /></span>
		</div>
		<div class="form-group">
			<form:label path="category" class="control-label col-sm-2">Category :</form:label>
			<div class="col-sm-5">
				<form:select path="category" items="${categories}" itemValue="id"
					itemLabel="name" class="form-control" />
			</div>
			<span class="error text-danger" style="color: red;"><form:errors
					path="category" /></span>
		</div>
		<div class="form-group">
			<form:label path="publisher" class="control-label col-sm-2">Publisher :</form:label>
			<div class="col-sm-5">
				<form:select path="publisher" items="${publishers}"
					itemValue="id" itemLabel="name" class="form-control" />
			</div>
			<span class="error text-danger" style="color: red;"><form:errors
					path="publisher" /></span>
		</div>
		<div class="form-group">
			<form:label path="description" class="control-label col-sm-2">Description:</form:label>
			<div class="col-sm-5">
				<form:textarea path="description" class="form-control" />
			</div>
			<span class="error text-danger" style="color: red;"><form:errors
					path="description" /></span>
		</div>
		<div class="form-group">
			<form:label path="quantity" class="control-label col-sm-2">Quantity :</form:label>
			<div class="col-sm-5">
				<form:input path="quantity" class="form-control" type="number" />
			</div>
			<span class="error text-danger" style="color: red;"><form:errors
					path="quantity" /></span>
		</div>
		<div class="row-fluid">
			<div class="col-sm-4">
				<input type="submit" value="Save" class="col-sm-3 btn btn-success" />
			</div>
			<div class="col-sm-4">
				<a type="button" class="col-sm-3 pull-right btn btn-default"
					href="${pageContext.request.contextPath}/admin/product">Back</a>
			</div>
		</div>
	</form:form>
</div>