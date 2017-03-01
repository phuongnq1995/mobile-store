<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="container">
	<h3 class="center-block">New Product</h3>
</div>
<form:form method="POST" modelAttribute="product" action="new"
	enctype="multipart/form-data" class="form-horizontal">
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
		<c:forEach varStatus="vs" items="${product.getPrices()}">
			<form:label path="prices[${vs.index}].money"
				class="control-label col-sm-2">Prices :</form:label>
			<div class="col-sm-5">
				<form:input path="prices[${vs.index}].money" class="form-control"
				   type="number" placeholder="Input digist.." />
				<span class="error text-danger"><form:errors
						path="prices[${vs.index}].money" /></span>
			</div>
		</c:forEach>
	</div>
	<div class="form-group">
		<form:label path="quantity" class="control-label col-sm-2">Quantity :</form:label>
		<div class="col-sm-5">
			<form:input path="quantity" class="form-control" type="number" />
			<span class="error text-danger"><form:errors path="quantity"
				placeholder="Input digist.." /></span>
		</div>
	</div>
	<div class="form-group">
		<label for="images" class="control-label col-sm-2">Images:</label>
		<div class="col-sm-10">
			<input type="file" name="fileUpload" size="50" accept="image/*" /> <input
				type="file" name="fileUpload" size="50" accept="image/*" /> <input
				type="file" name="fileUpload" size="50" accept="image/*" /> <input
				type="file" name="fileUpload" size="50" accept="image/*" /> <input
				type="file" name="fileUpload" size="50" accept="image/*" />
		</div>
	</div>
	<div class="col-sm-5">
		<input type="submit" value="Save" class="col-sm-3 pull-right" />
	</div>
</form:form>
