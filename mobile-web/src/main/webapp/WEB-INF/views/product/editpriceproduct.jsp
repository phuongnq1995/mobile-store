<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<h3>Edit Price Product</h3>
<div class="row container">
	<c:if test="${ERROR_MESSAGE != null}">
		<div class="col-sm-3 alert alert-danger">
			<strong>${ERROR_MESSAGE}</strong>
		</div>
	</c:if>
</div>
<c:forEach var="pr" items="${listPrices}">

	<c:if test="${pr.getCurrent() == false}">
		Older price: ${pr.money}$
	</c:if> <c:if test="${pr.getCurrent() == true}">
		Current price: ${pr.money}$
	</c:if>
	<br>
</c:forEach>
<form:form method="POST" modelAttribute="price" action="update">
	<tr>
		<td>New price: <form:input path="money" type="number"/></td>
		<td><form:errors path="money" /></td>
	</tr>
	<tr>
		<td><input type="submit" value="Save" /></td>
	</tr>
</form:form>
