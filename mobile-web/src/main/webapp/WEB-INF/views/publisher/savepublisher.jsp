<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="container">
	<h3 class="center-block">Edit Publisher</h3>
</div>
<div class="row container">
	<c:if test="${SUCCESS_MESSAGE != null}">
		<div class="col-sm-3 alert alert-success">
			<strong>${SUCCESS_MESSAGE}</strong>
		</div>
	</c:if>
	<c:if test="${ERROR_MESSAGE != null}">
		<div class="col-sm-3 alert alert-danger">
			<strong>${ERROR_MESSAGE}</strong>
		</div>
	</c:if>
</div>
<form:form method="POST" modelAttribute="publisher" action="save"
	class="form-horizontal">
	<div class="form-group">
		<form:label path="name" class="control-label col-sm-2">Name:</form:label>
		<div class="col-sm-5">
			<form:input path="name" class="form-control"/>
			<span class="error text-danger"><form:errors path="name" /></span>
		</div>
	</div>
	<div class="col-sm-5">
		<input type="submit" value="Save" class="col-sm-3 pull-right" />
	</div>
</form:form>