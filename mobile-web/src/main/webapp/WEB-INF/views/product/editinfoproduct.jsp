<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<h3>Edit Product</h3>
<c:forEach var="image" items="${product.getImages()}">
	<img
		src="${pageContext.request.contextPath}/imageShow/${image.getId()}"
		width="50px" height="50px" />
</c:forEach>
<form:form method="POST" modelAttribute="product" action="update"
	class="form-horizontal">
	<form:hidden path="id" />
	<div class="form-group">
		<form:label path="name" class="control-label col-sm-2">Name:</form:label>
		<div class="col-sm-5">
			<form:input path="name" class="form-control" />
			<span class="error text-danger"><form:errors path="name" /></span>
		</div>
	</div>
	<div class="form-group">
		<form:label path="category" class="control-label col-sm-2">Category :</form:label>
		<div class="col-sm-5">
			<form:select path="category" items="${categories}" itemValue="id"
				itemLabel="name" class="form-control" />
			<span class="error text-danger"><form:errors path="category" /></span>
		</div>
	</div>
	<div class="form-group">
		<form:label path="publisher" class="control-label col-sm-2">Publisher :</form:label>
		<div class="col-sm-5">
			<form:select path="publisher" items="${publisherList}" itemValue="id"
				itemLabel="name" class="form-control" />
			<span class="error text-danger"><form:errors path="publisher" /></span>
		</div>
	</div>
	<div class="form-group">
		<form:label path="description" class="control-label col-sm-2">Description:</form:label>
		<div class="col-sm-5">
			<form:textarea path="description" class="form-control" />
			<span class="error text-danger"><form:errors
					path="description" /></span>
		</div>
	</div>
	<div class="form-group">
		<form:label path="quantity" class="control-label col-sm-2">Quantity :</form:label>
		<div class="col-sm-5">
			<form:input path="quantity" class="form-control" type="number"/>
			<span class="error text-danger"><form:errors path="quantity"/></span>
		</div>
	</div>
	<div class="row">
	<div class="col-sm-4">
		<input type="submit" value="Save" class="col-sm-3 pull-right btn btn-success" />
	</div>
	<div class="col-sm-4">
		<a type="button" class="col-sm-3 btn btn-default" href="${pageContext.request.contextPath}/product">Back</a>
	</div></div>
</form:form>