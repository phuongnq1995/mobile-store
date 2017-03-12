<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="sidebar" class="span3">
	<div class="well well-small">
		<c:choose>
			<c:when test="${empty sessionScope.cart.listOrderDetails}">
				<a id="myCart"
					href="${pageContext.request.contextPath}/cart/showCart"><img
					src="<c:url value="/resources/images/ico-cart.png"/>" alt="cart">0
					Items in your cart <span class="badge badge-warning pull-right">$0.00</span></a>
			</c:when>
			<c:otherwise>
				<a id="myCart"
					href="${pageContext.request.contextPath}/cart/showCart"><img
					src="<c:url value="/resources/images/ico-cart.png"/>" alt="cart">${sessionScope.cart.listOrderDetails.size()}
					Items in your cart <span class="badge badge-warning pull-right">$${sessionScope.cart.total}.00</span>
				</a>
			</c:otherwise>
		</c:choose>
	</div>
	<ul id="sideManu" class="nav nav-tabs nav-stacked">
		<c:if test="${not empty categories}">
			<li class="subMenu open"><a> CATEGORIES
					[${categories.size()}]</a>
				<ul>
					<c:forEach items="${categories}" var="category">
						<li><a class="active"
							href="${pageContext.request.contextPath}/productbycategory/${category.id}"><i
								class="icon-chevron-right"></i>${category.name} (${category.getProducts().size()}) </a></li>
					</c:forEach>
				</ul></li>
		</c:if>
		<c:if test="${not empty publishers}">
			<li class="subMenu open"><a> PUBLISHERS [${publishers.size()}] </a>
				<ul>
					<c:forEach items="${publishers}" var="publisher">
						<li><a class="active"
							href="${pageContext.request.contextPath}/productbypublisher/${publisher.id}"><i
								class="icon-chevron-right"></i>${publisher.name} (${publisher.getProducts().size()})</a></li>
					</c:forEach>
				</ul></li>
		</c:if>
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