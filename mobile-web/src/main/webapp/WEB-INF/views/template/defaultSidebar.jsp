<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="sidebar" class="span3">
	<div class="well well-small">
		<%
			if (session.getAttribute("cart") == null) {
		%>
		<a id="myCart" href="product_summary.html"><img
			src="<c:url value="/resources/images/ico-cart.png"/>" alt="cart">0
			Items in your cart <span class="badge badge-warning pull-right">$0.00</span></a>
		<%
			} else {
		%>
		<a id="myCart" href="product_summary.html"><img
			src="<c:url value="/resources/images/ico-cart.png"/>" alt="cart">${cart.listOrderDetails.size()}
			Items in your cart <span class="badge badge-warning pull-right">$${cart.total}.00</span>
		</a>
		<%
			}
		%>
	</div>
	<ul id="sideManu" class="nav nav-tabs nav-stacked">
		<li class="subMenu open"><a> CATEGORIES [230]</a>
			<ul>
				<c:forEach items="${categories}" var="category">
					<li><a class="active"
						href="${pageContext.request.contextPath}/productbycategory/${category.id}"><i
							class="icon-chevron-right"></i>${category.name} (100) </a></li>
				</c:forEach>
			</ul></li>
		<li class="subMenu open"><a> PUBLISHERS [840] </a>
			<ul>
				<c:forEach items="${publishers}" var="publisher">
					<li><a class="active"
						href="${pageContext.request.contextPath}/productbypublisher/${publisher.id}"><i
							class="icon-chevron-right"></i>${publisher.name} (45)</a></li>
				</c:forEach>
			</ul></li>
		<li class="subMenu"><a>FOOD AND BEVERAGES [1000]</a>
			<ul style="display: none">
				<li><a href="products.html"><i class="icon-chevron-right"></i>Angoves
						(35)</a></li>
				<li><a href="products.html"><i class="icon-chevron-right"></i>Bouchard
						Aine & Fils (8)</a></li>
				<li><a href="products.html"><i class="icon-chevron-right"></i>French
						Rabbit (5)</a></li>
				<li><a href="products.html"><i class="icon-chevron-right"></i>Louis
						Bernard (45)</a></li>
				<li><a href="products.html"><i class="icon-chevron-right"></i>BIB
						Wine (Bag in Box) (8)</a></li>
				<li><a href="products.html"><i class="icon-chevron-right"></i>Other
						Liquors & Wine (5)</a></li>
				<li><a href="products.html"><i class="icon-chevron-right"></i>Garden
						(3)</a></li>
				<li><a href="products.html"><i class="icon-chevron-right"></i>Khao
						Shong (11)</a></li>
			</ul></li>
		<li><a href="products.html">HEALTH & BEAUTY [18]</a></li>
		<li><a href="products.html">SPORTS & LEISURE [58]</a></li>
		<li><a href="products.html">BOOKS & ENTERTAINMENTS [14]</a></li>
	</ul>
	<br />
	<div class="thumbnail">
		<img src="<c:url value="/resources/images/payment_methods.png"/>"
			title="Bootshop Payment Methods" alt="Payments Methods">
		<div class="caption">
			<h5>Payment Methods</h5>
		</div>
	</div>
</div>