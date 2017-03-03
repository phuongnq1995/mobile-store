<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="container">
	<h3 class="center-block">New Publisher</h3>
</div>
<form:form method="POST" modelAttribute="publisher" action="new"
	class="form-horizontal">
	<div class="form-group">
		<form:label path="name" class="control-label col-sm-2">Name:</form:label>
		<div class="col-sm-5">
			<form:input path="name" class="form-control"/>
			<span class="error text-danger"><form:errors path="name" /></span>
		</div>
	</div>
	<div class="row">
	<div class="col-sm-4">
		<input type="submit" value="Save" class="col-sm-3 pull-right btn btn-success" />
	</div>
	<div class="col-sm-4">
		<a type="button" class="col-sm-3 btn btn-default" href="${pageContext.request.contextPath}/publishers">Back</a>
	</div></div>
</form:form>