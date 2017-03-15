<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="span9">
	<ul class="breadcrumb">
		<li><a href="index.html">Home</a> <span class="divider">/</span></li>
		<li class="active">Special offers</li>
	</ul>
	<h4>
		Special offer<small class="pull-right"> ${products.size()}
			products are available </small>
	</h4>
	<hr class="soft" />

	<form class="form-horizontal span6">
		<div class="control-group">
			<label class="control-label alignL">Sort By </label> <select>
				<option>Priduct name A - Z</option>
				<option>Priduct name Z - A</option>
				<option>Priduct Stoke</option>
				<option>Price Lowest first</option>
			</select>
		</div>
	</form>
	<div class="tab-pane active" id="blockView">
		<ul class="thumbnails">
			<c:if test="${not empty products}">
				<c:forEach items="${products}" var="product">
					<li class="span3">
						<div class="thumbnail">
							<a
								href="${pageContext.request.contextPath}/productdetails/${product.getId()}"><img
								src="${pageContext.request.contextPath}/imageShow/${product.getImages().get(0).getId()}"
								alt="" style="width: 260px; height: 250px;" /></a>
							<div class="caption">
								<div style="height: 30px;"><h5>${product.getName()}</h5></div>
								<div style="height: 30px;"><p>${product.getDescription()}.</p></div>
								<h4 style="text-align: center">
									<a class="btn"
										href="${pageContext.request.contextPath}/productdetails/${product.getId()}">
										<i class="fa fa-search-plus" style="font-size: 20px"></i>
									</a> <a class="btn"
										href="${pageContext.request.contextPath}/cart/addProductToCart/${product.getId()}">Add
										to <i class="fa fa-shopping-cart" style="font-size: 20px"></i>
									</a> <a class="btn btn-primary" href="#">&euro;${product.getCurrentPrice().getMoney()}.00</a>
								</h4>
							</div>
						</div>
					</li>
				</c:forEach>
			</c:if>
		</ul>
		<hr class="soft" />
	</div>
	<div class="pagination">
		<ul>
			<li><a href="#">&lsaquo;</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">...</a></li>
			<li><a href="#">&rsaquo;</a></li>
		</ul>
	</div>
	<br class="clr" />
</div>

