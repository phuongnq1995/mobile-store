<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<h3>Edit Price Product</h3>
<c:forEach var="pr" items="${listPrices}">
	<div class="row">
		<c:if test="${pr.getCurrent() == false}">

			<label class="control-label col-sm-2">Older price:
				${pr.money}$ </label>
		</c:if>
		<c:if test="${pr.getCurrent() == true}">
			<label class="control-label col-sm-2">Current price:
				${pr.money}$ </label>
		</c:if>
	</div>
</c:forEach>
<div class="row container">
	<c:if test="${ERROR_MESSAGE != null}">
		<div class="col-sm-3 alert alert-danger">
			<strong>${ERROR_MESSAGE}</strong>
		</div>
	</c:if>
</div>
<form:form method="POST" modelAttribute="price" action="update">
	<span class="error text-danger"><form:errors path="money" /></span>
	<div class="form-group row">
		<form:label path="money" class="control-label col-sm-2">New price: </form:label>
		<div class="col-sm-3">
			<form:input path="money" class="form-control" type="number" />
			<span class="error text-danger"><form:errors path="money" /></span>
		</div>
	</div>
	<div class="row">
		<input type="submit" value="Save" class="btn btn-success" />
		<a type="button" class="btn btn-default" href="${pageContext.request.contextPath}/product">Back</a>
	</div>
</form:form>
