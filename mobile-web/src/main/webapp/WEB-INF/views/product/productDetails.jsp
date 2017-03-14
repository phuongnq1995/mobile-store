<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="span9">
	<ul class="breadcrumb">
		<li><a href="index.html">Home</a> <span class="divider">/</span></li>
		<li><a href="products.html">Products</a> <span class="divider">/</span></li>
		<li class="active">product Details</li>
	</ul>
	<div class="row">
		<div id="gallery" class="span3">
			<a
				href="${pageContext.request.contextPath}/imageShow/${product.getImages().get(0).getId()}"
				title="Fujifilm FinePix S2950 Digital Camera"><img
				src="${pageContext.request.contextPath}/imageShow/${product.getImages().get(0).getId()}"
				alt="" style="width: 260px; height: 250px;"> </a>
			<div id="differentview" class="moreOptopm carousel slide">
				<div class="carousel-inner">
					<c:forEach items="${product.getImages()}" var="image">
						<div class="item active">
							<a
								href="${pageContext.request.contextPath}/imageShow/${image.getId()}">
								<img style="width: 29%"
								src="${pageContext.request.contextPath}/imageShow/${image.getId()}"
								alt="" />
							</a>
						</div>
						<div class="item">
							<a
								href="${pageContext.request.contextPath}/imageShow/${image.getId()}">
								<img style="width: 29%"
								src="${pageContext.request.contextPath}/imageShow/${image.getId()}"
								alt="" />
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="span6">
			<h3>${product.getName()}</h3>
			<small>-product of ${product.getPublisher().getName()}</small>
			<hr class="soft" />
			<form class="form-horizontal qtyFrm">
				<div class="control-group">
					<label class="control-label"><span>$${product.getCurrentPrice().getMoney()}.00</span></label>
					<div class="controls">
						<a
							href="${pageContext.request.contextPath}/cart/addProductToCart/${product.getId()}"
							type="submit" class="btn btn-large btn-primary pull-right">
							Add to cart <i class="fa fa-shopping-cart"
							style="font-size: 20px"></i>
						</a>
					</div>
				</div>
			</form>

			<hr class="soft" />
			<h4>${product.getQuantity()}items in stock</h4>
			<form class="form-horizontal qtyFrm pull-right">
				<div class="control-group">
					<label class="control-label"><span>Color</span></label>
					<div class="controls">
						<select class="span2">
							<option>Black</option>
							<option>Red</option>
							<option>Blue</option>
							<option>Brown</option>
						</select>
					</div>
				</div>
			</form>
			<hr class="soft clr" />
			<p>${product.getDescription()}</p>
		</div>
	</div>
</div>