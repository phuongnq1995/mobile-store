<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h3>Edit Price Product</h3>
<form:form method="POST" modelAttribute="product" action="update">
	<c:forEach varStatus="vs" items="${product.getPrices()}" var="price">
		<c:if
			test="${price.getMoney() != null && price.getCurrent() == false}">
			<p>Older price: ${price.getMoney()}</p>
		</c:if>
		<c:if test="${price.getMoney() != null && price.getCurrent() == true}">
			<p>Current price: ${price.getMoney()}</p>
		</c:if>
		<c:if test="${price.getMoney() == null}">
			<td>New price: <form:input path="prices[${vs.index}].money" /></td>
			<td><form:errors path="prices[${vs.index}].money" cssClass="error" /></td>
		</c:if>
	</c:forEach>
	<input type="submit" value="Update">
</form:form>
