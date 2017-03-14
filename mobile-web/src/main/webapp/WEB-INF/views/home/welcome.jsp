<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<div class="span9">
	<ul class="breadcrumb">
		<li class="active">Home</li>
	</ul>
	<div class="row-fluid">
		<br />
		<c:if test="${SUCCESS_MESSAGE != null}">
			<div class="col-sm-5 alert alert-success">
				<strong>${SUCCESS_MESSAGE}</strong>
			</div>
		</c:if>
		<c:if test="${ERROR_MESSAGE != null}">
			<div class="col-sm-5 alert alert-danger">
				<strong>${ERROR_MESSAGE}</strong>
			</div>
		</c:if>
	</div>
	<div class="well well-small">
		<c:if test="${not empty productList}">
			<h4>
				Featured Products <small class="pull-right"> new products</small>
			</h4>
			<div class="row-fluid">
				<div id="featured" class="carousel slide">
					<div class="carousel-inner">
						<div class="item active">
							<ul class="thumbnails">
								<c:forEach var="product" items="${productList}">
									<li class="span3">
										<div class="thumbnail">
											<a href="product_details.html"><img
												src="${pageContext.request.contextPath}/imageShow/${product.getImages().get(0).getId()}"
												alt="" style="width: 260px; height: 250px;"></a>
											<div class="caption">
												<h5>${product.name}</h5>
												<h4>
													<a class="btn"
														href="${pageContext.request.contextPath}/productdetails/${product.getId()}">VIEW</a>
													<span class="pull-right">$${product.getCurrentPrice().money}.00</span>
												</h4>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="item">
							<ul class="thumbnails">
								<c:forEach var="product" items="${productList}">
									<li class="span3">
										<div class="thumbnail">
											<a href="product_details.html"><img
												src="${pageContext.request.contextPath}/imageShow/${product.getImages().get(0).getId()}"
												alt="" style="width: 260px; height: 250px;"></a>
											<div class="caption">
												<h5>${product.name}</h5>
												<h4>
													<a class="btn"
														href="${pageContext.request.contextPath}/productdetails/${product.getId()}">VIEW</a>
													<span class="pull-right">$${product.getCurrentPrice().getMoney()}</span>
												</h4>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<a class="left carousel-control" href="#featured" data-slide="next"><i
						class="fa fa-chevron-left" style="font-size: 38px"></i></a> <a
						class="right carousel-control" href="#featured" data-slide="prev"><i
						class="fa fa-chevron-right" style="font-size: 38px"></i></a>
				</div>
			</div>
		</c:if>
	</div>
	<h4>List Products</h4>
	<ul class="thumbnails" id="result">
		<c:forEach var="product" items="${searchProducts}">
			<li class="span3">
				<div class="thumbnail">
					<a href="product_details.html"><img
						src="${pageContext.request.contextPath}/imageShow/${product.getImages().get(0).getId()}"
						alt="" style="width: 260px; height: 250px;" /></a>
					<div class="caption">
						<h5>${product.name}</h5>
						<p>${product.description}</p>
						<h4 style="text-align: center">
							<a class="btn"
								href="${pageContext.request.contextPath}/productdetails/${product.getId()}"><i
								class="fa fa-search-plus" style="font-size: 20px"></i></a> <a
								class="btn"
								href="${pageContext.request.contextPath}/cart/addProductToCart/${product.id}"
								style="font-size: 15px">Add to <i
								class="fa fa-shopping-cart" style="font-size: 20px"></i></a> <a
								class="btn btn-primary" href="#">$${product.getCurrentPrice().money}.00
							</a>
						</h4>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
</div>
