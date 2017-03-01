<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="container">
	<h3 class="center-block">Save Category</h3>
</div>
<form:form method="POST" modelAttribute="category" action="save"
	class="form-horizontal">
	<div class="form-group">
		<form:label path="name" class="control-label col-sm-2">Name:</form:label>
		<div class="col-sm-5">
			<form:input path="name" class="form-control" />
			<span class="error text-danger"><form:errors path="name" /></span>
		</div>
	</div>
	<div class="form-group">
		<form:label path="description" class="control-label col-sm-2">Description:</form:label>
		<div class="col-sm-5">
			<form:input path="description" class="form-control" />
			<span class="error text-danger"><form:errors
					path="description" /></span>
		</div>
	</div>
	<div class="col-sm-5">
		<input type="submit" value="Save" class="col-sm-3 pull-right" />
	</div>
</form:form>