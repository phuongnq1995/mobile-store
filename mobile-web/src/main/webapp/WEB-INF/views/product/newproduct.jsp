<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<h1>Save Product</h1>
<form:form method="POST" modelAttribute="product" action="save"
	enctype="multipart/form-data">
	<table>
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
			<td>Price :</td>
			<c:forEach varStatus="vs" items="${product.getPrices()}">
				<td><form:input path="prices[${vs.index}].money" /></td>
				<td><form:errors path="prices[${vs.index}].money"
						cssClass="error" /></td>
			</c:forEach>
		</tr>
		<tr>
			<td>Image :
				<input type="file" name="fileUpload" size="50" />
				<input type="file" name="fileUpload" size="50" />
				<input type="file" name="fileUpload" size="50" />
			</td>
		</tr>
		<tr>
			<td><input type="submit" value="Save" /></td>
		</tr>
	</table>
</form:form>
