<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="span9">
	<div class="row-fluid">
		<h3 class="center-block">New Product</h3>
	</div>
	<form:form method="POST" modelAttribute="product" action="new"
		enctype="multipart/form-data">
		<form:hidden path="id" />
		<div class="form-group">
			<label for="name" class="control-label col-sm-4">Name </label>
			<div class="col-sm-8">
				<form:input path="name" class="form-control" id="name"
					placeholder="Name..." />
			</div>
			<span class="error text-danger" style="color: red;"><form:errors
					path="name" /></span>
		</div>
		<div class="form-group">
			<form:label path="category" class="control-label col-sm-2">Category </form:label>
			<div class="col-sm-8">
				<form:select path="category" items="${categories}" itemValue="id"
					itemLabel="name" class="form-control" />
			</div>
			<span class="error text-danger" style="color: red;"><form:errors
					path="category" /></span>
		</div>
		<div class="form-group">
			<form:label path="publisher" class="control-label col-sm-2">Publisher </form:label>
			<div class="col-sm-8">
				<form:select path="publisher" items="${publisherList}"
					itemValue="id" itemLabel="name" class="form-control" />
			</div>
			<span class="error text-danger" style="color: red;"><form:errors
					path="publisher" /></span>
		</div>
		<div class="form-group">
			<form:label path="description" class="control-label col-sm-2">Description </form:label>
			<div class="col-sm-8">
				<form:textarea path="description" class="form-control"
					placeholder="Description..." />
			</div>
			<span class="error text-danger" style="color: red;"><form:errors
					path="description" /></span>
		</div>
		<div class="form-group">
			<c:forEach varStatus="vs" items="${product.getPrices()}">
				<form:label path="prices[${vs.index}].money"
					class="control-label col-sm-2">Prices </form:label>
				<div class="col-sm-8">
					<form:input path="prices[${vs.index}].money" class="form-control"
						type="number" placeholder="Input digist.." />

				</div>
				<span class="error text-danger" style="color: red;"><form:errors
						path="prices[${vs.index}].money" /></span>
			</c:forEach>
		</div>
		<div class="form-group">
			<form:label path="quantity" class="control-label col-sm-2">Quantity </form:label>
			<div class="col-sm-8">
				<form:input path="quantity" class="form-control" type="number" />
			</div>
			<span class="error text-danger" style="color: red;"><form:errors
					path="quantity" placeholder="Input digist.." /></span>
		</div>
		<div class="form-group">
			<label for="images" class="control-label col-sm-2">Images </label>
			<div class="col-sm-8">
				<input type="file" name="fileUpload" size="50" accept="image/*"
					class="form-control" />
			</div>
			<div class="col-sm-8">
				<input type="file" name="fileUpload" size="50" accept="image/*"
					class="form-control" />
			</div>
			<div class="col-sm-8">
				<input type="file" name="fileUpload" size="50" accept="image/*"
					class="form-control" />
			</div>
			<div class="col-sm-8">
				<input type="file" name="fileUpload" size="50" accept="image/*"
					class="form-control" />
			</div>
			<div class="col-sm-8">
				<input type="file" name="fileUpload" size="50" accept="image/*"
					class="form-control" />
			</div>
		</div>
		<div class="row-fluid">
			<div class="col-sm-6">
				<input type="submit" value="Save" class="btn btn-success"
					type="button" />
			</div>
			<div class="col-sm-6">
				<a type="button" class="pull-right btn btn-lg btn-default"
					href="${pageContext.request.contextPath}/admin/product">Back</a>
			</div>
		</div>
	</form:form>
</div>