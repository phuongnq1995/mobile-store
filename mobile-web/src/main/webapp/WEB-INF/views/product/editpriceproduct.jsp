<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<h3>Edit Price Product</h3>
<c:forEach var="pr" items="${listPrices}">
	Old Price: ${pr.money}"
</c:forEach>
<form:form method="POST" modelAttribute="price" action="update">
	<form:hidden path="id" />
	<form:input path="money"/>
	<input type="submit" value="Save">
</form:form>
