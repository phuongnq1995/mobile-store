<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<h1>Edit Product</h1>
<form:form method="POST" modelAttribute="product" action="update">
	<table class="table table-striped">
		<tr>
			<td></td>
			<td><form:hidden path="id" /></td>
		</tr>
		<tr>
			<td>Name :</td>
			<td><form:input path="name" /></td>
			<td><form:errors path="name" cssClass="error" /></td>
		</tr>
		<tr>
			<td>Category : <form:select path="category"
					items="${categories}" itemValue="id" itemLabel="name" />
			</td>
			<td><form:errors path="category" cssClass="error" /></td>
		</tr>
		<tr>
			<td>Publisher : <form:select path="publisher"
					items="${publisherList}" itemValue="id" itemLabel="name" />
			</td>
			<td><form:errors path="publisher" cssClass="error" /></td>
		</tr>
		<tr>
			<td>Description :</td>
			<td><form:input path="description" /></td>
			<td><form:errors path="description" cssClass="error" /></td>
		</tr>
		<tr>
			<c:forEach varStatus="vs" items="${product.getPrices()}" var="prices">
				<c:if
					test="${prices.getMoney() != null && prices.getCurrent() == false}">
					<td>Older price: ${prices.getMoney()}</td>
				</c:if>
				<c:if
					test="${prices.getMoney() != null && prices.getCurrent() == true}">
					<td>Current price: ${prices.getMoney()}</td>
				</c:if>
				<c:if test="${prices.getMoney() == null}">
					<td>New price: <form:input path="prices[${vs.index}].money" /></td>
					<td><form:errors path="prices[${vs.index}].money"
							cssClass="error" /></td>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<td><input type="submit" value="Save" /></td>
		</tr>
	</table>
</form:form>