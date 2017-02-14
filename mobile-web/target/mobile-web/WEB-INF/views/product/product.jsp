<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>

<h1>Products List</h1>
<p>${message}</p>
<table>  
<tr><th>Id</th><th>Name</th><th>Description</th><th>Category</th><th>Action</th>
   <c:forEach var="product" items="${products}">   
   <tr>  
	   <td>${product.id}</td>  
	   <td>${product.name}</td>
	   <td>${product.description}</td>
	   <td>${product.category.name}</td>
	   <td><a href="product/${product.id}">Edit</a></td>  
   	   <td><a href="product/delete/${product.id}">Delete</a></td>  
   </tr>  
   </c:forEach>
</table>
<a href="product/new">Add New Product</a>