<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="span9">
	<div class="row-fuild">
		<h3 class="center-block">New Category</h3>
	</div>
	<form:form method="POST" modelAttribute="category" action="new">
		<div class="form-group">
			<form:label path="name" class="control-label col-sm-2">Name:</form:label>
			<div class="col-sm-5">
				<form:input path="name" class="form-control" />
			</div>
			<span class="error text-danger" style="color: red;"><form:errors
					path="name" /></span>
		</div>
		<div class="form-group">
			<form:label path="description" class="control-label col-sm-2">Description:</form:label>
			<div class="col-sm-5">
				<form:input path="description" class="form-control" />
			</div>
			<span class="error text-danger" style="color: red;"><form:errors
					path="description" /></span>
		</div>
		<div class="row-fuild">
			<div class="col-sm-4">
				<input type="submit" value="Save" class="col-sm-3 btn btn-success" />
			</div>
			<div class="col-sm-4">
				<a type="button" class="col-sm-3 pull-right btn btn-default"
					href="${pageContext.request.contextPath}/admin/categories">Back</a>
			</div>
		</div>
	</form:form>
</div>